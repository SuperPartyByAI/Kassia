const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Go to main SERP
runAppleScript(`
tell application "Google Chrome" to activate
tell application "Google Chrome"
    set URL of active tab of first window to "https://www.google.com/search?q=Kassia+Events"
end tell
`);
execSync('sleep 5');

// 2. Click Vezi profilul
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'vezi profilul');
        if (target) target.click();
    })();"
end tell
`);
execSync('sleep 4');

// 3. Dump all buttons in main doc
let dumpBtns = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        return JSON.stringify(btns.map(b => b.innerText).filter(t => t && t.trim().length > 0));
    })();"
end tell
`;
console.log(runAppleScript(dumpBtns));
