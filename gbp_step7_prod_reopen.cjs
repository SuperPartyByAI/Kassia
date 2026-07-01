const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Refresh page
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    keystroke "r" using {command down}
    delay 5
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

// 3. Click Începe
let clickIncepeJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], a, span'));
        let btn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'începe' || (b.innerText || '').toLowerCase().trim() === 'get started');
        if (btn) {
            btn.click();
            return 'CLICKED_INCEPE';
        }
        return 'NO_INCEPE_BTN';
    })();"
end tell
`;
console.log(runAppleScript(clickIncepeJs));
execSync('sleep 3');
