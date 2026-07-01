const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let clickOptionsJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
        let btn = btns.find(b => (b.getAttribute('aria-label') || '').includes('Opțiuni pentru serviciu'));
        if (btn) {
            btn.click();
            return 'CLICKED_OPTIUNI';
        }
        return 'NO_BTN';
    })();"
end tell
`;
console.log(runAppleScript(clickOptionsJs));
execSync('sleep 2');

let dumpModalJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let dialog = doc.querySelector('div[role=dialog]');
        if (dialog) return dialog.innerText;
        return 'NO_DIALOG';
    })();"
end tell
`;
console.log(runAppleScript(dumpModalJs));
