const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Ensure we are on the main page
let openPhotosJs = `
tell application "Google Chrome" to activate
tell application "Google Chrome"
    set URL of active tab of first window to "https://www.google.com/search?q=Kassia+Events"
end tell
`;
runAppleScript(openPhotosJs);
execSync('sleep 5');

let clickAddPhotoJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').trim() === 'Adaugă o fotografie');
        if (target) {
            target.click();
            return 'CLICKED_ADAUGA_O_FOTOGRAFIE';
        }
        return 'NO_BTN_FOUND';
    })();"
end tell
`;
console.log(runAppleScript(clickAddPhotoJs));
