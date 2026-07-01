const fs = require('fs');
const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR";
    }
}

let dumpIframeContent = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_SERVICES_IFRAME';
        try {
            let doc = target.contentWindow.document;
            let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
            let cancelBtn = btns.find(b => (b.innerText || '').toLowerCase().trim().includes('anulează'));
            if (cancelBtn) cancelBtn.click();
            return 'CLICKED';
        } catch(e) {
            return 'CORS_ERROR: ' + e.message;
        }
    })();"
end tell
`;
let res = runAppleScript(dumpIframeContent);
execSync('sleep 2');

let getIframeContent = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        let doc = target.contentWindow.document;
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        let addBtn = btns.find(b => (b.innerText || '').toLowerCase().includes('adăugați mai multe servicii'));
        if (addBtn) addBtn.click();
        return 'CLICKED';
    })();"
end tell
`;
console.log(runAppleScript(getIframeContent));
execSync('sleep 2');

let getIframeContentAfter = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        let doc = target.contentWindow.document;
        return doc.body.innerText;
    })();"
end tell
`;
let getIframeContentAfter2 = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        let doc = target.contentWindow.document;
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        let customBtn = btns.find(b => (b.innerText || '').toLowerCase().includes('adaugă un serviciu personalizat'));
        if (customBtn) customBtn.click();
        return 'CLICKED_CUSTOM';
    })();"
end tell
`;
console.log(runAppleScript(getIframeContentAfter2));
execSync('sleep 2');

let getIframeContentAfter3 = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        let doc = target.contentWindow.document;
        return doc.body.innerHTML;
    })();"
end tell
`;
let html = runAppleScript(getIframeContentAfter3);
require('fs').writeFileSync('/tmp/gbp_dump_iframe_html.txt', html);
console.log("HTML dumped to /tmp/gbp_dump_iframe_html.txt");
