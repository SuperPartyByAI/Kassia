const fs = require('fs');
const { execSync } = require('child_process');

const appleScriptPath = '/tmp/dump_buttons.scpt';
const appleScriptContent = `
tell application "Google Chrome"
    set json_result to ""
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" then
                set has_nmx to execute t javascript "document.documentElement.outerHTML.toLowerCase().includes('editează profilul')"
                if has_nmx is true then
                    set js_extract to "
                    (function() {
                        let btns = Array.from(document.querySelectorAll('a, button, div[role=button]'));
                        return btns.map(b => (b.innerText || '').trim().replace(/\\n/g, ' ')).filter(t => t.length > 0).join('\\n');
                    })();
                    "
                    set res to execute t javascript js_extract
                    if res is not missing value then
                        set json_result to res
                        exit repeat
                    end if
                end if
            end if
        end repeat
        if json_result is not "" then exit repeat
    end repeat
    return json_result
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
console.log("Buttons text saved to /tmp/gbp_buttons.txt");
