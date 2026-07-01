const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpContactJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_EDITPROFILE_IFRAME';
        let doc = target.contentWindow.document;
        
        let els = Array.from(doc.querySelectorAll('div, span'));
        let txt = els.find(e => (e.innerText || '').trim() === 'Contact' && e.children.length === 0);
        if (txt) {
            let btn = txt.closest('div[role=tab]') || txt.closest('a') || txt.closest('button') || txt.parentElement;
            if (btn) btn.click();
            return 'CLICKED_CONTACT';
        }
        return 'NO_CONTACT_TAB';
    })();"
end tell
`;
console.log(runAppleScript(dumpContactJs));
execSync('sleep 2');

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
