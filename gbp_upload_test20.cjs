const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Click "Adaugă fotografii cu compania" IN IFRAME
let clickAddJs = `
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
        if (target) {
            target.click();
            return 'CLICKED_ADAUGA';
        }
    })();"
end tell
`;
console.log(runAppleScript(clickAddJs));
execSync('sleep 2');

// 2. Dump the new text of the iframe
let dumpJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('mediatool'));
        if (!targetFrame) return 'NO_IFRAME';
        let doc = targetFrame.contentWindow.document;
        return doc.body.innerText.substring(0, 1000);
    })();"
end tell
`;
console.log(runAppleScript(dumpJs));

// 3. Find buttons again
let dumpBtnsJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('mediatool'));
        if (!targetFrame) return '';
        let doc = targetFrame.contentWindow.document;
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        return JSON.stringify(btns.map(b => b.innerText).filter(t => t.trim().length > 0));
    })();"
end tell
`;
console.log(runAppleScript(dumpBtnsJs));
