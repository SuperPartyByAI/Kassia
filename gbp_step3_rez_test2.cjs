const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Ensure no dialog is open
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    key code 53
    delay 1
end tell
`);

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

let dumpModalJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let iframe = iframes.find(i => (i.src || '').includes('reserve') || (i.src || '').includes('booking'));
        if (iframe) return 'IFRAME: ' + iframe.contentWindow.document.body.innerText;
        
        let dialog = document.querySelector('div[role=dialog]');
        if (dialog) return 'DIALOG: ' + dialog.innerText;
        return 'NOTHING_OPENED';
    })();"
end tell
`;
console.log(runAppleScript(dumpModalJs));
