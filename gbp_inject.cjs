const fs = require('fs');
const { execSync } = require('child_process');

const FOLDER_PATH = '/Users/universparty/wa-web-launcher/kassia-site';

const payload = `
(async function() {
    window.__gbpTaskResult = null;
    try {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip]'));
        let editServicesBtn = btns.find(b => {
            let txt = (b.innerText || '').toLowerCase().trim();
            return txt === 'editează serviciile' || txt === 'modifică serviciile' || txt === 'edit services' || txt === 'servicii';
        });

        if (!editServicesBtn) {
            window.__gbpTaskResult = JSON.stringify({ error: 'SERVICES_BTN_NOT_FOUND', body: document.body.innerText.substring(0, 1000) });
            return;
        }

        editServicesBtn.click();
        
        await new Promise(r => setTimeout(r, 2500));

        let dialog = document.querySelector('div[role=dialog]');
        if (!dialog) {
            window.__gbpTaskResult = JSON.stringify({ error: 'DIALOG_NOT_FOUND' });
            return;
        }
        
                window.__gbpTaskResult = JSON.stringify({
            dialogHTML: dialog.outerHTML,
            dialogText: dialog.innerText
        });
        
    } catch (e) {
        window.__gbpTaskResult = JSON.stringify({ error: e.message });
    }
})();
`;

const triggerScript = `
tell application "Google Chrome"
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" then
                set has_btn to execute t javascript "Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip]')).some(b => ['editează serviciile', 'modifică serviciile', 'edit services', 'servicii'].includes((b.innerText || '').toLowerCase().trim()))"
                if has_btn is true then
                    execute t javascript "${payload.replace(/"/g, '\\"').replace(/\n/g, ' ')}"
                    return "INJECTED"
                end if
            end if
        end repeat
    end repeat
    return "NOT_FOUND"
end tell
`;

fs.writeFileSync('/tmp/trigger.scpt', triggerScript);
let res = execSync('osascript /tmp/trigger.scpt').toString().trim();
console.log("Trigger result:", res);

if (res === "INJECTED") {
    let result = null;
    for (let i = 0; i < 15; i++) {
        execSync('sleep 1');
        const pollScript = `
        tell application "Google Chrome"
            repeat with w in windows
                repeat with t in tabs of w
                    set u to URL of t
                    if u starts with "https://www.google.com/search" then
                        set r to execute t javascript "window.__gbpTaskResult"
                        if r is not missing value then return r
                    end if
                end repeat
            end repeat
            return ""
        end tell
        `;
        fs.writeFileSync('/tmp/poll.scpt', pollScript);
        let pollRes = execSync('osascript /tmp/poll.scpt').toString().trim();
        if (pollRes !== "" && pollRes !== "null") {
            result = pollRes;
            break;
        }
    }
    fs.writeFileSync('/tmp/gbp_explore_res.json', result || '{"error": "TIMEOUT"}');
    console.log("Extraction complete.");
}
