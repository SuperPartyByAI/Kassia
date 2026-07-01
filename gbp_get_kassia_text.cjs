const fs = require('fs');
const { execSync } = require('child_process');

const appleScriptPath = '/tmp/get_kassia_text.scpt';
const appleScriptContent = `
tell application "Google Chrome"
    set res to ""
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if title of t contains "Kassia Events" and u starts with "https://www.google.com/search" then
                set res to execute t javascript "document.body.innerText"
                if res is not missing value and res is not "" then return res
            end if
        end repeat
    end repeat
    return "NOT_FOUND"
end tell
`;

fs.writeFileSync(appleScriptPath, appleScriptContent);

let rawOutput = "";
try {
    rawOutput = execSync(`osascript ${appleScriptPath}`).toString().trim();
} catch (e) {
    console.error("Failed to execute AppleScript", e);
}

fs.writeFileSync('/tmp/gbp_kassia_text.txt', rawOutput);
console.log("Text saved to /tmp/gbp_kassia_text.txt");
