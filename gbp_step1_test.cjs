const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Close any dialog
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    key code 53 -- Escape
    delay 0.5
end tell
`);

// 2. Click "Editeaza profilul"
let clickEditJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let els = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = els.find(b => (b.innerText || '').toLowerCase().trim() === 'editează profilul');
        if (target) {
            target.click();
            return 'CLICKED';
        }
        return 'NOT_FOUND';
    })();"
end tell
`;

console.log("Click Edit Profile: " + runAppleScript(clickEditJs));
execSync('sleep 3');

// 3. Dump the iframe
let dumpJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_EDITPROFILE_IFRAME';
        let doc = target.contentWindow.document;
        return doc.body.innerText;
    })();"
end tell
`;

console.log("Iframe Text:\\n" + runAppleScript(dumpJs));
