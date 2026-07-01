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

// 2. Find and click Vezi profilul if present
let veziProfilulCoords = getCoordsOfText(['vezi profilul', 'view profile']);
if (veziProfilulCoords !== 'NOT_FOUND' && veziProfilulCoords !== 'ERROR') {
    let [vx, vy] = veziProfilulCoords.split(',');
    execSync(`/opt/homebrew/bin/cliclick m:${vx},${vy} w:500 c:.`);
    execSync('sleep 3');
}

// 3. Find and click Modifică serviciile
let editBtnCoords = getCoordsOfText(['modifică serviciile', 'edit services', 'editează serviciile']);
if (editBtnCoords !== 'NOT_FOUND' && editBtnCoords !== 'ERROR') {
    let [cx, cy] = editBtnCoords.split(',');
    execSync(`/opt/homebrew/bin/cliclick m:${cx},${cy} w:500 c:.`);
    execSync('sleep 4');
}

// 4. Dump all button texts in the modal
let dumpBtns = `
tell application "Google Chrome"
    set activeWin to first window
    set activeTab to active tab of activeWin
    execute activeTab javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip]'));
        return btns.map(b => (b.innerText || '').replace(/\\\\n/g, ' ').trim()).filter(t => t.length > 0).join('\\\\n');
    })();"
end tell
`;
let out = runAppleScript(dumpBtns);
fs.writeFileSync('/tmp/gbp_modal_btns.txt', out);
