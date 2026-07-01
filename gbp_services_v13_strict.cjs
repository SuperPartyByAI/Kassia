const fs = require('fs');
const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "";
    }
}

// Common function string to find the exact NMX tab
const getTabScriptPrefix = `
    set nmxTab to missing value
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" and (u contains "Kassia" or title of t contains "Kassia") then
                set has_nmx to execute t javascript "document.body.innerText.toLowerCase().includes('compania ta') || document.body.innerText.toLowerCase().includes('editează profilul') || document.body.innerText.toLowerCase().includes('edit profile')"
                if has_nmx is true then
                    set nmxTab to t
                    exit repeat
                end if
            end if
        end repeat
        if nmxTab is not missing value then exit repeat
    end repeat
    
    if nmxTab is missing value then return "NOT_FOUND"
`;

let verifyNMXScript = `
tell application "Google Chrome"
${getTabScriptPrefix}
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
    return execute nmxTab javascript js_extract
end tell
`;

let nmxProofStr = runAppleScript(verifyNMXScript);
if (!nmxProofStr || nmxProofStr === "NOT_FOUND") {
    console.log(JSON.stringify({ step1: { is_nmx_panel: false }, error: "NMX not found" }, null, 2));
    process.exit(0);
}

let step1 = JSON.parse(nmxProofStr);
if (!step1.is_nmx_panel) {
    console.log(JSON.stringify({ step1, error: "is_nmx_panel false" }, null, 2));
    process.exit(0);
}

// 2. Open modal
let clickServicesScript = `
tell application "Google Chrome"
${getTabScriptPrefix}
    execute nmxTab javascript "
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

// 3. Poll for modal
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
${getTabScriptPrefix}
        execute nmxTab javascript "
        (function() {
            let isServicesOpen = window.location.href.includes('services') || document.body.innerText.toLowerCase().includes('adaugă un serviciu personalizat') || document.body.innerText.toLowerCase().includes('adaugă alt serviciu');
            if (!isServicesOpen) return 'NO_DIALOG';
            
            // On Google Services page, the entire screen is often replaced or a large modal appears
            let root = document.querySelector('div[role=dialog]') || document.body;
            
            let dialogBtns = Array.from(root.querySelectorAll('button, div[role=button]'));
            let customBtn = dialogBtns.some(b => {
                let t = (b.innerText || '').toLowerCase();
                return t.includes('personalizat') || t.includes('custom') || t.includes('alt serviciu');
            });

            let reqDesc = root.querySelectorAll('textarea').length > 0;
            let reqPrice = root.querySelectorAll('input[type=number], input[name*=price]').length > 0;

            let lines = root.innerText.split('\\\\n').map(l => l.trim()).filter(l => l.length > 0);
            
            let h = root.querySelector('h1, h2, h3');
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
    if (modalRes && modalRes !== 'NO_DIALOG' && modalRes !== 'NOT_FOUND') {
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

// 4. Close modal safely
if (modalFound) {
    runAppleScript(`
    tell application "Google Chrome"
${getTabScriptPrefix}
        execute nmxTab javascript "
        (function() {
            let btns = Array.from(document.querySelectorAll('button, div[role=button], a[role=button]'));
            let cancelBtn = btns.find(b => {
                let t = (b.innerText || '').toLowerCase().trim();
                return t === 'anulează' || t === 'cancel' || t === 'închide' || t === 'close';
            });
            if (cancelBtn) cancelBtn.click();
            // also try hitting Escape
            document.dispatchEvent(new KeyboardEvent('keydown', {key: 'Escape', code: 'Escape'}));
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
    "Standuri dulciuri pentru éventimente", "Pachete animatori și baloane", "Mascote pentru grădinițe",
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
