const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Check text
let dumpBodyJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "document.body.innerText.substring(0, 1000);"
end tell
`;
console.log(runAppleScript(dumpBodyJs));
