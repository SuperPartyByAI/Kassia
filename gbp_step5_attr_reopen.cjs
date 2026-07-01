const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Hit Esc to close current modal
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    key code 53
    delay 1
    key code 53
    delay 1
end tell
`);

// 2. Click Editează profilul again
let clickEditJs = `
tell application "Google Chrome"
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

// 3. Click "Mai multe"
let clickMoreJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let els = Array.from(doc.querySelectorAll('div, span, a'));
        let txt = els.find(e => (e.innerText || '').trim() === 'Mai multe' && e.children.length === 0);
        if (txt) {
            let btn = txt.closest('div[role=tab]') || txt.closest('a') || txt.closest('button') || txt.parentElement;
            if (btn) btn.click();
            return 'CLICKED_MAI_MULTE';
        }
        return 'NO_MAI_MULTE_TAB';
    })();"
end tell
`;
console.log(runAppleScript(clickMoreJs));
execSync('sleep 3');

// 4. Dump text
let dumpTextJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        return doc.body.innerText;
    })();"
end tell
`;
console.log(runAppleScript(dumpTextJs));
