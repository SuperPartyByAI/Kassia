const fs = require('fs');
const { execSync } = require('child_process');

const appleScriptPath = '/tmp/explore_services.scpt';
const appleScriptContent = `
tell application "Google Chrome"
    set json_result to ""
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if (u contains "google.com") and (u does not contain "chatgpt.com") then
                set has_nmx to execute t javascript "document.documentElement.outerHTML.toLowerCase().includes('compania ta') || document.documentElement.outerHTML.toLowerCase().includes('editează pro')"
                if has_nmx is true then
                    set js_click to "
                    (function() {
                        let btns = Array.from(document.querySelectorAll('div[role=button], a, button')).filter(b => {
                            let txt = (b.innerText || '').toLowerCase().trim();
                            return txt === 'editează serviciile' || txt === 'modifică serviciile' || txt === 'edit services' || txt === 'servicii' || txt === 'services';
                        });
                        if (btns.length > 0) {
                            btns[0].click();
                            return 'CLICKED';
                        }
                        return 'NOT_FOUND';
                    })();
                    "
                    execute t javascript js_click
                    delay 4
                    
                    set js_extract to "
                    (function() {
                        let dialog = document.querySelector('div[role=dialog]');
                        if (!dialog) return 'NO_DIALOG';
                        return dialog.outerHTML;
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

fs.writeFileSync('/tmp/gbp_services_modal.html', rawOutput);
console.log("Modal HTML saved to /tmp/gbp_services_modal.html");
