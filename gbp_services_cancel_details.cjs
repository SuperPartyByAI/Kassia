const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let deleteJs = `
tell application "Google Chrome"
    activate
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        let deleteBtn = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            return t === 'șterge serviciul' || t === 'delete service' || t === 'anulează' || t === 'cancel';
        });
        
        if (deleteBtn) {
            deleteBtn.click();
            return 'CLICKED_CANCEL_OR_DELETE';
        }
        return 'NOT_FOUND';
    })();"
end tell
`;
console.log(runAppleScript(deleteJs));
execSync('sleep 2');

// Then confirm if needed
let confirmJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('button, div[role=button], span'));
        let confirmBtn = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            return t === 'șterge' || t === 'delete' || t === 'da' || t === 'yes' || t === 'renunță' || t === 'discard';
        });
        if (confirmBtn) confirmBtn.click();
        
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (target) {
            let doc = target.contentWindow.document;
            let btnsI = Array.from(doc.querySelectorAll('button, div[role=button], span'));
            let confirmBtnI = btnsI.find(b => {
                let t = (b.innerText || '').toLowerCase().trim();
                return t === 'șterge' || t === 'delete' || t === 'da' || t === 'yes' || t === 'renunță' || t === 'discard';
            });
            if (confirmBtnI) confirmBtnI.click();
        }
    })();"
end tell
`;
runAppleScript(confirmJs);
