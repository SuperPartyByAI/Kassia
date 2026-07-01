const fs = require('fs');
const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR";
    }
}

// Bring Chrome to front
runAppleScript(`
tell application "Google Chrome"
    activate
end tell
`);

function getCoordsOfText(textsToMatch) {
    let js = `
    (function() {
        let texts = ${JSON.stringify(textsToMatch)};
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip], span'));
        let target = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            let aria = (b.getAttribute('aria-label') || '').toLowerCase().trim();
            return t.includes('adaug') || aria.includes('adaug');
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

// Custom services to add
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
    let addBtnCoords = getCoordsOfText(['adăugați mai multe servicii', 'adaugă un serviciu personalizat', 'add custom service']);
    if (addBtnCoords === 'NOT_FOUND' || addBtnCoords === 'ERROR') {
        console.error("Nu găsesc butonul de adăugare serviciu pentru: " + cs);
        continue;
    }
    
    let [ax, ay] = addBtnCoords.split(',');
    execSync(`/opt/homebrew/bin/cliclick m:${ax},${ay} w:500 c:.`);
    execSync('sleep 1');

    let focusInputJs = `
    tell application "Google Chrome"
        set activeWin to first window
        set activeTab to active tab of activeWin
        return execute activeTab javascript "
        (function() {
            let input = document.querySelector('input[type=\\"text\\"]');
            if (!input) return 'NOT_FOUND';
            let rect = input.getBoundingClientRect();
            let barHeight = window.outerHeight - window.innerHeight;
            let x = window.screenX + rect.left + (rect.width / 2);
            let y = window.screenY + barHeight + rect.top + (rect.height / 2);
            return Math.round(x) + ',' + Math.round(y);
        })();"
    end tell
    `;
    let inputCoords = runAppleScript(focusInputJs);
    if (inputCoords !== 'NOT_FOUND' && inputCoords !== 'ERROR') {
        let [ix, iy] = inputCoords.split(',');
        execSync(`/opt/homebrew/bin/cliclick m:${ix},${iy} w:500 c:.`);
        execSync('sleep 0.5');
    }

    // Type the service using System Events
    runAppleScript(`
    tell application "Google Chrome"
        activate
    end tell
    delay 0.2
    tell application "System Events"
        keystroke "${cs}"
        delay 0.5
        key code 36 -- Return
        delay 1
    end tell
    `);
    console.log("Added custom service: " + cs);
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

console.log("DONE");
