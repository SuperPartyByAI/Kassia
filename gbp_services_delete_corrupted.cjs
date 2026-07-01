const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Find tab and delete
let deleteJs = `
tell application "Google Chrome"
    activate
    set nmxTab to missing value
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" or u starts with "https://local.google.com" then
                set active tab index of w to tabIndex
                set index of w to 1
                set nmxTab to t
                exit repeat
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if nmxTab is not missing value then exit repeat
    end repeat

    if nmxTab is missing value then return "NO_TAB_FOUND"

    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        // Find 'Șterge serviciul'
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        let deleteBtn = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            return t === 'șterge serviciul' || t === 'delete service' || t === 'anulează' || t === 'cancel';
        });
        
        if (deleteBtn) {
            deleteBtn.click();
            return 'CLICKED_DELETE_OR_CANCEL';
        }
        
        // If not found, maybe it's just an input we can clear? Or just click Anuleaza if we are in main list?
        return 'NOT_FOUND_DELETE';
    })();"
end tell
`;

console.log("Delete status: " + runAppleScript(deleteJs));
execSync('sleep 2');

let confirmJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('button, div[role=button], span'));
        let confirmBtn = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            return t === 'șterge' || t === 'delete' || t === 'da' || t === 'yes' || t === 'renunță' || t === 'discard';
        });
        if (confirmBtn) {
            confirmBtn.click();
            return 'CONFIRMED_DELETE';
        }
        
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (target) {
            let doc = target.contentWindow.document;
            let btnsI = Array.from(doc.querySelectorAll('button, div[role=button], span'));
            let confirmBtnI = btnsI.find(b => {
                let t = (b.innerText || '').toLowerCase().trim();
                return t === 'șterge' || t === 'delete' || t === 'da' || t === 'yes' || t === 'renunță' || t === 'discard';
            });
            if (confirmBtnI) {
                confirmBtnI.click();
                return 'CONFIRMED_DELETE_IFRAME';
            }
        }
        return 'NO_CONFIRM_NEEDED';
    })();"
end tell
`;
console.log("Confirm status: " + runAppleScript(confirmJs));
