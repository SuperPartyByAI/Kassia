const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpIframeSrcJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        return iframes.map(i => i.src).join('\\n');
    })();"
end tell
`;
console.log("Iframe URLs:\\n" + runAppleScript(dumpIframeSrcJs));
