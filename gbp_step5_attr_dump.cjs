const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let clickMoreJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let els = Array.from(doc.querySelectorAll('div, span, a'));
        let txt = els.find(e => (e.innerText || '').trim() === 'Mai multe' && e.children.length === 0);
        if (txt) {
            let btn = txt.closest('div[role=tab]') || txt.closest('a') || txt.closest('button') || txt.parentElement;
            if (btn) btn.click();
            return 'CLICKED_MAI_MULTE';
        }
        return 'NO_MAI_MULTE_TAB';
    })();"
end tell
`;
console.log(runAppleScript(clickMoreJs));
execSync('sleep 3');

let dumpTextJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        return doc.body.innerText;
    })();"
end tell
`;
console.log(runAppleScript(dumpTextJs));
