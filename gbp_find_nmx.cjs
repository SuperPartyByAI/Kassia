const fs = require('fs');
const { execSync } = require('child_process');

const appleScriptPath = '/tmp/find_nmx_tab.scpt';
const appleScriptContent = `
tell application "Google Chrome"
    set res to ""
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if u contains "google.com" and u does not contain "chatgpt.com" then
                set has_nmx to execute t javascript "document.documentElement.outerHTML.toLowerCase().includes('compania ta') || document.documentElement.outerHTML.toLowerCase().includes('editează pro')"
                if has_nmx is true then
                    set res to res & "NMX Tab found: " & (title of t) & " - " & u & "\\n"
                end if
            end if
        end repeat
    end repeat
    if res is "" then return "NOT_FOUND"
    return res
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
