const fs = require('fs');
const { execSync } = require('child_process');

const appleScriptPath = '/tmp/dump_buttons_kassia.scpt';
const appleScriptContent = `
tell application "Google Chrome"
    set res to ""
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if title of t contains "Kassia Events" and u starts with "https://www.google.com/search" then
                set res to execute t javascript "
                (function() {
                    let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip]'));
                    return btns.map(b => (b.innerText || '').trim().replace(/\\n/g, ' ')).filter(t => t.length > 0).join('\\n');
                })();
                "
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

fs.writeFileSync('/tmp/gbp_buttons.txt', rawOutput);
console.log("Buttons saved to /tmp/gbp_buttons.txt");
