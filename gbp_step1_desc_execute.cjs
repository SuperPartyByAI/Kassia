const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let typeDescJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        // Find Descriere
        let els = Array.from(doc.querySelectorAll('div, span'));
        let desc = els.find(e => (e.innerText || '').trim() === 'Descriere' && e.children.length === 0);
        
        if (desc) {
            let clickable = desc.closest('div[role=button]') || desc.parentElement;
            if (clickable) {
                clickable.click();
                return 'CLICKED_DESC';
            }
        }
        return 'DESC_NOT_FOUND';
    })();"
end tell
`;

console.log("Click Descriere: " + runAppleScript(typeDescJs));
execSync('sleep 2');

let focusJs = `
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
let focusRes = runAppleScript(focusJs);
console.log("Focus: " + focusRes);

if (focusRes === 'FOCUSED_TEXTAREA') {
    let text = "Kassia Events organizează petreceri pentru copii și evenimente în București și Ilfov, cu animatori, mascote, personaje tematice, pictură pe față, modelaj de baloane, mini-disco, jocuri interactive, decoruri cu baloane, arcade, ghirlande, panouri foto, vată de zahăr, popcorn și pachete complete pentru botez, moț, turtă, grădinițe, școli, petreceri corporate și evenimente sezoniere precum Moș Crăciun sau Iepurașul de Paște.";
    execSync(`echo "${text}" | pbcopy`);
    
    runAppleScript(`
    tell application "Google Chrome" to activate
    tell application "System Events"
        keystroke "v" using command down
        delay 0.5
    end tell
    `);
    
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
                return 'SAVED';
            }
            return 'NO_SAVE_BTN';
        })();"
    end tell
    `;
    console.log("Save: " + runAppleScript(saveJs));
}
