const fs = require('fs');
const { execSync } = require('child_process');

const appleScriptPath = '/tmp/get_active_tab.scpt';
const appleScriptContent = `
tell application "Google Chrome"
    set res to ""
    set actWin to active tab of front window
    set u to URL of actWin
    set t to title of actWin
    return u & "\\n" & t
end tell
`;

fs.writeFileSync(appleScriptPath, appleScriptContent);

try {
    let rawOutput = execSync(`osascript ${appleScriptPath}`).toString().trim();
    console.log(rawOutput);
} catch (e) {
    console.error("Failed to execute AppleScript", e);
}
