const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Close any dialogs
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    key code 53
    delay 1
    key code 53
    delay 1
end tell
`);

// 2. Click Rezervări on main NMX
let clickJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').trim() === 'Rezervări' || (b.innerText || '').trim() === 'Bookings');
        if (target) {
            target.click();
            return 'CLICKED_REZ';
        }
        return 'NOT_FOUND_REZ';
    })();"
end tell
`;
console.log(runAppleScript(clickJs));
execSync('sleep 5');

// 3. Dump iframes
let dumpIframesJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        return iframes.map(i => i.src).join('\\n');
    })();"
end tell
`;
console.log("Iframes:\\n" + runAppleScript(dumpIframesJs));

let dumpTextJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        // Usually booking is in a specific iframe or a modal
        let iframe = iframes.find(i => (i.src || '').includes('reserve') || (i.src || '').includes('booking'));
        if (iframe) return iframe.contentWindow.document.body.innerText;
        
        let dialog = document.querySelector('div[role=dialog]');
        if (dialog) return dialog.innerText;
        return 'NO_IFRAME_NO_DIALOG';
    })();"
end tell
`;
console.log("Modal text:\\n" + runAppleScript(dumpTextJs));
