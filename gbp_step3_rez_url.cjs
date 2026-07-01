const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let getUrlJs = `
tell application "Google Chrome"
    return URL of active tab of first window
end tell
`;
console.log("Current URL: " + runAppleScript(getUrlJs));
