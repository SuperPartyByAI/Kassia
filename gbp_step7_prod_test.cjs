const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Ensure modal is closed
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    key code 53
    delay 1
end tell
`);

// 2. Click Modifică produsele
let clickJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'modifică produsele' || (b.innerText || '').toLowerCase().trim() === 'edit products');
        if (target) {
            target.click();
            return 'CLICKED_PRODUSE';
        }
        return 'NO_BTN_PRODUSE';
    })();"
end tell
`;
console.log(runAppleScript(clickJs));
execSync('sleep 3');

// 3. Dump what opened
let dumpJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        if (iframes.length > 0) return 'IFRAMES:\\n' + iframes.map(i => i.src).join('\\n');
        
        let dialog = document.querySelector('div[role=dialog]');
        if (dialog) return 'DIALOG:\\n' + dialog.innerText.substring(0, 500);
        
        return 'NOTHING_OPENED_IN_MAIN';
    })();"
end tell
`;
console.log(runAppleScript(dumpJs));
