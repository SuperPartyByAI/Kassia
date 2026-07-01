const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Fill texts
let fillJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        let inputs = Array.from(doc.querySelectorAll('input[type=text], input[type=url], textarea'));
        if (inputs.length < 3) return 'NOT_ENOUGH_INPUTS';
        
        // Find by aria-label or placeholder
        let nameInput = inputs.find(i => (i.getAttribute('aria-label') || '').includes('Nume') || (i.placeholder || '').includes('Nume'));
        let descInput = inputs.find(i => (i.tagName === 'TEXTAREA') || (i.getAttribute('aria-label') || '').includes('Descriere'));
        let urlInput = inputs.find(i => (i.getAttribute('aria-label') || '').includes('URL') || (i.placeholder || '').includes('URL') || i.type === 'url');
        
        if (nameInput) {
            nameInput.focus();
            nameInput.value = 'Programe animatori copii';
            nameInput.dispatchEvent(new Event('input', {bubbles: true}));
        }
        
        if (descInput) {
            descInput.focus();
            descInput.value = 'Programe interactive cu animatori profesioniști pentru petreceri de neuitat. Energie, jocuri, concursuri și zâmbete garantate pentru toți invitații!';
            descInput.dispatchEvent(new Event('input', {bubbles: true}));
        }
        
        if (urlInput) {
            urlInput.focus();
            urlInput.value = 'https://www.kassia.ro/';
            urlInput.dispatchEvent(new Event('input', {bubbles: true}));
        }
        
        return 'FILLED_TEXTS';
    })();"
end tell
`;
console.log(runAppleScript(fillJs));
execSync('sleep 1');

// 2. Select Category (Create new)
let catJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        let doc = target.contentWindow.document;
        
        // Click category dropdown
        let dropdown = doc.querySelector('div[role=listbox]') || Array.from(doc.querySelectorAll('div[role=button]')).find(b => (b.innerText || '').includes('Selectează o categorie'));
        if (dropdown) dropdown.click();
        
        return 'CLICKED_DROPDOWN';
    })();"
end tell
`;
console.log(runAppleScript(catJs));
execSync('sleep 1');

let createCatJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        let doc = target.contentWindow.document;
        
        let opts = Array.from(doc.querySelectorAll('div[role=option], li[role=option]'));
        let createOpt = opts.find(o => (o.innerText || '').toLowerCase().includes('creează o categorie') || (o.innerText || '').toLowerCase().includes('create'));
        if (createOpt) {
            createOpt.click();
            return 'CLICKED_CREATE_CAT';
        }
        return 'NO_CREATE_CAT';
    })();"
end tell
`;
console.log(runAppleScript(createCatJs));
execSync('sleep 1');

let fillCatJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        let doc = target.contentWindow.document;
        
        let inputs = Array.from(doc.querySelectorAll('input[type=text]'));
        let catInput = inputs.find(i => (i.getAttribute('aria-label') || '').includes('Categorie') || (i.placeholder || '').includes('Categorie'));
        if (catInput && catInput.value === '') {
            catInput.focus();
            catInput.value = 'Petreceri Copii';
            catInput.dispatchEvent(new Event('input', {bubbles: true}));
            return 'FILLED_NEW_CAT';
        }
        return 'NO_CAT_INPUT';
    })();"
end tell
`;
console.log(runAppleScript(fillCatJs));
