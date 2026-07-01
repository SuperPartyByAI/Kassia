const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let focusInputJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let inputs = Array.from(doc.querySelectorAll('input[type=text], input[type=url]'));
        if (inputs.length > 0) {
            let input = inputs[0];
            input.focus();
            input.value = '';
            input.dispatchEvent(new Event('input', {bubbles: true}));
            return 'FOCUSED_INPUT';
        }
        return 'NO_INPUT';
    })();"
end tell
`;
let focusRes = runAppleScript(focusInputJs);
console.log("Focus Input: " + focusRes);

if (focusRes === 'FOCUSED_INPUT') {
    execSync('echo "https://www.kassia.ro/contact" | pbcopy');
    runAppleScript(`
    tell application "Google Chrome" to activate
    tell application "System Events"
        keystroke "v" using command down
        delay 0.5
    end tell
    `);
    
    // Click Save
    let saveJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
            let doc = target.contentWindow.document;
            
            let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
            let saveBtn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'salvează' || (b.innerText || '').toLowerCase().trim() === 'save');
            if (saveBtn) {
                saveBtn.click();
                return 'SAVED_LINK';
            }
            return 'NO_SAVE_BTN';
        })();"
    end tell
    `;
    console.log("Save Link: " + runAppleScript(saveJs));
}
