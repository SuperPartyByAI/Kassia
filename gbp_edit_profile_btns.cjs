const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Ensure Edit Profile is open
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let els = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = els.find(b => (b.innerText || '').toLowerCase().trim() === 'editează profilul');
        if (target) target.click();
    })();"
end tell
`);
execSync('sleep 3');

let dumpBtnsJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let els = Array.from(doc.querySelectorAll('button, div[role=button]'));
        return els.map(e => e.tagName + ' | text=' + (e.innerText || '').trim().replace(/\\n/g, ' ') + ' | aria-label=' + (e.getAttribute('aria-label') || '')).join('\\n');
    })();"
end tell
`;

console.log(runAppleScript(dumpBtnsJs));
