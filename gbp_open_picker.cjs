const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Focus the "Selectează" button in the iframe
let focusBtnJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('photos/add'));
        if (!targetFrame) return 'NO_IFRAME';
        
        let doc = targetFrame.contentWindow.document;
        let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().includes('select'));
        if (target) {
            target.focus();
            return 'FOCUSED_SELECT_BTN';
        }
        return 'NO_SELECT_BTN';
    })();"
end tell
`;
console.log(runAppleScript(focusBtnJs));

// 2. Press Space to click the focused button
let pressSpaceJs = `
tell application "Google Chrome" to activate
tell application "System Events"
    key code 49 -- Space
    delay 1
end tell
`;
console.log(runAppleScript(pressSpaceJs));
