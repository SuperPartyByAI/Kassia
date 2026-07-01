const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let clickEditJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'editează profilul' || (b.innerText || '').toLowerCase().trim() === 'edit profile');
        if (target) {
            target.click();
            return 'CLICKED_EDIT_PROFILE';
        }
        return 'NO_BTN_EDIT_PROFILE';
    })();"
end tell
`;
console.log(runAppleScript(clickEditJs));
execSync('sleep 5');

let extractProofJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let descText = '';
        let descStatus = '';
        let descDiv = Array.from(doc.querySelectorAll('div, span')).find(d => (d.innerText || '').trim() === 'Descriere' && d.children.length === 0);
        if (descDiv) {
            let parent = descDiv.parentElement.parentElement;
            if (parent.innerText.includes('ÎN AȘTEPTARE') || parent.innerText.includes('PENDING') || parent.innerText.includes('Modificarea este în așteptare')) descStatus = 'PENDING';
            else descStatus = 'LIVE';
            descText = parent.innerText;
        }
        
        let zoneText = '';
        let zoneDiv = Array.from(doc.querySelectorAll('div, span')).find(d => (d.innerText || '').trim() === 'Zonă de servicii' && d.children.length === 0);
        if (zoneDiv) {
            let parent = zoneDiv.parentElement.parentElement.parentElement;
            zoneText = parent.innerText;
        }
        
        return JSON.stringify({
            description: descText,
            description_status: descStatus,
            zones: zoneText
        }, null, 2);
    })();"
end tell
`;
console.log("PROOF:\\n" + runAppleScript(extractProofJs));
