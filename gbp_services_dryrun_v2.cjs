const fs = require('fs');
const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "";
    }
}

// Step 1: Find NMX tab and get info
let tabFinder = `
tell application "Google Chrome"
    set found to false
    set res to ""
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" and (u contains "Kassia" or title of t contains "Kassia") then
                set has_nmx to execute t javascript "document.body.innerText.toLowerCase().includes('compania ta') || document.body.innerText.toLowerCase().includes('editează profilul')"
                if has_nmx is true then
                    set active tab index of w to tabIndex
                    set index of w to 1
                    set res to u & "|||" & title of t
                    set found to true
                    exit repeat
                end if
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if found is true then exit repeat
    end repeat
    return res
end tell
`;

let tabInfoStr = runAppleScript(tabFinder);

let step1 = {
    is_nmx_panel: false,
    has_kassia_events: false,
    has_modifica_serviciile: false,
    url: "",
    title: ""
};

if (!tabInfoStr) {
    console.log(JSON.stringify({ step1, error: "NMX tab not found" }, null, 2));
    process.exit(0);
}

let [url, title] = tabInfoStr.split("|||");
step1.is_nmx_panel = true;
step1.has_kassia_events = true;
step1.url = url;
step1.title = title;

// Click the edit services button asynchronously
let clickScript = `
tell application "Google Chrome"
    set activeWin to first window
    set activeTab to active tab of activeWin
    execute activeTab javascript "(function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip]'));
        let editServicesBtn = btns.find(b => {
            let txt = (b.innerText || '').toLowerCase().trim();
            return txt === 'editează serviciile' || txt === 'modifică serviciile' || txt === 'edit services' || txt === 'servicii';
        });
        if (editServicesBtn) {
            setTimeout(() => editServicesBtn.click(), 100);
            return 'CLICKED';
        }
        return 'NOT_FOUND';
    })();"
end tell
`;

let clickRes = runAppleScript(clickScript);
if (clickRes !== 'CLICKED') {
    step1.has_modifica_serviciile = false;
    console.log(JSON.stringify({ step1, error: "Edit services button not found" }, null, 2));
    process.exit(0);
}

step1.has_modifica_serviciile = true;

// Poll for modal
let step2 = {
    services_panel_opened: false,
    existing_services: [],
    available_suggested_services: [],
    custom_service_button_available: false,
    requires_description: false,
    requires_price: false,
    raw_services_lines: []
};

let modalFound = false;
for (let i = 0; i < 5; i++) {
    execSync('sleep 2');
    let extractScript = `
    tell application "Google Chrome"
        set activeWin to first window
        set activeTab to active tab of activeWin
        execute activeTab javascript "
        (function() {
            let dialog = document.querySelector('div[role=dialog]');
            if (!dialog) return 'NO_DIALOG';
            
            let dialogBtns = Array.from(dialog.querySelectorAll('button, div[role=button]'));
            let customBtn = dialogBtns.some(b => {
                let t = (b.innerText || '').toLowerCase();
                return t.includes('adaugă un serviciu personalizat') || t.includes('add custom service');
            });

            let reqDesc = dialog.querySelectorAll('textarea').length > 0;
            let reqPrice = dialog.querySelectorAll('input[type=number], input[name*=price]').length > 0;

            let lines = dialog.innerText.split('\\\\n').map(l => l.trim()).filter(l => l.length > 0);
            
            return JSON.stringify({
                customBtn: customBtn,
                reqDesc: reqDesc,
                reqPrice: reqPrice,
                lines: lines
            });
        })();
        "
    end tell
    `;
    let res = runAppleScript(extractScript);
    if (res && res !== 'NO_DIALOG' && res !== '') {
        try {
            let data = JSON.parse(res);
            step2.services_panel_opened = true;
            step2.custom_service_button_available = data.customBtn;
            step2.requires_description = data.reqDesc;
            step2.requires_price = data.reqPrice;
            step2.raw_services_lines = data.lines;
            modalFound = true;
            break;
        } catch (e) {}
    }
}

// Click Cancel
if (modalFound) {
    runAppleScript(`
    tell application "Google Chrome"
        set activeWin to first window
        set activeTab to active tab of activeWin
        execute activeTab javascript "
        (function() {
            let dialog = document.querySelector('div[role=dialog]');
            if (dialog) {
                let dialogBtns = Array.from(dialog.querySelectorAll('button, div[role=button]'));
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

// Step 3
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
    step3.reasons.push("Panoul de servicii nu a putut fi deschis (timeout sau lipsă overlay).");
} else {
    // Check existing
    let rawText = step2.raw_services_lines.join(" ").toLowerCase();
    services_to_add.forEach(s => {
        if (rawText.includes(s.toLowerCase())) {
            step3.services_already_present.push(s);
            step3.services_to_skip_duplicates.push(s);
        }
    });
    
    // Filter out already present
    step3.services_to_add = services_to_add.filter(s => !step3.services_already_present.includes(s));
    
    forbidden_services.forEach(s => {
        if (rawText.includes(s.toLowerCase())) {
            step3.forbidden_services_present.push(s);
            step3.forbidden_services_to_remove_or_unselect.push(s);
        }
    });
}

let finalOutput = {
    step1,
    step2,
    step3
};

fs.writeFileSync('/tmp/gbp_services_dryrun_final.json', JSON.stringify(finalOutput, null, 2));
console.log("DRY RUN DONE.");
