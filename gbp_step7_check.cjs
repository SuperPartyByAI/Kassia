const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let checkJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        return 'IFRAME COUNT: ' + document.querySelectorAll('iframe').length;
    })();"
end tell
`;
console.log(runAppleScript(checkJs));

let dumpTextJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        return 'BODY TEXT LENGTH: ' + document.body.innerText.length;
    })();"
end tell
`;
console.log(runAppleScript(dumpTextJs));

let urlJs = `
tell application "Google Chrome"
    return URL of active tab of first window
end tell
`;
console.log("Current URL: " + runAppleScript(urlJs));
