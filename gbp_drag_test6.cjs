const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

execSync('sleep 5');

let dumpIframeBodyJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        // The add modal
        let targetFrame = iframes.find(i => (i.src || '').includes('photos/add'));
        if (!targetFrame) return 'NO_ADD_IFRAME';
        return targetFrame.contentWindow.document.body.innerText.substring(0, 1000);
    })();"
end tell
`;
console.log("IFRAME TEXT:\\n" + runAppleScript(dumpIframeBodyJs));
