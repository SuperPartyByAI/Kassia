const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Click "Adaugă un link"
let clickAddLinkJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        // Find the active iframe. It seems to be editprofile or similar.
        let target = iframes.find(i => {
            try { return (i.contentWindow.document.body.innerText || '').includes('Adaugă un link'); } 
            catch(e) { return false; }
        });
        
        if (!target) return 'NO_IFRAME_WITH_LINK';
        let doc = target.contentWindow.document;
        
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        let addBtn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'adaugă un link');
        
        if (addBtn) {
            let clickable = addBtn.closest('button') || addBtn.closest('div[role=button]') || addBtn;
            clickable.click();
            return 'CLICKED_ADD_LINK';
        }
        return 'BTN_NOT_FOUND';
    })();"
end tell
`;
console.log("Click Add Link: " + runAppleScript(clickAddLinkJs));
execSync('sleep 2');

// 2. Focus input and type link
let focusInputJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => {
            try { return (i.contentWindow.document.body.innerText || '').includes('Adaugă un link'); } 
            catch(e) { return false; }
        });
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
            let target = iframes.find(i => {
                try { return (i.contentWindow.document.body.innerText || '').includes('Adaugă un link'); } 
                catch(e) { return false; }
            });
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
