const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let clickVeziJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'vezi profilul' || (b.innerText || '').toLowerCase().trim() === 'view profile');
        if (target) {
            target.click();
            return 'CLICKED_VEZI_PROFILUL';
        }
        return 'NO_BTN_VEZI';
    })();"
end tell
`;
console.log(runAppleScript(clickVeziJs));
execSync('sleep 5');

let dumpTextJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        return document.body.innerText;
    })();"
end tell
`;
console.log(runAppleScript(dumpTextJs));
