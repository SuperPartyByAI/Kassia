const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpTextJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        return document.body.innerText;
    })();"
end tell
`;
console.log(runAppleScript(dumpTextJs));
