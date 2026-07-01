const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let triggerFilePickerJs = `
tell application "Google Chrome" to activate
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let result = [];
        
        // Caută în main doc
        let mainInputs = Array.from(document.querySelectorAll('input[type=file]'));
        if (mainInputs.length > 0) {
            mainInputs[0].click();
            return 'CLICKED_MAIN_FILE_INPUT';
        }
        
        // Caută în iframes
        let iframes = Array.from(document.querySelectorAll('iframe'));
        for (let i of iframes) {
            try {
                let doc = i.contentWindow.document;
                let inputs = Array.from(doc.querySelectorAll('input[type=file]'));
                if (inputs.length > 0) {
                    inputs[0].click();
                    return 'CLICKED_IFRAME_FILE_INPUT';
                }
            } catch(e) {}
        }
        
        return 'NO_FILE_INPUT_FOUND';
    })();"
end tell
delay 2
`;
console.log(runAppleScript(triggerFilePickerJs));

// Check if file dialog is open
let checkDialogJs = `
tell application "System Events"
    tell process "Google Chrome"
        set isFilePicker to exists (window 1 whose subrole is "AXStandardWindow" and name contains "Open")
        set isSheet to exists (sheet 1 of window 1)
        return "FilePicker: " & isFilePicker & " | Sheet: " & isSheet
    end tell
end tell
`;
console.log(runAppleScript(checkDialogJs));
