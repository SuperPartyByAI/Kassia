const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Click Adaugă fotografii cu compania
let clickAddJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('button, div[role=button], span'));
        let target = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            return t === 'adaugă fotografii cu compania' || t === 'adaugă fotografii';
        });
        if (target) {
            target.click();
            return 'CLICKED_ADAUGA';
        }
        return 'NO_BTN_FOUND';
    })();"
end tell
`;
console.log(runAppleScript(clickAddJs));
execSync('sleep 2');

let dumpBodyJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "document.body.innerText.substring(0, 1000);"
end tell
`;
console.log("AFTER CLICK:\\n" + runAppleScript(dumpBodyJs));
