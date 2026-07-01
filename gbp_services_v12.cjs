const fs = require('fs');
const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "";
    }
}

let ensureNmxScript = `
tell application "Google Chrome"
    activate
    set found to false
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" and (u contains "Kassia" or title of t contains "Kassia") then
                set has_nmx to execute t javascript "document.body.innerText.toLowerCase().includes('compania ta') || document.body.innerText.toLowerCase().includes('editează profilul') || document.body.innerText.toLowerCase().includes('edit profile')"
                if has_nmx is true then
                    set active tab index of w to tabIndex
                    set index of w to 1
                    set found to true
                    exit repeat
                end if
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if found is true then exit repeat
    end repeat
    if found is false then return "NOT_FOUND"
    
    -- Verify NMX parameters
    set activeWin to first window
    set activeTab to active tab of activeWin
    set js_extract to "
    (function() {
        let text = document.body.innerText.toLowerCase();
        let has_kassia = text.includes('kassia events');
        let has_modifica = text.includes('modifică serviciile') || text.includes('edit services');
        let has_compania = text.includes('compania ta pe google') || text.includes('your business on google');
        let has_editeaza = text.includes('editează profilul') || text.includes('edit profile');
        let is_nmx = has_compania || has_editeaza || has_modifica;
        
        let lines = document.body.innerText.split('\\\\n').map(l=>l.trim()).filter(l=>l.length>0);
        let relevant = lines.filter(l => l.toLowerCase().includes('kassia') || l.toLowerCase().includes('compania') || l.toLowerCase().includes('servici')).slice(0, 10);
        
        return JSON.stringify({
            is_nmx_panel: is_nmx,
            has_kassia_events: has_kassia,
            has_modifica_serviciile: has_modifica,
            has_compania_ta_pe_google: has_compania,
            has_editeaza_profilul: has_editeaza,
            url: window.location.href,
            title: document.title,
            visible_relevant_lines: relevant
        });
    })();
    "
    return execute activeTab javascript js_extract
end tell
`;

let nmxProofStr = runAppleScript(ensureNmxScript);
if (!nmxProofStr || nmxProofStr === "NOT_FOUND") {
    console.log(JSON.stringify({ step1: { is_nmx_panel: false }, error: "NMX not found" }, null, 2));
    process.exit(0);
}

let step1 = JSON.parse(nmxProofStr);
if (!step1.is_nmx_panel) {
    console.log(JSON.stringify({ step1, error: "is_nmx_panel false" }, null, 2));
    process.exit(0);
}

// Open modal
let clickServicesScript = `
tell application "Google Chrome"
    set activeWin to first window
    set activeTab to active tab of activeWin
    execute activeTab javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip]'));
        let editBtn = btns.find(b => {
            let txt = (b.innerText || '').toLowerCase().trim();
            return txt === 'modifică serviciile' || txt === 'edit services' || txt === 'editează serviciile';
        });
        if (editBtn) {
            editBtn.scrollIntoView({behavior: 'instant', block: 'center', inline: 'center'});
            editBtn.focus();
            editBtn.click();
            
            // dispatch mouse events
            let events = ['mousedown', 'mouseup'];
            events.forEach(en => {
                let ev = document.createEvent('MouseEvents');
                ev.initEvent(en, true, true);
                editBtn.dispatchEvent(ev);
            });
            
            return 'CLICKED';
        }
        return 'NOT_FOUND';
    })();"
end tell
`;

let clickRes = runAppleScript(clickServicesScript);
if (clickRes !== 'CLICKED') {
    console.log(JSON.stringify({ step1, error: "Modifică serviciile button not found" }, null, 2));
    process.exit(0);
}

// Poll for modal
let step2 = {
    services_panel_opened: false,
    dialog_detected: false,
    panel_title_detected: "",
    existing_services: [],
    available_suggested_services: [],
    custom_service_button_available: false,
    requires_description: false,
    requires_price: false,
    raw_services_lines: []
};

let modalFound = false;
for (let i = 0; i < 6; i++) {
    execSync('sleep 2');
    let extractModalScript = `
    tell application "Google Chrome"
        set activeWin to first window
        set activeTab to active tab of activeWin
        execute activeTab javascript "
        (function() {
            let t = document.body.innerText.toLowerCase();
            let isServicesOpen = t.includes('adaugă un serviciu personalizat') || t.includes('add custom service') || t.includes('adaugă un alt serviciu');
            if (!isServicesOpen) return 'NO_DIALOG';
            
            // Try to find the closest container to extract clean lines
            let container = Array.from(document.querySelectorAll('div')).find(d => {
                let dTxt = d.innerText.toLowerCase();
                return dTxt.includes('adaugă un serviciu personalizat') && d.offsetHeight > 300 && d.offsetWidth > 300;
            }) || document.body;
            
            let dialogBtns = Array.from(container.querySelectorAll('button, div[role=button]'));
            let customBtn = true;

            let reqDesc = container.querySelectorAll('textarea').length > 0;
            let reqPrice = container.querySelectorAll('input[type=number], input[name*=price]').length > 0;

            let lines = container.innerText.split('\\\\n').map(l => l.trim()).filter(l => l.length > 0);
            
            let h = container.querySelector('h1, h2, h3');
            let title = h ? h.innerText : lines[0] || '';

            return JSON.stringify({
                customBtn: customBtn,
                reqDesc: reqDesc,
                reqPrice: reqPrice,
                lines: lines,
                title: title
            });
        })();"
    end tell
    `;
    let modalRes = runAppleScript(extractModalScript);
    if (modalRes && modalRes !== 'NO_DIALOG') {
        let data = JSON.parse(modalRes);
        step2.dialog_detected = true;
        step2.services_panel_opened = true;
        step2.panel_title_detected = data.title;
        step2.custom_service_button_available = data.customBtn;
        step2.requires_description = data.reqDesc;
        step2.requires_price = data.reqPrice;
        step2.raw_services_lines = data.lines;
        modalFound = true;
        break;
    }
}

// Close modal safely
if (modalFound) {
    runAppleScript(`
    tell application "Google Chrome"
        set activeWin to first window
        set activeTab to active tab of activeWin
        execute activeTab javascript "
        (function() {
            let dialogs = Array.from(document.querySelectorAll('div[role=dialog]'));
            let sDialog = dialogs.find(d => d.innerText.toLowerCase().includes('servici'));
            if (sDialog) {
                let dialogBtns = Array.from(sDialog.querySelectorAll('button, div[role=button]'));
                let cancelBtn = dialogBtns.find(b => {
                    let t = (b.innerText || '').toLowerCase();
                    return t === 'anulează' || t === 'cancel' || t === 'închide' || t === 'close';
                });
                if (cancelBtn) cancelBtn.click();
            }
        })();"
    end tell
    `);
}

let services_to_add = [
    "Evenimente corporatiste", "Evenimente la școală", "Design decorațiuni pentru evenimente",
    "Animatori petreceri copii", "Animatori copii București", "Animatori copii Ilfov", "Organizare petreceri copii",
    "Petreceri tematice copii", "Mascote pentru petreceri copii", "Personaje pentru petreceri copii",
    "Pictură pe față copii", "Modelaj baloane copii", "Mini-disco copii", "Jocuri interactive pentru copii",
    "Animatori botez", "Animatori moț și turtă", "Ursitoare botez", "Animatori grădiniță",
    "Animatori școală și serbări", "Animatori copii la restaurant", "Deschideri grădinițe",
    "Deschideri școli", "Deschideri restaurante", "Animatori copii evenimente corporate", "Family Day copii",
    "Moș Crăciun la evenimente", "Iepuraș de Paște la evenimente", "Decoruri baloane pentru evenimente",
    "Decorațiuni baloane copii", "Arcade din baloane", "Ghirlande din baloane", "Panouri foto pentru evenimente",
    "Photo corner evenimente", "Baloane cu heliu", "Stand vată de zahăr", "Stand popcorn",
    "Standuri dulciuri pentru evenimente", "Pachete animatori și baloane", "Mascote pentru grădinițe",
    "Mascote pentru școli", "Mascote pentru evenimente corporate"
];

let forbidden_services = [
    "Catering", "Coordonare conferințe", "Coordonare evenimente de team building", "Evenimente corporative și conferințe"
];

let step3 = {
    services_to_add: services_to_add,
    services_already_present: [],
    services_to_skip_duplicates: [],
    forbidden_services_present: [],
    forbidden_services_to_remove_or_unselect: [],
    cannot_add_services: [],
    reasons: []
};

if (!modalFound) {
    step3.cannot_add_services = services_to_add;
    step3.reasons.push("Panoul de servicii nu s-a deschis (services_panel_opened=false).");
} else {
    const normalize = str => str.toLowerCase()
        .replace(/ă/g, 'a')
        .replace(/â/g, 'a')
        .replace(/î/g, 'i')
        .replace(/ș/g, 's')
        .replace(/ț/g, 't')
        .trim();

    // The text inside the dialog lines represents existing selected services
    // NMX generally displays categories (e.g. "Fotograf de nunți") and specific services.
    // If it's already on the screen inside the modal, it is present.
    let rawTextNormalized = step2.raw_services_lines.map(normalize).join(" ");
    
    services_to_add.forEach(s => {
        if (rawTextNormalized.includes(normalize(s))) {
            step3.services_already_present.push(s);
            step3.services_to_skip_duplicates.push(s);
        }
    });
    
    step3.services_to_add = services_to_add.filter(s => !step3.services_already_present.includes(s));
    
    forbidden_services.forEach(s => {
        if (rawTextNormalized.includes(normalize(s))) {
            step3.forbidden_services_present.push(s);
            step3.forbidden_services_to_remove_or_unselect.push(s);
        }
    });
}

console.log(JSON.stringify({ step1, step2, step3 }, null, 2));
