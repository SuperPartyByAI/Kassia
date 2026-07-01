const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Click Rezervări
let clickRezJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'rezervări' || (b.innerText || '').toLowerCase().trim() === 'booking');
        if (target) {
            target.click();
            return 'CLICKED_REZ';
        }
        return 'NO_BTN_REZ';
    })();"
end tell
`;
console.log(runAppleScript(clickRezJs));
execSync('sleep 5');

let extractRezJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('booking'));
        if (!target) return 'NO_IFRAME';
        return target.contentWindow.document.body.innerText;
    })();"
end tell
`;
console.log("BOOKING PROOF:\\n" + runAppleScript(extractRezJs));
