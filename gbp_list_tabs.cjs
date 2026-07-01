const fs = require('fs');
const { execSync } = require('child_process');

const appleScriptPath = '/tmp/list_tabs.scpt';
const appleScriptContent = `
tell application "Google Chrome"
    set tabList to ""
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            set titleStr to title of t
            set tabList to tabList & u & " | " & titleStr & "\\n"
        end repeat
    end repeat
    return tabList
end tell
`;

fs.writeFileSync(appleScriptPath, appleScriptContent);

let rawOutput = "";
try {
    rawOutput = execSync(`osascript ${appleScriptPath}`).toString().trim();
} catch (e) {
    console.error("Failed to execute AppleScript", e);
}

console.log(rawOutput);
