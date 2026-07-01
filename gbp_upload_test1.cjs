const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let openPhotosJs = `
tell application "Google Chrome" to activate
tell application "Google Chrome"
    set URL of active tab of first window to "https://www.google.com/search?q=Kassia+Events"
end tell
`;
runAppleScript(openPhotosJs);
execSync('sleep 5');

let clickPhotosBtnJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        // Căutăm butonul 'Adaugă fotografii' sau 'Add photos'
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'adaugă fotografii' || (b.innerText || '').toLowerCase().trim() === 'add photos');
        if (target) {
            target.click();
            return 'CLICKED_ADD_PHOTOS_MAIN';
        }
        return 'NO_BTN_ADD_PHOTOS_MAIN';
    })();"
end tell
`;
console.log(runAppleScript(clickPhotosBtnJs));
execSync('sleep 3');
