const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let checkAllJs = `
tell application "System Events"
    tell process "Google Chrome"
        set out to ""
        set allWins to every window
        repeat with w in allWins
            set out to out & "Window: " & (name of w) & " | Subrole: " & (subrole of w) & "\\n"
            set allSheets to every sheet of w
            repeat with s in allSheets
                set out to out & "  Sheet: " & (name of s) & " | Subrole: " & (subrole of s) & "\\n"
            end repeat
        end repeat
        return out
    end tell
end tell
`;
console.log(runAppleScript(checkAllJs));
