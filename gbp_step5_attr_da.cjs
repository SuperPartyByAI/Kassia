const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Click Da
let clickDaJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
        let btn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'da');
        if (btn) {
            btn.click();
            return 'CLICKED_DA';
        }
        return 'NO_DA_BTN';
    })();"
end tell
`;
console.log(runAppleScript(clickDaJs));
execSync('sleep 1');

// Click Salveaza
let clickSaveJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
        let btn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'salvează' || (b.innerText || '').toLowerCase().trim() === 'save');
        if (btn) {
            btn.click();
            return 'CLICKED_SAVE';
        }
        return 'NO_SAVE_BTN';
    })();"
end tell
`;
console.log(runAppleScript(clickSaveJs));
