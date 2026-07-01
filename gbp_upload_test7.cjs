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
            // Caută ceva cu Select
            let target = btns.find(b => (b.innerText || '').toLowerCase().includes('select') || (b.innerText || '').toLowerCase().includes('alege'));
            if (target) {
                target.click();
                return 'CLICKED_SELECT_IN_IFRAME';
            }
            return 'NO_BTN_IN_IFRAME: ' + btns.map(b => b.innerText).filter(t => t.trim().length > 0).join(' | ');
        } catch(e) {
            return 'CORS_ERROR: ' + e.message;
        }
    })();"
end tell
`;
console.log(runAppleScript(clickIframeBtnJs));
