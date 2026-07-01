const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Focus the file input using JS
let focusJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        // Caută în iframes
        let iframes = Array.from(document.querySelectorAll('iframe'));
        for (let i of iframes) {
            try {
                let doc = i.contentWindow.document;
                let inputs = Array.from(doc.querySelectorAll('input[type=file]'));
                if (inputs.length > 0) {
                    inputs[0].focus();
                    return 'FOCUSED_FILE_INPUT_IN_IFRAME';
                }
                
                // Dacă nu e input de file, căutăm un buton 'Adaugă fotografii cu compania'
                let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
                let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'adaugă fotografii cu compania' || (b.innerText || '').toLowerCase().trim() === 'adaugă fotografii');
                if (target) {
                    target.focus();
                    return 'FOCUSED_BUTTON_IN_IFRAME';
                }
            } catch(e) {}
        }
        return 'NOTHING_FOCUSED';
    })();"
end tell
`;
console.log("FOCUS RESULT: " + runAppleScript(focusJs));

// 2. Press Enter using System Events
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    key code 36 -- Enter
    delay 1
    key code 49 -- Space (just in case)
    delay 2
end tell
`);

// 3. Check if file picker opened
let checkDialogJs = `
tell application "System Events"
    tell process "Google Chrome"
        set isFilePicker to exists (window 1 whose subrole is "AXStandardWindow" and name contains "Open")
        set isSheet to exists (sheet 1 of window 1)
        return "FilePicker: " & isFilePicker & " | Sheet: " & isSheet
    end tell
end tell
`;
console.log("CHECK DIALOG: " + runAppleScript(checkDialogJs));
