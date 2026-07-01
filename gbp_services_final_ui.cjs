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
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            let aria = (b.getAttribute('aria-label') || '').toLowerCase().trim();
            if (texts.includes('adaug')) {
                return t.includes('adaug') || aria.includes('adaug');
            }
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

// 1. Activate Chrome
runAppleScript(`
tell application "Google Chrome"
    activate
    set nmxTab to missing value
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" then
                set pageText to execute t javascript "document.body.innerText"
                if pageText contains "Compania ta pe Google" or pageText contains "Gestionezi acest profil" then
                    set active tab index of w to tabIndex
                    set index of w to 1
                    set nmxTab to t
                    exit repeat
                end if
            else if u starts with "https://local.google.com" then
                set active tab index of w to tabIndex
                set index of w to 1
                set nmxTab to t
                exit repeat
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if nmxTab is not missing value then exit repeat
    end repeat
end tell
`);
execSync('sleep 1');

// 2. Safety check
let frontmostApp = runAppleScript(`tell application "System Events" to name of first application process whose frontmost is true`);
if (frontmostApp !== "Google Chrome") {
    console.error("Chrome is NOT frontmost! Aborting.");
    process.exit(1);
}

// 3. Find and click Vezi profilul (if needed)
let veziProfilulCoords = getCoordsOfText(['vezi profilul', 'view profile']);
if (veziProfilulCoords !== 'NOT_FOUND' && veziProfilulCoords !== 'ERROR') {
    let [vx, vy] = veziProfilulCoords.split(',');
    execSync(`/opt/homebrew/bin/cliclick m:${vx},${vy} w:500 c:.`);
    execSync('sleep 3');
}

// 4. Click Modifică serviciile
let editBtnCoords = getCoordsOfText(['modifică serviciile', 'edit services', 'editează serviciile']);
if (editBtnCoords !== 'NOT_FOUND' && editBtnCoords !== 'ERROR') {
    let [cx, cy] = editBtnCoords.split(',');
    execSync(`/opt/homebrew/bin/cliclick m:${cx},${cy} w:500 c:.`);
    execSync('sleep 4');
} else {
    console.log("Could not find Modifică serviciile button. Assuming modal is already open.");
}

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

let addedCount = 0;
for (let cs of customServices) {
    // Check if already present
    let isPresentJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let txt = document.body.innerText.toLowerCase();
            return txt.includes('${cs.toLowerCase()}');
        })();"
    end tell
    `;
    let isPresent = runAppleScript(isPresentJs);
    if (isPresent === 'true') {
        console.log("Already present, skipping: " + cs);
        continue;
    }

    // Safety check inside loop
    let fa = runAppleScript(`tell application "System Events" to name of first application process whose frontmost is true`);
    if (fa !== "Google Chrome") {
        console.error("Focus lost during typing! Stopping immediately.");
        process.exit(1);
    }

    // Find "Adăugați mai multe servicii"
    let addBtnCoords = getCoordsOfText(['adaug', 'adăugați mai multe servicii', 'adaugă un serviciu personalizat', 'add custom service', 'adaugă alt serviciu']);
    if (addBtnCoords === 'NOT_FOUND' || addBtnCoords === 'ERROR') {
        console.error("Nu găsesc butonul de adăugare serviciu pentru: " + cs);
        break;
    }
    
    let [ax, ay] = addBtnCoords.split(',');
    execSync(`/opt/homebrew/bin/cliclick m:${ax},${ay} w:500 c:.`);
    execSync('sleep 1');

    // Paste using clipboard instead of keystroke
    execSync(`echo "${cs}" | pbcopy`);
    runAppleScript(`
    tell application "System Events"
        keystroke "v" using command down
        delay 0.5
        key code 36 -- Return
        delay 1
    end tell
    `);
    
    console.log("Pasted and added: " + cs);
    addedCount++;
}

// Save
let saveCoords = getCoordsOfText(['salvează', 'save']);
if (saveCoords !== 'NOT_FOUND' && saveCoords !== 'ERROR') {
    let [sx, sy] = saveCoords.split(',');
    execSync(`/opt/homebrew/bin/cliclick m:${sx},${sy} w:500 c:.`);
    console.log("Clicked Salvează.");
} else {
    console.log("Butonul Salvează nu a fost găsit.");
}

console.log("FINISHED");
console.log("Added custom services: " + addedCount);
