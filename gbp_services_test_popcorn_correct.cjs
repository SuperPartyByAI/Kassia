const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Ensure NMX tab and click Modifica serviciile
let openPanelJs = `
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
`;
console.log("Open panel: " + runAppleScript(openPanelJs));
execSync('sleep 5');

// Check if we are in main list
let checkStateJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        return doc.body.innerText.includes('Modifică detaliile despre serviciu') ? 'IN_DETAILS' : 'IN_MAIN_LIST';
    })();"
end tell
`;
let state = runAppleScript(checkStateJs);
if (state === 'IN_DETAILS') {
    runAppleScript(`
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            let doc = target.contentWindow.document;
            let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
            let cancel = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'anulează');
            if (cancel) cancel.click();
        })();"
    end tell
    `);
    execSync('sleep 2');
}

// 2. Inside iframe, click "Adauga un serviciu personalizat"
let addCustomJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        let customBtn = btns.find(b => (b.innerText || '').toLowerCase().includes('adaugă un serviciu personalizat'));
        
        if (!customBtn) {
            let addMore = btns.find(b => (b.innerText || '').toLowerCase().includes('adăugați mai multe servicii'));
            if (addMore) addMore.click();
        }
        return 'READY';
    })();"
end tell
`;
runAppleScript(addCustomJs);
execSync('sleep 2');

let clickCustomJs = `
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
`;
console.log("Click Custom Btn: " + runAppleScript(clickCustomJs));
execSync('sleep 3');

// 3. Focus and type "Stand popcorn"
let srv = "Stand popcorn";
execSync(`echo "${srv}" | pbcopy`);

let pasteJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        let doc = target.contentWindow.document;
        let input = doc.querySelector('input[type=text]');
        if (input) {
            input.focus();
            input.value = '';
            input.dispatchEvent(new Event('input', {bubbles: true}));
            return 'FOCUSED';
        }
        return 'NO_INPUT';
    })();"
end tell
`;
console.log("Focus: " + runAppleScript(pasteJs));
execSync('sleep 1');

// Paste using AppleScript
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    keystroke "v" using command down
    delay 0.5
end tell
`);

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
console.log("Value after paste: " + val);

// 4. Save and close DETAILS screen
if (val.trim() === srv) {
    let saveDetailsJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            let doc = target.contentWindow.document;
            let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
            let saveBtn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'salvează' || (b.innerText || '').toLowerCase().trim() === 'save');
            if (saveBtn) {
                saveBtn.click();
                return 'SAVED_DETAILS';
            }
            return 'NO_SAVE_BTN';
        })();"
    end tell
    `;
    console.log("Save Details status: " + runAppleScript(saveDetailsJs));
    execSync('sleep 3');
    
    // Now we are back in the main list. We need to save the MAIN list.
    let saveMainJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            if (!target) return 'NO_IFRAME';
            let doc = target.contentWindow.document;
            let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
            let saveBtn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'salvează' || (b.innerText || '').toLowerCase().trim() === 'save');
            if (saveBtn) {
                saveBtn.click();
                return 'SAVED_MAIN';
            }
            return 'NO_MAIN_SAVE_BTN';
        })();"
    end tell
    `;
    console.log("Save Main status: " + runAppleScript(saveMainJs));
    execSync('sleep 5');
    
    // Reopen to verify
    console.log("Re-opening to verify...");
    runAppleScript(openPanelJs);
    execSync('sleep 5');
    
    let checkJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            if (!target) return 'NO_IFRAME';
            let doc = target.contentWindow.document;
            return doc.body.innerText;
        })();"
    end tell
    `;
    let res = runAppleScript(checkJs);
    if (res.toLowerCase().includes(srv.toLowerCase())) {
        console.log("VERIFIED: '" + srv + "' is visible in the panel!");
    } else {
        console.log("NOT FOUND: '" + srv + "' is missing in the panel.");
    }
} else {
    console.log("Mismatch, not saving.");
}
