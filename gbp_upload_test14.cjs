const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let clickPhotosJs = `
tell application "Google Chrome" to activate
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'fotografii' || (b.innerText || '').toLowerCase().trim() === 'photos');
        if (target) {
            target.click();
            return 'CLICKED_FOTOGRAFII';
        }
    })();"
end tell
delay 3
`;
console.log(runAppleScript(clickPhotosJs));

let dumpUIJs = `
tell application "System Events"
    tell process "Google Chrome"
        set frontWin to front window
        set uiElements to every UI element of frontWin
        set out to ""
        repeat with el in uiElements
            set out to out & (role of el as string) & " - " & (name of el as string) & "\\n"
        end repeat
        return out
    end tell
end tell
`;
console.log(runAppleScript(dumpUIJs));
