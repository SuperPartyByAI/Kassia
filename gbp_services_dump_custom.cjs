const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Ensure NMX tab and click Modifica serviciile
let openPanelJs = `
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
            else if u starts with "https://local.google.com" then
                set active tab index of w to tabIndex
                set index of w to 1
                set nmxTab to t
                exit repeat
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if nmxTab is not missing value then exit repeat
    end repeat

    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            return t === 'modifică serviciile' || t === 'edit services' || t === 'editează serviciile';
        });
        if (target) {
            target.click();
            return 'CLICKED_EDIT';
        }
        return 'NOT_FOUND_EDIT';
    })();"
end tell
`;
runAppleScript(openPanelJs);
execSync('sleep 5');

// 2. Dump all inputs
let dumpJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let inputs = Array.from(doc.querySelectorAll('input, textarea'));
        let data = inputs.map(i => i.tagName + ' | type=' + i.type + ' | placeholder=' + (i.placeholder || '') + ' | value=' + (i.value || '') + ' | aria-label=' + (i.getAttribute('aria-label') || ''));
        return data.join('\\n');
    })();"
end tell
`;
console.log("Inputs before click:\\n" + runAppleScript(dumpJs));

// Click Adauga un serviciu personalizat
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return;
        let doc = target.contentWindow.document;
        
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        let addMore = btns.find(b => (b.innerText || '').toLowerCase().includes('adăugați mai multe servicii'));
        if (addMore) addMore.click();
    })();"
end tell
`);
execSync('sleep 2');

runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return;
        let doc = target.contentWindow.document;
        
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        let customBtn = btns.find(b => (b.innerText || '').toLowerCase().includes('adaugă un serviciu personalizat'));
        if (customBtn) customBtn.click();
    })();"
end tell
`);
execSync('sleep 2');

console.log("\\nInputs after click:\\n" + runAppleScript(dumpJs));

// Dump innerText to see the UI layout
let textJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_IFRAME';
        return target.contentWindow.document.body.innerText;
    })();"
end tell
`;
console.log("\\nInnerText after click:\\n" + runAppleScript(textJs));
