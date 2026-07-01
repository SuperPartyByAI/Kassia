const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let focusJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let inputs = Array.from(doc.querySelectorAll('input[type=text]'));
        let input = inputs.find(i => (i.placeholder || '').toLowerCase().includes('zonă') || (i.placeholder || '').toLowerCase().includes('area'));
        if (!input) input = inputs[0]; // fallback to first text input
        
        if (input) {
            input.focus();
            input.value = '';
            input.dispatchEvent(new Event('input', {bubbles: true}));
            return 'FOCUSED';
        }
        return 'NO_INPUT';
    })();"
end tell
`;
console.log("Focus: " + runAppleScript(focusJs));

execSync('echo "Sector 1" | pbcopy');
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    keystroke "v" using command down
    delay 1.0
    key code 125 -- Down arrow
    delay 0.5
    key code 36  -- Enter
    delay 1.0
end tell
`);

let checkJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let chips = Array.from(doc.querySelectorAll('div[role=button], button')).filter(b => {
            let aria = (b.getAttribute('aria-label') || '').toLowerCase();
            return aria.includes('ștergeți') || aria.includes('remove') || aria.includes('delete');
        });
        
        return chips.map(c => {
            let p = c.parentElement;
            return p ? p.innerText : 'Unknown';
        }).join(', ');
    })();"
end tell
`;
console.log("Selected zones: " + runAppleScript(checkJs));
