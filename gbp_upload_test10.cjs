const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpIframesJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        return JSON.stringify(iframes.map(i => ({ src: i.src, display: i.style.display, id: i.id })));
    })();"
end tell
`;
console.log(runAppleScript(dumpIframesJs));
