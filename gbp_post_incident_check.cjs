const fs = require('fs');
const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR";
    }
}

// 1. Activate Chrome and ensure Kassia Events search is focused
let activateTab = `
tell application "Google Chrome"
    activate
    set nmxTab to missing value
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" then
                set pageText to execute t javascript "document.body.innerText"
                if pageText contains "Gestionezi acest profil" or pageText contains "Compania ta pe Google" then
                    set active tab index of w to tabIndex
                    set index of w to 1
                    set nmxTab to t
                    exit repeat
                end if
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if nmxTab is not missing value then exit repeat
    end repeat
end tell
`;
runAppleScript(activateTab);
execSync('sleep 1');

// PAS 1 - CONFIRMARE NMX
let nmxJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let text = document.body.innerText.toLowerCase();
        return JSON.stringify({
            is_nmx_panel: text.includes('kassia events'),
            has_kassia_events: text.includes('kassia events'),
            has_modifica_serviciile: text.includes('modifică serviciile') || text.includes('edit services') || text.includes('vezi profilul'),
            has_compania_ta_pe_google: text.includes('compania ta pe google'),
            has_editeaza_profilul: text.includes('editează profilul') || text.includes('vezi profilul'),
            url: window.location.href,
            title: document.title,
            visible_relevant_lines: document.body.innerText.split('\\\\n')
        }, null, 2);
    })();"
end tell
`;
let nmxJsonStr = runAppleScript(nmxJs);
let nmxJson = JSON.parse(nmxJsonStr);
fs.writeFileSync('/tmp/gbp_nmx_proof.json', JSON.stringify(nmxJson, null, 2));

if (!nmxJson.is_nmx_panel) {
    console.error("NMX panel not found! Exiting.");
    process.exit(1);
}

// PAS 2 - DESCHIDE SERVICII DOAR PENTRU CITIRE
function clickText(textsToMatch) {
    let js = `
    (function() {
        let texts = ${JSON.stringify(textsToMatch)};
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip], span'));
        let target = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            let aria = (b.getAttribute('aria-label') || '').toLowerCase().trim();
            return texts.some(match => t === match || t.includes(match) || aria === match || aria.includes(match));
        });
        if (!target) return 'NOT_FOUND';
        try { target.click(); return 'CLICKED'; } catch(e) { return 'ERROR'; }
    })();
    `;
    return runAppleScript(`
    tell application "Google Chrome"
        execute active tab of first window javascript "${js.replace(/"/g, '\\"')}"
    end tell
    `);
}

let v = clickText(['vezi profilul', 'view profile']);
if (v === 'CLICKED') {
    execSync('sleep 3');
}

let c = clickText(['modifică serviciile', 'edit services', 'editează serviciile']);
let servicesOpened = false;
if (c === 'CLICKED') {
    servicesOpened = true;
    execSync('sleep 4');
} else {
    // maybe it is already open from before?
    let checkModal = runAppleScript(`tell application "Google Chrome" to execute active tab of first window javascript "document.querySelectorAll('div[role=dialog]').length > 0"`);
    if (checkModal === 'true') {
        servicesOpened = true;
    }
}

// Extract modal text
let dumpModal = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let dialogs = Array.from(document.querySelectorAll('div[role=dialog]'));
        if(dialogs.length === 0) return 'NO_DIALOG';
        return dialogs.map(d => d.innerText).join('\\\\n---\\\\n');
    })();"
end tell
`;
let modalTxt = runAppleScript(dumpModal);

// Parse services
let basicRequired = ["Evenimente corporatiste", "Evenimente la școală", "Design decorațiuni pentru evenimente"];
let customRequired = [
    "Animatori petreceri copii", "Mascote pentru petreceri copii", "Personaje pentru petreceri copii",
    "Pictură pe față copii", "Modelaj baloane copii", "Mini-disco copii", "Jocuri interactive pentru copii",
    "Animatori botez", "Animatori moț și turtă", "Ursitoare botez", "Animatori grădiniță",
    "Animatori școală și serbări", "Animatori copii la restaurant", "Animatori copii evenimente corporate",
    "Moș Crăciun la evenimente", "Iepuraș de Paște la evenimente", "Decoruri baloane pentru evenimente",
    "Arcade din baloane", "Ghirlande din baloane", "Baloane cu heliu", "Stand vată de zahăr", "Stand popcorn"
];
let forbiddenList = [
    "Catering", "Coordonare conferințe", "Coordonare evenimente de team building", "Evenimente corporative și conferințe"
];

let rawLines = modalTxt.split('\\n').map(l => l.trim()).filter(l => l.length > 0);
let textLower = modalTxt.toLowerCase();

let existing_services_detected = rawLines.filter(l => basicRequired.map(b=>b.toLowerCase()).includes(l.toLowerCase()) || customRequired.map(c=>c.toLowerCase()).includes(l.toLowerCase()));
let basic_services_detected = existing_services_detected.filter(s => basicRequired.map(b=>b.toLowerCase()).includes(s.toLowerCase()));
let custom_services_detected = existing_services_detected.filter(s => customRequired.map(c=>c.toLowerCase()).includes(s.toLowerCase()));
let forbidden_services_detected = rawLines.filter(l => forbiddenList.map(f=>f.toLowerCase()).includes(l.toLowerCase()));

let missing_basic_services = basicRequired.filter(b => !textLower.includes(b.toLowerCase()));
let missing_custom_services = customRequired.filter(c => !textLower.includes(c.toLowerCase()));

let okBasic = missing_basic_services.length === 0;
let okCustom = missing_custom_services.length === 0;
let okForbidden = forbidden_services_detected.length === 0;
let finalStatus = (servicesOpened && okBasic && okCustom && okForbidden) ? "PASS" : "HOLD";

let hold_reasons = [];
if (!servicesOpened) hold_reasons.push("Services panel did not open.");
if (!okBasic) hold_reasons.push("Missing basic services.");
if (!okCustom) hold_reasons.push("Missing required custom services.");
if (!okForbidden) hold_reasons.push("Forbidden services detected.");

let proofJson = {
    source_context: "GBP_NMX_SERVICES_PANEL",
    services_panel_opened: servicesOpened,
    panel_title_detected: rawLines.length > 0 ? rawLines[0] : "",
    existing_services_detected: existing_services_detected,
    custom_services_detected: custom_services_detected,
    basic_services_detected: basic_services_detected,
    missing_basic_services: missing_basic_services,
    missing_custom_services: missing_custom_services,
    forbidden_services_detected: forbidden_services_detected,
    raw_services_lines: rawLines,
    pass_checks: {
        services_panel_opened_ok: servicesOpened,
        basic_services_ok: okBasic,
        custom_services_ok: okCustom,
        no_forbidden_services_ok: okForbidden
    },
    final_status: finalStatus,
    hold_reasons: hold_reasons
};

fs.writeFileSync('/tmp/gbp_services_read_proof.json', JSON.stringify(proofJson, null, 2));
console.log("Proof written to /tmp/gbp_services_read_proof.json");
