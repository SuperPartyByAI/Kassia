const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let iframe = iframes.find(i => (i.src || '').includes('transactions'));
        if (iframe) return 'IFRAME_TEXT:\\n' + iframe.contentWindow.document.body.innerText;
        return document.body.innerText;
    })();"
end tell
`;
console.log(runAppleScript(dumpJs));
