const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Reload page and expand NMX
runAppleScript(`
tell application "Google Chrome" to activate
tell application "Google Chrome"
    set URL of active tab of first window to "https://www.google.com/search?q=Kassia+Events"
end tell
`);
execSync('sleep 5');

runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'vezi profilul' || (b.innerText || '').toLowerCase().trim() === 'view profile');
        if (target) target.click();
    })();"
end tell
`);
execSync('sleep 3');

// 2. Click "Adaugă fotografii" from the NMX main menu
let clickBtn = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').trim() === 'Adaugă fotografii');
        if (target) {
            target.click();
            return 'CLICKED_MAIN_ADD_PHOTOS';
        }
        return 'NOT_FOUND';
    })();"
end tell
`;
console.log(runAppleScript(clickBtn));
execSync('sleep 3');

// 3. Dump all iframes and their content
let dumpJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        return JSON.stringify(iframes.map(i => {
            try {
                return { src: i.src, body: i.contentWindow.document.body.innerText.substring(0,500) };
            } catch(e) {
                return { src: i.src, error: e.message };
            }
        }));
    })();"
end tell
`;
console.log(runAppleScript(dumpJs));
