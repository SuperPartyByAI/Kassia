const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Copy to clipboard
execSync(`echo "Stand popcorn" | pbcopy`);

// 2. JS to focus input, then AppleScript Cmd+V
let pasteScript = `
tell application "Google Chrome"
    activate
    
    -- Ensure NMX tab
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

    -- Focus input
    set focusJs to "(function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let input = doc.querySelector('input[type=text]');
        if (input) {
            input.focus();
            return 'FOCUSED';
        }
        return 'NO_INPUT';
    })();"
    
    set res to execute active tab of first window javascript focusJs
    if res is "FOCUSED" then
        tell application "System Events"
            delay 0.5
            keystroke "v" using command down
            delay 0.5
        end tell
        return "PASTED"
    else
        return res
    end if
end tell
`;
console.log("Paste status: " + runAppleScript(pasteScript));

// 3. Verify input and click Enter / Save
let verifyScript = `
tell application "Google Chrome"
    set verifyJs to "(function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        let doc = target.contentWindow.document;
        
        let input = doc.querySelector('input[type=text]');
        if (!input) return 'NO_INPUT_FOUND';
        
        if (input.value.trim() === 'Stand popcorn') {
            // Need to press Enter or find an Adauga button
            let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
            // Is there an Enter/Add for this specific one, or do we just press Enter?
            return 'VALUE_OK';
        }
        return 'VALUE_MISMATCH: ' + input.value;
    })();"
    
    set res to execute active tab of first window javascript verifyJs
    return res
end tell
`;
let verifyRes = runAppleScript(verifyScript);
console.log("Verify status: " + verifyRes);

if (verifyRes === 'VALUE_OK') {
    console.log("Pressing Enter to confirm the service addition...");
    runAppleScript(`
    tell application "System Events"
        key code 36 -- Return
        delay 1
    end tell
    `);
    
    console.log("Clicking Salvează...");
    let saveScript = `
    tell application "Google Chrome"
        set saveJs to "(function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            let doc = target.contentWindow.document;
            let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
            let saveBtn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'salvează' || (b.innerText || '').toLowerCase().trim() === 'save');
            if (saveBtn) {
                saveBtn.click();
                return 'SAVED';
            }
            return 'NO_SAVE_BTN';
        })();"
        return execute active tab of first window javascript saveJs
    end tell
    `;
    console.log("Save status: " + runAppleScript(saveScript));
    execSync('sleep 5');
    
    let checkScript = `
    tell application "Google Chrome"
        set checkJs to "(function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            if (!target) return 'IFRAME_CLOSED';
            let doc = target.contentWindow.document;
            return doc.body.innerText;
        })();"
        return execute active tab of first window javascript checkJs
    end tell
    `;
    let finalCheck = runAppleScript(checkScript);
    if (finalCheck.toLowerCase().includes('stand popcorn')) {
        console.log("SUCCESS: 'Stand popcorn' FOUND in final check!");
    } else {
        console.log("FAIL: 'Stand popcorn' NOT FOUND in final check.");
        console.log("DUMP: " + finalCheck);
    }
}
