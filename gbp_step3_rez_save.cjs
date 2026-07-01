const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let saveJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
        let saveBtn = btns.find(b => {
            let txt = (b.innerText || '').toLowerCase().trim();
            return txt === 'salvează' || txt === 'save';
        });
        
        if (!saveBtn) {
            saveBtn = btns.find(b => {
                let txt = (b.innerText || '').toLowerCase().trim();
                return txt.includes('salvează') || txt.includes('save');
            });
        }
        
        if (saveBtn) {
            saveBtn.click();
            return 'CLICKED_SAVE';
        }
        return 'NO_SAVE_BTN';
    })();"
end tell
`;
console.log(runAppleScript(saveJs));
