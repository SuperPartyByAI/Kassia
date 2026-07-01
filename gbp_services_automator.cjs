const fs = require('fs');
const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR";
    }
}

// 1. Bring Chrome to front and navigate to Kassia Events
runAppleScript(`
tell application "Google Chrome"
    activate
    set newTab to make new tab at end of tabs of first window
    set URL of newTab to "https://www.google.com/search?q=Kassia+Events"
    delay 5
end tell
`);
console.log("Navigated to Kassia Events.");

// 2. Helper to get coordinates
function getCoordsOfText(textsToMatch) {
    let js = `
    (function() {
        let texts = ${JSON.stringify(textsToMatch)};
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip], span'));
        let target = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            return texts.some(match => t === match || t.includes(match));
        });
        if (!target) return 'NOT_FOUND';
        
        target.scrollIntoView({behavior: 'instant', block: 'center', inline: 'center'});
        let rect = target.getBoundingClientRect();
        
        // Approximate the window chrome height
        let barHeight = window.outerHeight - window.innerHeight;
        let x = window.screenX + rect.left + (rect.width / 2);
        let y = window.screenY + barHeight + rect.top + (rect.height / 2);
        
        return Math.round(x) + ',' + Math.round(y);
    })();
    `;
    let script = `
    tell application "Google Chrome"
        set activeWin to first window
        set activeTab to active tab of activeWin
        return execute activeTab javascript "${js.replace(/"/g, '\\"')}"
    end tell
    `;
    return runAppleScript(script);
}

// 3. Find and click Vezi profilul if present
let veziProfilulCoords = getCoordsOfText(['vezi profilul', 'view profile']);
if (veziProfilulCoords !== 'NOT_FOUND' && veziProfilulCoords !== 'ERROR') {
    console.log("Clicking Vezi profilul at " + veziProfilulCoords);
    let [vx, vy] = veziProfilulCoords.split(',');
    execSync(`/opt/homebrew/bin/cliclick m:${vx},${vy} w:500 c:.`);
    execSync('sleep 3');
}

// 4. Find and click Modifică serviciile
let editBtnCoords = getCoordsOfText(['modifică serviciile', 'edit services', 'editează serviciile']);
if (editBtnCoords === 'NOT_FOUND' || editBtnCoords === 'ERROR') {
    console.error("Modifică serviciile nu a fost găsit pe ecran. Poate e nevoie de login sau scroll.");
    process.exit(1);
}

console.log("Clicking Modifică serviciile at " + editBtnCoords);
let [cx, cy] = editBtnCoords.split(',');
execSync(`/opt/homebrew/bin/cliclick m:${cx},${cy} w:500 c:.`);

// Wait for panel
execSync('sleep 4');

// 4. Click Basic services if they exist and are unchecked
// Evenimente corporatiste, Evenimente la școală, Design decorațiuni pentru evenimente
let basicServices = ["evenimente corporatiste", "evenimente la școală", "design decorațiuni pentru evenimente"];
for (let bs of basicServices) {
    let c = getCoordsOfText([bs]);
    if (c !== 'NOT_FOUND' && c !== 'ERROR') {
        // Only click if it's not already selected. It's tricky to know visually if it's selected via JS.
        // I will dispatch click directly on the DOM element for the basic ones to avoid unchecking them.
        let checkAndClickJs = `
        tell application "Google Chrome"
            execute active tab of first window javascript "
            (function() {
                let el = Array.from(document.querySelectorAll('div')).find(d => (d.innerText||'').toLowerCase().trim() === '${bs}');
                if (el) {
                    // find parent button or checkbox
                    let btn = el.closest('button, div[role=button]');
                    if (btn && btn.getAttribute('aria-pressed') !== 'true' && btn.getAttribute('aria-checked') !== 'true') {
                        btn.click();
                        return 'CLICKED';
                    }
                    return 'ALREADY_CHECKED_OR_NO_BTN';
                }
                return 'NOT_FOUND';
            })();"
        end tell
        `;
        let res = runAppleScript(checkAndClickJs);
        console.log("Basic service " + bs + ": " + res);
    }
}
execSync('sleep 1');

// 5. Uncheck forbidden
let forbidden = ["catering", "coordonare conferințe", "coordonare evenimente de team building", "evenimente corporative și conferințe"];
for (let fb of forbidden) {
    let uncheckJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let el = Array.from(document.querySelectorAll('div')).find(d => (d.innerText||'').toLowerCase().trim() === '${fb}');
            if (el) {
                let btn = el.closest('button, div[role=button]');
                if (btn && (btn.getAttribute('aria-pressed') === 'true' || btn.getAttribute('aria-checked') === 'true')) {
                    btn.click();
                    return 'UNCHECKED';
                }
            }
            return 'SKIPPED';
        })();"
    end tell
    `;
    runAppleScript(uncheckJs);
}

// 6. Custom services
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

for (let cs of customServices) {
    // Check if already present in DOM
    let checkJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            return document.body.innerText.toLowerCase().includes('${cs.toLowerCase()}').toString();
        })();"
    end tell
    `;
    let isPresent = runAppleScript(checkJs);
    if (isPresent === 'true') {
        console.log("Skipping duplicate: " + cs);
        continue;
    }

    // Find "Adăugați mai multe servicii"
    let addBtnCoords = getCoordsOfText(['adăugați mai multe servicii', 'adaugă un serviciu personalizat', 'add custom service', 'adaugă alt serviciu']);
    if (addBtnCoords === 'NOT_FOUND' || addBtnCoords === 'ERROR') {
        console.error("Nu găsesc butonul de adăugare serviciu personalizat pentru: " + cs);
        continue; // skip this one, maybe it will appear next
    }
    
    let [ax, ay] = addBtnCoords.split(',');
    execSync(`/opt/homebrew/bin/cliclick m:${ax},${ay} w:500 c:.`);
    execSync('sleep 1');

    // Type the service using System Events
    runAppleScript(`
    tell application "System Events"
        keystroke "${cs}"
        delay 0.5
        key code 36 -- Return
        delay 1
    end tell
    `);
    console.log("Added custom service: " + cs);
}

// 7. Save
let saveCoords = getCoordsOfText(['salvează', 'save']);
if (saveCoords !== 'NOT_FOUND' && saveCoords !== 'ERROR') {
    let [sx, sy] = saveCoords.split(',');
    execSync(`/opt/homebrew/bin/cliclick m:${sx},${sy} w:500 c:.`);
    console.log("Clicked Salvează.");
} else {
    console.log("Butonul Salvează nu a fost găsit.");
}

console.log("DONE");
