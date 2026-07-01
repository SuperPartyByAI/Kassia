const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Open Finder
let openFinderJs = `
tell application "Finder"
    activate
    open POSIX file "/Users/universparty/Desktop/KASSIA_GBP_UPLOAD_73_READY"
    set bounds of front Finder window to {0, 40, 300, 860}
    set current view of front Finder window to icon view
    delay 1
    select every item of front Finder window
end tell
`;
console.log("FINDER: " + runAppleScript(openFinderJs));
