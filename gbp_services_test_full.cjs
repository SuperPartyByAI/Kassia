const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Activate Chrome and ensure NMX tab
console.log("Activating Chrome...");
runAppleScript(`
tell application "Google Chrome"
    activate
    set nmxTab to missing value
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" then
                set pageText to execute t javascript "document.body.innerText"
                if pageText contains "Compania ta pe Google" or pageText contains "Gestionezi acest profil" then
                    set active tab index of w to tabIndex
                    set index of w to 1
                    set nmxTab to t
                    exit repeat
                end if
            else if u starts with "https://local.google.com" then
                set active tab index of w to tabIndex
                set index of w to 1
                set nmxTab to t
                exit repeat
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if nmxTab is not missing value then exit repeat
    end repeat
end tell
`);

// 2. Open "Modifică serviciile" on the main document
console.log("Opening Modifică serviciile...");
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            return t === 'modifică serviciile' || t === 'edit services' || t === 'editează serviciile';
        });
        if (target) {
            target.click();
            return 'CLICKED_EDIT';
        }
        return 'NOT_FOUND_EDIT';
    })();"
end tell
`);
execSync('sleep 5');

// 3. Navigate into iframe, click "Adăugați mai multe servicii", then "Adaugă un serviciu personalizat"
console.log("Navigating iframe...");
let navJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        
        // If we are in edit mode of a single service, click Anuleaza
        let cancel = btns.find(b => (b.innerText || '').toLowerCase().includes('anulează'));
        let customBtn = btns.find(b => (b.innerText || '').toLowerCase().includes('adaugă un serviciu personalizat'));
        
        if (!customBtn) {
            let addMore = btns.find(b => (b.innerText || '').toLowerCase().includes('adăugați mai multe servicii'));
            if (addMore) {
                addMore.click();
            } else if (cancel) {
                cancel.click();
            }
        }
        return 'NAVIGATED';
    })();"
end tell
`;
console.log(runAppleScript(navJs));
execSync('sleep 2');

// click Adaugă un serviciu personalizat
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return;
        let doc = target.contentWindow.document;
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        let customBtn = btns.find(b => (b.innerText || '').toLowerCase().includes('adaugă un serviciu personalizat'));
        if (customBtn) customBtn.click();
    })();"
end tell
`);
execSync('sleep 2');

// 4. Focus input and paste "Stand popcorn"
console.log("Pasting 'Stand popcorn'...");
execSync(`echo "Stand popcorn" | pbcopy`);
let focusJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        let doc = target.contentWindow.document;
        let input = doc.querySelector('input[type=text]');
        if (input) {
            input.focus();
            return 'FOCUSED';
        }
        return 'NO_INPUT';
    })();"
end tell
`;
console.log(runAppleScript(focusJs));
runAppleScript(`
tell application "System Events"
    delay 0.5
    keystroke "v" using command down
    delay 0.5
end tell
`);

// 5. Verify and Save
let verifyJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        let doc = target.contentWindow.document;
        let input = doc.querySelector('input[type=text]');
        return input ? input.value : 'NO_INPUT';
    })();"
end tell
`;
let val = runAppleScript(verifyJs);
console.log("Input value is: " + val);

if (val.trim() === 'Stand popcorn') {
    runAppleScript(`
    tell application "System Events"
        key code 36 -- Return
        delay 1
    end tell
    `);
    console.log("Clicked Return");
    
    // Check if we need to click Save
    let saveJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            if (!target) return 'NO_IFRAME';
            let doc = target.contentWindow.document;
            let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
            let saveBtn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'salvează');
            if (saveBtn) {
                saveBtn.click();
                return 'SAVED';
            }
            return 'NO_SAVE_BTN';
        })();"
    end tell
    `;
    console.log(runAppleScript(saveJs));
    execSync('sleep 5');
    
    console.log("Popcorn flow finished.");
} else {
    console.log("VALUE MISMATCH, aborting save.");
}
