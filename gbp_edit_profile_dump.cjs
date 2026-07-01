const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let openEditProfileJs = `
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
        let target = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            return t === 'editează profilul' || t === 'edit profile' || t === 'editeaza profilul';
        });
        if (target) {
            target.click();
            return 'CLICKED_EDIT_PROFILE';
        }
        return 'NOT_FOUND_EDIT_PROFILE';
    })();"
end tell
`;

console.log("Open Edit Profile: " + runAppleScript(openEditProfileJs));
execSync('sleep 5');

// Now dump the innerText of the modal iframe to see what we have
let dumpJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        // The edit profile iframe usually has src containing 'editprofile' but NOT 'services' specifically, or maybe just 'editprofile'
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        return doc.body.innerText;
    })();"
end tell
`;

console.log("Iframe Content:\\n" + runAppleScript(dumpJs));
