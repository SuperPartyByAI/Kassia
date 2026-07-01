const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Click "Editeaza profilul"
let clickEditJs = `
tell application "Google Chrome"
    activate
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            return t === 'editează profilul' || t === 'edit profile' || t === 'editeaza profilul';
        });
        if (target) {
            target.click();
            return 'CLICKED_EDIT_PROFILE';
        }
        return 'NOT_FOUND_EDIT_PROFILE';
    })();"
end tell
`;

console.log(runAppleScript(clickEditJs));
execSync('sleep 3');

// 2. Dump inner text of the modal
let dumpModalJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let dialog = document.querySelector('div[role=dialog]');
        if (dialog) return dialog.innerText;
        return 'NO_DIALOG';
    })();"
end tell
`;

console.log("\\nDIALOG TEXT:\\n" + runAppleScript(dumpModalJs));

let dumpInputsJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let dialog = document.querySelector('div[role=dialog]');
        if (!dialog) return 'NO_DIALOG';
        let inputs = Array.from(dialog.querySelectorAll('input, textarea, div[role=button], button'));
        return inputs.map(i => i.tagName + ' | ' + (i.innerText || i.value || i.placeholder || i.getAttribute('aria-label') || '').trim().replace(/\\n/g, ' ')).join('\\n');
    })();"
end tell
`;

console.log("\\nDIALOG INPUTS:\\n" + runAppleScript(dumpInputsJs));
