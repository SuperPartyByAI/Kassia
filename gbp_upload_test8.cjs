const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let clickIframeBtnJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('mediatool'));
        if (!targetFrame) return 'NO_MEDIATOOL_IFRAME';
        
        try {
            let doc = targetFrame.contentWindow.document;
            let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
            
            // Caută Adaugă fotografii cu compania sau Adaugă fotografii
            let target = btns.find(b => {
                let t = (b.innerText || '').toLowerCase().trim();
                return t === 'adaugă fotografii cu compania' || t === 'adaugă fotografii';
            });
            
            if (target) {
                target.click();
                return 'CLICKED_ADAUGA_FOTO_IN_IFRAME';
            }
            return 'NO_BTN_FOUND';
        } catch(e) {
            return 'CORS_ERROR: ' + e.message;
        }
    })();"
end tell
`;
console.log(runAppleScript(clickIframeBtnJs));
