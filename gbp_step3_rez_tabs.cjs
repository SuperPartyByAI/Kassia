const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpTabsJs = `
tell application "Google Chrome"
    set out to ""
    repeat with w in windows
        repeat with t in tabs of w
            set out to out & (URL of t) & "\\n"
        end repeat
    end repeat
    return out
end tell
`;
console.log(runAppleScript(dumpTabsJs));
