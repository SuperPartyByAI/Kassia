const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Expand NMX
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'vezi profilul' || (b.innerText || '').toLowerCase().trim() === 'view profile');
        if (target) target.click();
    })();"
end tell
`);
execSync('sleep 3');

// 2. Click Adaugă fotografii
let clickAdaugaFotografiiJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        // Find the button inside the main menu (not the iframe)
        let target = btns.find(b => (b.innerText || '').trim() === 'Adaugă fotografii');
        if (target) {
            target.click();
            return 'CLICKED_ADAUGA_FOTO';
        }
        return 'NO_BTN_FOUND';
    })();"
end tell
`;
console.log(runAppleScript(clickAdaugaFotografiiJs));
