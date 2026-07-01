const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Ensure Edit Profile is open (if not, open it)
let ensureEditJs = `
tell application "Google Chrome"
    activate
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (target) return 'ALREADY_OPEN';
        
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let editBtn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'editează profilul');
        if (editBtn) {
            editBtn.click();
            return 'CLICKED_EDIT_PROFILE';
        }
        return 'NOT_FOUND';
    })();"
end tell
`;
console.log("Ensure Edit Profile: " + runAppleScript(ensureEditJs));
execSync('sleep 3');

// Click Locatie tab or find Zona de servicii
let clickZonaJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        // Find aria-label containing 'zonă de servicii' or 'service area'
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], a'));
        let zonaBtn = btns.find(b => {
            let label = (b.getAttribute('aria-label') || '').toLowerCase();
            return label.includes('zonă de servicii') || label.includes('zone de servicii') || label.includes('service area');
        });
        
        if (zonaBtn) {
            zonaBtn.click();
            return 'CLICKED_ZONA_ARIA';
        }
        
        // Alternative: Find by text
        let els = Array.from(doc.querySelectorAll('div, span'));
        let zonaTxt = els.find(e => (e.innerText || '').toLowerCase().trim() === 'zonă de servicii' || (e.innerText || '').toLowerCase().trim() === 'zone de servicii');
        if (zonaTxt) {
            let clickable = zonaTxt.closest('div[role=button]') || zonaTxt.parentElement;
            if (clickable) {
                clickable.click();
                return 'CLICKED_ZONA_TEXT';
            }
        }
        
        return 'ZONA_NOT_FOUND';
    })();"
end tell
`;
console.log("Click Zona: " + runAppleScript(clickZonaJs));
execSync('sleep 3');

// Dump inputs and existing chips
let dumpZonaJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let inputs = Array.from(doc.querySelectorAll('input[type=text]'));
        let inputDump = inputs.map(i => i.placeholder + ' | ' + i.value).join('\\n');
        
        let chips = Array.from(doc.querySelectorAll('div[role=button], button')).filter(b => {
            let aria = (b.getAttribute('aria-label') || '').toLowerCase();
            return aria.includes('ștergeți') || aria.includes('remove') || aria.includes('delete');
        });
        
        let existing = chips.map(c => {
            let p = c.parentElement;
            return p ? p.innerText : 'Unknown';
        }).join(', ');
        
        return 'Inputs:\\n' + inputDump + '\\n\\nExisting zones:\\n' + existing;
    })();"
end tell
`;
console.log(runAppleScript(dumpZonaJs));
