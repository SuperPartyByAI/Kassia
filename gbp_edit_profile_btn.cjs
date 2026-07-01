const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpBtnsJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let els = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = els.find(b => (b.innerText || '').toLowerCase().trim() === 'editează profilul');
        if (target) {
            return target.tagName + ' | ' + target.outerHTML;
        }
        return 'NOT_FOUND';
    })();"
end tell
`;

console.log(runAppleScript(dumpBtnsJs));
