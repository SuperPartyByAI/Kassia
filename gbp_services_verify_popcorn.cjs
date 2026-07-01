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
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span, div[class]'));
        let target = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            let aria = (b.getAttribute('aria-label') || '').toLowerCase().trim();
            if (t.length > 100) return false;
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

// 1. Re-open Modal
console.log("Re-opening Modifică serviciile...");
let editBtn = clickText(['modifică serviciile', 'edit services', 'editează serviciile']);
clickCoords(editBtn);
execSync('sleep 5');

// 2. Read Modal text
let modalText = runAppleScript(`tell application "Google Chrome" to execute active tab of first window javascript "document.body.innerText"`);
if (modalText.toLowerCase().includes("stand popcorn")) {
    console.log("SUCCESS: 'Stand popcorn' FOUND in modal!");
} else {
    console.log("FAIL: 'Stand popcorn' NOT FOUND.");
}
