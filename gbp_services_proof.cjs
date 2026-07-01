const fs = require('fs');
const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR";
    }
}

function getCoordsOfText(textsToMatch) {
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
        target.scrollIntoView({behavior: 'instant', block: 'center', inline: 'center'});
        let rect = target.getBoundingClientRect();
        let barHeight = window.outerHeight - window.innerHeight;
        let x = window.screenX + rect.left + (rect.width / 2);
        let y = window.screenY + barHeight + rect.top + (rect.height / 2);
        return Math.round(x) + ',' + Math.round(y);
    })();
    `;
    return runAppleScript(`
    tell application "Google Chrome"
        execute active tab of first window javascript "${js.replace(/"/g, '\\"')}"
    end tell
    `);
}

// Ensure panel is open
let veziProfilulCoords = getCoordsOfText(['vezi profilul', 'view profile']);
if (veziProfilulCoords !== 'NOT_FOUND' && veziProfilulCoords !== 'ERROR') {
    let [vx, vy] = veziProfilulCoords.split(',');
    execSync(`/opt/homebrew/bin/cliclick m:${vx},${vy} w:500 c:.`);
    execSync('sleep 3');
}

let editBtnCoords = getCoordsOfText(['modifică serviciile', 'edit services', 'editează serviciile']);
if (editBtnCoords !== 'NOT_FOUND' && editBtnCoords !== 'ERROR') {
    let [cx, cy] = editBtnCoords.split(',');
    execSync(`/opt/homebrew/bin/cliclick m:${cx},${cy} w:500 c:.`);
    execSync('sleep 4');
}

// Dump modal text
let dumpModal = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let dialogs = Array.from(document.querySelectorAll('div[role=dialog]'));
        let dText = dialogs.map(d => d.innerText).join('\\\\n');
        return dText + '\\\\n' + document.body.innerText;
    })();"
end tell
`;
let txt = runAppleScript(dumpModal);

// Parse logic
let basicRequired = ["evenimente corporatiste", "evenimente la școală", "design decorațiuni pentru evenimente"];
let customServices = [
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

let rawLines = txt.split('\\n').map(l => l.trim()).filter(l => l.length > 0);
let textLower = txt.toLowerCase();

let services_detected = rawLines.filter(l => basicRequired.includes(l.toLowerCase()) || customServices.map(c=>c.toLowerCase()).includes(l.toLowerCase()));
let custom_services_detected = services_detected.filter(s => customServices.map(c=>c.toLowerCase()).includes(s.toLowerCase()));
let services_basic_ok = basicRequired.every(b => textLower.includes(b));

let missing_services = [];
for (let c of customServices) {
    if (!textLower.includes(c.toLowerCase())) missing_services.push(c);
}

let jsonOutput = {
    source_context: "GBP_NMX",
    services_detected: services_detected,
    services_basic_ok: services_basic_ok,
    custom_services_detected: custom_services_detected,
    custom_services_count: custom_services_detected.length,
    missing_services: missing_services,
    unexpected_services: [],
    raw_services_lines: rawLines.slice(0, 50), // first 50 lines just to show structure
    pass_checks: {
        services_basic_ok: services_basic_ok,
        custom_services_ok: missing_services.length === 0
    },
    hold_reasons: missing_services.length > 0 ? ["Some services are missing"] : []
};

fs.writeFileSync('/tmp/gbp_services_proof.json', JSON.stringify(jsonOutput, null, 2));
console.log("Proof written to /tmp/gbp_services_proof.json");
