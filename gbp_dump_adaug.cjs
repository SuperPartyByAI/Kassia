const fs = require('fs');
const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR";
    }
}

let dumpButtons = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        return btns.map(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            let aria = (b.getAttribute('aria-label') || '').toLowerCase().trim();
            if (t.includes('adaug') || aria.includes('adaug')) {
                return 'MATCH_ADAUG: ' + t + ' | aria: ' + aria;
            }
            if (t.includes('salvea') || aria.includes('salvea') || t.includes('save') || aria.includes('save')) {
                return 'MATCH_SAVE: ' + t + ' | aria: ' + aria;
            }
            return '';
        }).filter(t => t !== '').join('\\\\n');
    })();"
end tell
`;

let out = runAppleScript(dumpButtons);
console.log(out);
