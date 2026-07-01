const fs = require('fs');
const { execSync } = require('child_process');

let clickScript = `
tell application "Google Chrome"
    set activeWin to first window
    set activeTab to active tab of activeWin
    execute activeTab javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip]'));
        let editServicesBtn = btns.find(b => {
            let txt = (b.innerText || '').toLowerCase().trim();
            return txt.includes('modific') && txt.includes('servicii');
        });
        if (editServicesBtn) {
            setTimeout(() => editServicesBtn.click(), 100);
            return 'CLICKED';
        }
        return 'NOT_FOUND';
    })();"
end tell
`;

fs.writeFileSync('/tmp/click_services.scpt', clickScript);
let res = execSync('osascript /tmp/click_services.scpt').toString().trim();

if (res !== 'CLICKED') {
    console.log("Error: Button not found");
    process.exit(1);
}

// Wait for modal
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
for (let i = 0; i < 6; i++) {
    execSync('sleep 2');
    let extractScript = `
    tell application "Google Chrome"
        set activeWin to first window
        set activeTab to active tab of activeWin
        execute activeTab javascript "
        (function() {
            let t = document.body.innerText;
            let customBtn = t.toLowerCase().includes('adaugă un serviciu personalizat') || t.toLowerCase().includes('add custom service');
            let reqDesc = document.querySelectorAll('textarea').length > 0;
            let reqPrice = document.querySelectorAll('input[type=number], input[name*=price]').length > 0;
            let lines = t.split('\\\\n').map(l => l.trim()).filter(l => l.length > 0);
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
    fs.writeFileSync('/tmp/extract_modal.scpt', extractScript);
    let modalRes = execSync('osascript /tmp/extract_modal.scpt').toString().trim();
    if (modalRes) {
        let data = JSON.parse(modalRes);
        if (data.customBtn || data.lines.join(' ').toLowerCase().includes('servicii')) {
            step2.services_panel_opened = true;
            step2.custom_service_button_available = data.customBtn;
            step2.requires_description = data.reqDesc;
            step2.requires_price = data.reqPrice;
            step2.raw_services_lines = data.lines;
            modalFound = true;
            break;
        }
    }
}

// Click Cancel
if (modalFound) {
    let cancelScript = `
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
    `;
    fs.writeFileSync('/tmp/cancel_modal.scpt', cancelScript);
    execSync('osascript /tmp/cancel_modal.scpt');
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
    step3.reasons.push("Panoul de servicii nu a putut fi deschis.");
} else {
    // Normalization function to handle Romanian diacritics
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
            step3.forbidden_services_toremove_or_unselect.push(s);
        }
    });
}

console.log(JSON.stringify({ step2, step3 }, null, 2));
