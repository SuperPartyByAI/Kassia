const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Just dump all dialogs on the main page
let dumpJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let dialogs = Array.from(document.querySelectorAll('div[role=dialog]'));
        if (dialogs.length === 0) return 'NO_DIALOGS';
        return dialogs.map(d => d.innerText).join('\\n---DIALOG---\\n');
    })();"
end tell
`;
console.log(runAppleScript(dumpJs));
