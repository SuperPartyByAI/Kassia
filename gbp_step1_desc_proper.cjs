const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Find NMX Tab and click Editează profilul
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

    if nmxTab is missing value then return "NO_TAB"

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

console.log("Open Edit Profile: " + runAppleScript(clickEditJs));
execSync('sleep 5');

// 2. Dump the buttons in the iframe
let dumpBtnsJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_EDITPROFILE_IFRAME';
        let doc = target.contentWindow.document;
        
        let els = Array.from(doc.querySelectorAll('button, div[role=button]'));
        return els.map(e => e.tagName + ' | text=' + (e.innerText || '').trim().replace(/\\n/g, ' ') + ' | aria-label=' + (e.getAttribute('aria-label') || '')).join('\\n');
    })();"
end tell
`;

console.log("\\nButtons in iframe:\\n" + runAppleScript(dumpBtnsJs));

// 3. Dump the text of the iframe
let dumpTextJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_EDITPROFILE_IFRAME';
        let doc = target.contentWindow.document;
        return doc.body.innerText;
    })();"
end tell
`;
console.log("\\nText in iframe:\\n" + runAppleScript(dumpTextJs));
