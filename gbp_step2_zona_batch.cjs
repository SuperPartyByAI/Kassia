const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let zones = [
    "Sector 2", "Sector 3", "Sector 4", "Sector 5", "Sector 6",
    "Ilfov", "Popești-Leordeni", "Voluntari", "Otopeni", "Chiajna",
    "Bragadiru", "Măgurele", "Pantelimon", "Berceni", "Domnești",
    "Tunari", "Corbeanca", "Pipera"
];

let focusJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let inputs = Array.from(doc.querySelectorAll('input[type=text]'));
        let input = inputs.find(i => (i.placeholder || '').toLowerCase().includes('zonă') || (i.placeholder || '').toLowerCase().includes('area'));
        if (!input) input = inputs[0];
        
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

for (let zone of zones) {
    console.log("Adding " + zone);
    
    let focusRes = runAppleScript(focusJs);
    if (focusRes !== 'FOCUSED') {
        console.log("-> Failed to focus input for " + zone);
        continue;
    }
    
    execSync(`echo "${zone}" | pbcopy`);
    runAppleScript(`
    tell application "Google Chrome" to activate
    tell application "System Events"
        keystroke "v" using command down
        delay 1.0
        key code 125 -- Down arrow
        delay 0.5
        key code 36  -- Enter
        delay 1.5
    end tell
    `);
}

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
            return 'SAVED_ZONES';
        }
        return 'NO_SAVE_BTN';
    })();"
end tell
`;
console.log("Save zones: " + runAppleScript(saveJs));
