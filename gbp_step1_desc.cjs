const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Ensure the iframe is open and click "Descriere"
let clickDescJs = `
tell application "Google Chrome"
    activate
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let els = Array.from(doc.querySelectorAll('div, span'));
        // Find the block for Descriere
        let descBlock = els.find(e => (e.innerText || '').trim() === 'Descriere' && e.children.length === 0);
        if (descBlock) {
            // Usually the clickable div is an ancestor
            let clickable = descBlock.closest('div[role=button]') || descBlock.parentElement;
            if (clickable) {
                clickable.click();
                return 'CLICKED_DESC';
            }
        }
        return 'DESC_NOT_FOUND';
    })();"
end tell
`;

console.log("Click Descriere: " + runAppleScript(clickDescJs));
execSync('sleep 2');

// Now a textarea should be visible in the iframe!
let typeDescJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let textarea = doc.querySelector('textarea');
        if (textarea) {
            textarea.focus();
            textarea.value = '';
            textarea.dispatchEvent(new Event('input', {bubbles: true}));
            return 'FOCUSED_TEXTAREA';
        }
        return 'NO_TEXTAREA';
    })();"
end tell
`;

let focusRes = runAppleScript(typeDescJs);
console.log("Focus: " + focusRes);

if (focusRes === 'FOCUSED_TEXTAREA') {
    let desc = "Kassia Events organizează petreceri pentru copii și evenimente în București și Ilfov, cu animatori, mascote, personaje tematice, pictură pe față, modelaj de baloane, mini-disco, jocuri interactive, decoruri cu baloane, arcade, ghirlande, panouri foto, vată de zahăr, popcorn și pachete complete pentru botez, moț, turtă, grădinițe, școli, petreceri corporate și evenimente sezoniere precum Moș Crăciun sau Iepurașul de Paște.";
    execSync(`echo "${desc}" | pbcopy`);
    
    runAppleScript(`
    tell application "Google Chrome" to activate
    tell application "System Events"
        keystroke "v" using command down
        delay 0.5
    end tell
    `);
    
    let verifyAndSaveJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
            let doc = target.contentWindow.document;
            let textarea = doc.querySelector('textarea');
            let val = textarea ? textarea.value : '';
            
            let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
            let saveBtn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'salvează' || (b.innerText || '').toLowerCase().trim() === 'save');
            if (saveBtn && val.length > 50) {
                saveBtn.click();
                return 'SAVED_DESC';
            }
            return 'VALUE_NOT_OK_OR_NO_SAVE';
        })();"
    end tell
    `;
    console.log("Save Status: " + runAppleScript(verifyAndSaveJs));
    execSync('sleep 3');
}
