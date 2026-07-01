const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Ensure no dialog open by clicking Anuleaza if any
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return;
        let doc = target.contentWindow.document;
        let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
        let btn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'anulează');
        if (btn) btn.click();
    })();"
end tell
`);
execSync('sleep 1');

let clickAllJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let sections = ['Clientelă', 'Ajutor de urgență', 'Din partea companiei'];
        let out = '';
        
        for (let s of sections) {
            let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
            let btn = btns.find(b => (b.getAttribute('aria-label') || '').includes(s));
            if (btn) {
                btn.click();
                out += 'CLICKED ' + s + '\\n';
            }
        }
        return out;
    })();"
end tell
`;
console.log(runAppleScript(clickAllJs));
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
