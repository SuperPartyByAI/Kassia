const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let uploadJs = `
tell application "Google Chrome" to activate
delay 0.5
tell application "System Events"
    -- Deschidem dialogul 'Go to folder' (Cmd+Shift+G)
    keystroke "g" using {command down, shift down}
    delay 1
    
    -- Introducem calea către folder
    keystroke "/Users/universparty/Desktop/KASSIA_GBP_UPLOAD_30_READY"
    delay 1
    
    -- Apăsăm Enter pentru a accesa folderul
    key code 36
    delay 2
    
    -- Selectăm toate fișierele (Cmd+A)
    keystroke "a" using {command down}
    delay 1
    
    -- Apăsăm Enter pentru a confirma și a uploada
    key code 36
end tell
`;
console.log(runAppleScript(uploadJs));
