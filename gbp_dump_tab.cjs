const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR";
    }
}

let dumpTab = `
tell application "Google Chrome"
    set t to active tab of first window
    return (URL of t) & "\\n" & (title of t)
end tell
`;

console.log(runAppleScript(dumpTab));
