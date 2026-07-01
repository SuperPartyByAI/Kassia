const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let clickJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span, div'));
        let target = btns.find(b => (b.innerText || '').trim() === 'Rezervări' && b.tagName === 'BUTTON');
        if (target) {
            target.dispatchEvent(new MouseEvent('mousedown', {bubbles: true, cancelable: true}));
            target.dispatchEvent(new MouseEvent('mouseup', {bubbles: true, cancelable: true}));
            target.dispatchEvent(new MouseEvent('click', {bubbles: true, cancelable: true}));
            return 'DISPATCHED_CLICK';
        }
        return 'NOT_FOUND';
    })();"
end tell
`;
console.log(runAppleScript(clickJs));
execSync('sleep 3');

let dumpJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let dialogs = Array.from(document.querySelectorAll('div[role=dialog]'));
        if (dialogs.length > 0) return 'DIALOGS:\\n' + dialogs.map(d => d.innerText).join('\\n---');
        
        let iframes = Array.from(document.querySelectorAll('iframe'));
        if (iframes.length > 0) return 'IFRAMES:\\n' + iframes.map(i => i.src).join('\\n');
        
        return 'NOTHING_OPENED';
    })();"
end tell
`;
console.log(runAppleScript(dumpJs));
