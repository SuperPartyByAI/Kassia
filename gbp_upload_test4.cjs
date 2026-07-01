const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let clickPhotosBtnJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'fotografii' || (b.innerText || '').toLowerCase().trim() === 'photos');
        if (target) {
            target.click();
            return 'CLICKED_FOTOGRAFII';
        }
        return 'NO_BTN_FOTOGRAFII';
    })();"
end tell
`;
console.log(runAppleScript(clickPhotosBtnJs));
execSync('sleep 3');

let clickUploadBtnJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().includes('adaugă fotografii') || (b.innerText || '').toLowerCase().includes('add photos') || (b.innerText || '').toLowerCase().includes('selectează o fotografie') || (b.innerText || '').toLowerCase().includes('select photos'));
        if (target) {
            target.click();
            return 'CLICKED_UPLOAD_BTN';
        }
        return 'NO_UPLOAD_BTN';
    })();"
end tell
`;
console.log(runAppleScript(clickUploadBtnJs));
