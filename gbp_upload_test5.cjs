const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let checkDialogJs = `
tell application "System Events"
    tell process "Google Chrome"
        set frontWin to front window
        set winRoles to role of every UI element of frontWin
        return (name of frontWin) & " | Roles: " & winRoles
    end tell
end tell
`;
console.log(runAppleScript(checkDialogJs));
