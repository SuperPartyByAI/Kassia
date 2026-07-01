const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Close any open dialogs on main page
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    key code 53
    delay 1
end tell
`);

// 2. Find tab and click Editeaza profilul
let clickEditJs = `
tell application "Google Chrome"
    activate
    set nmxTab to missing value
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" then
                set pageText to execute t javascript "document.body.innerText"
                if pageText contains "Compania ta pe Google" or pageText contains "Gestionezi acest profil" then
                    set active tab index of w to tabIndex
                    set index of w to 1
                    set nmxTab to t
                    exit repeat
                end if
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if nmxTab is not missing value then exit repeat
    end repeat

    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'editează profilul');
        if (target) {
            target.click();
            return 'CLICKED_EDIT_PROFILE';
        }
        return 'NOT_FOUND_EDIT_PROFILE';
    })();"
end tell
`;
console.log(runAppleScript(clickEditJs));
execSync('sleep 5');

// 3. Click Descriere inside iframe
let clickDescJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let els = Array.from(doc.querySelectorAll('div, span'));
        let desc = els.find(e => (e.innerText || '').trim() === 'Descriere' && e.children.length === 0);
        
        if (desc) {
            let clickable = desc.closest('div[role=button]') || desc.parentElement;
            if (clickable) {
                clickable.click();
                return 'CLICKED_DESC';
            }
        }
        
        // Alternative: Find button with aria-label containing 'descriere'
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], a'));
        let descBtn = btns.find(b => (b.getAttribute('aria-label') || '').toLowerCase().includes('descriere'));
        if (descBtn) {
            descBtn.click();
            return 'CLICKED_DESC_ARIA';
        }
        
        return 'DESC_NOT_FOUND';
    })();"
end tell
`;
console.log("Click Descriere: " + runAppleScript(clickDescJs));
execSync('sleep 2');

// 4. Focus textarea
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

// 5. Paste and save
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
                return 'SAVED_DESC';
            }
            return 'NO_SAVE_BTN';
        })();"
    end tell
    `;
    console.log("Save: " + runAppleScript(saveJs));
}
