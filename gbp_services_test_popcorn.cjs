const fs = require('fs');
const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR";
    }
}

function clickText(textsToMatch) {
    let js = `
    (function() {
        let texts = ${JSON.stringify(textsToMatch)};
        // query in both document and Shadow DOMs if possible, or just document
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span, div[class]'));
        let target = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            let aria = (b.getAttribute('aria-label') || '').toLowerCase().trim();
            if (t.length > 100) return false; // skip large containers
            if (texts.includes('adaug')) {
                return t.includes('adaug') || aria.includes('adaug');
            }
            if (texts.includes('salvea')) {
                return t.includes('salvea') || aria.includes('salvea') || t.includes('save') || aria.includes('save');
            }
            return texts.some(match => t === match || t.includes(match) || aria === match || aria.includes(match));
        });
        if (!target) return 'NOT_FOUND';
        
        try { target.click(); } catch(e) {}
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

function clickCoords(coordsStr) {
    if (coordsStr && coordsStr !== 'NOT_FOUND' && coordsStr !== 'ERROR') {
        let [x, y] = coordsStr.split(',');
        execSync(`/opt/homebrew/bin/cliclick m:${x},${y} w:500 c:.`);
        return true;
    }
    return false;
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

// Test if it's the right tab
let curTitle = runAppleScript(`tell application "Google Chrome" to title of active tab of first window`);
console.log("Active Tab: " + curTitle);

// 2. Click Modifică serviciile
console.log("Clicking Modifică serviciile...");
let editBtn = clickText(['modifică serviciile', 'edit services', 'editează serviciile']);
clickCoords(editBtn);
execSync('sleep 5');

// 3. Test Popcorn
console.log("Checking if modal is open...");
let modalText = runAppleScript(`tell application "Google Chrome" to execute active tab of first window javascript "document.body.innerText"`);
if (modalText.toLowerCase().includes("alege elementul pentru care trimiți feedback")) {
    console.error("WRONG_MODAL_FEEDBACK - Feedback modal opened instead of Services!");
    // close it
    let closeFb = clickText(['închide', 'close']);
    clickCoords(closeFb);
    process.exit(1);
}

console.log("Clicking Adaugă serviciu...");
let addBtn = clickText(['adaug']);
if (addBtn === 'NOT_FOUND' || addBtn === 'ERROR') {
    console.error("Could not find Add button!");
    process.exit(1);
}
clickCoords(addBtn);
execSync('sleep 2');

console.log("Pasting Stand popcorn...");
execSync(`echo "Stand popcorn" | pbcopy`);
runAppleScript(`
tell application "System Events"
    keystroke "v" using command down
    delay 1
    key code 36 -- Return
    delay 1
end tell
`);

console.log("Clicking Salvează...");
let saveBtn = clickText(['salvea']);
clickCoords(saveBtn);
execSync('sleep 5');

console.log("Finished Popcorn test run.");
