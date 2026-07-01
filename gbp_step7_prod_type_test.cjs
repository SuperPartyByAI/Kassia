const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Focus Nume produs
let focusNameJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        let doc = target.contentWindow.document;
        
        let inputs = Array.from(doc.querySelectorAll('input[type=text]'));
        let nameInput = inputs.find(i => (i.getAttribute('aria-label') || '').includes('Nume') || (i.placeholder || '').includes('Nume'));
        if (nameInput) {
            nameInput.focus();
            return 'FOCUSED_NAME';
        }
        return 'NO_NAME_INPUT';
    })();"
end tell
`;
console.log(runAppleScript(focusNameJs));

// Type the name
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    keystroke "Programe animatori copii"
    delay 0.5
end tell
`);

// 2. Click Category dropdown
let focusCatJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        let doc = target.contentWindow.document;
        
        let dropdown = doc.querySelector('div[role=listbox]') || Array.from(doc.querySelectorAll('div[role=button]')).find(b => (b.innerText || '').includes('Selectează o categorie'));
        if (dropdown) {
            dropdown.click();
            return 'CLICKED_DROPDOWN';
        }
        return 'NO_DROPDOWN';
    })();"
end tell
`;
console.log(runAppleScript(focusCatJs));
execSync('sleep 1');

// Type category and press enter to create it if needed
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    keystroke "Petreceri Copii"
    delay 1
    key code 36 -- Enter
    delay 0.5
end tell
`);

let dumpTextJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        let doc = target.contentWindow.document;
        return doc.body.innerText;
    })();"
end tell
`;
console.log("PAGE TEXT:\\n" + runAppleScript(dumpTextJs));
