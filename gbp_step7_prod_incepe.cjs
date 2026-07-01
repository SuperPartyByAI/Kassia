const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let clickIncepeJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
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

let dumpTextJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        let doc = target.contentWindow.document;
        return doc.body.innerText;
    })();"
end tell
`;
console.log(runAppleScript(dumpTextJs));
