const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Apasă "Fotografii" în Meniul Principal
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'fotografii');
        if (target) target.click();
    })();"
end tell
`);
execSync('sleep 2');

// 2. Apasă "Adaugă fotografii cu compania" în iframe-ul mediatool
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('mediatool'));
        if (!targetFrame) return;
        
        let doc = targetFrame.contentWindow.document;
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        let target = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            return t === 'adaugă fotografii cu compania' || t === 'adaugă fotografii';
        });
        if (target) target.click();
    })();"
end tell
`);
execSync('sleep 2');

// 3. Extrage textele butoanelor noi din iframe
let dumpBtnsJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('mediatool'));
        if (!targetFrame) return 'NO_MEDIATOOL_IFRAME';
        
        try {
            let doc = targetFrame.contentWindow.document;
            let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
            return JSON.stringify(btns.map(b => b.innerText).filter(t => t.trim().length > 0));
        } catch(e) {
            return 'CORS_ERROR: ' + e.message;
        }
    })();"
end tell
`;
console.log(runAppleScript(dumpBtnsJs));
