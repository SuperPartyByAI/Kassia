const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Ensure Feedback is closed using click on close button
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('button'));
        let close = btns.find(b => (b.getAttribute('aria-label') || '').toLowerCase().includes('închide') || (b.getAttribute('aria-label') || '').toLowerCase().includes('close'));
        if (close) close.click();
    })();"
end tell
`);
execSync('sleep 2');

let dumpJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button]'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'rezervări');
        if (target) {
            target.click();
            return 'CLICKED_REZERVARI';
        }
        return 'NOT_FOUND_REZERVARI';
    })();"
end tell
`;
console.log(runAppleScript(dumpJs));
execSync('sleep 5');

let dumpIframesJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        return iframes.map(i => i.src).join('\\n');
    })();"
end tell
`;
console.log("All iframes:\\n" + runAppleScript(dumpIframesJs));
