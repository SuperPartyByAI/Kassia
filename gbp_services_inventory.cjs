const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let inventoryJs = `
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

    if nmxTab is missing value then return "NO_TAB"

    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        
        // Return to main list if stuck in details
        if (doc.body.innerText.includes('Modifică detaliile despre serviciu')) {
            let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
            let cancel = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'anulează');
            if (cancel) cancel.click();
            return 'WAS_IN_DETAILS_CANCELED';
        }
        
        // Scroll to bottom of the main list just in case
        let scrollable = doc.querySelector('div[role=dialog]') || doc.body;
        if (scrollable) {
            scrollable.scrollTop = scrollable.scrollHeight;
        }
        
        return doc.body.innerText;
    })();"
end tell
`;

let text = runAppleScript(inventoryJs);
if (text === 'WAS_IN_DETAILS_CANCELED') {
    execSync('sleep 2');
    text = runAppleScript(inventoryJs);
}

console.log("=== RAW IFRAME TEXT ===");
console.log(text);
console.log("=======================");

// Analyze text
let basicServices = [
    "Evenimente corporatiste",
    "Evenimente la școală",
    "Design decorațiuni pentru evenimente"
];

let customServices = [
    "Animatori petreceri copii", "Animatori copii București", "Animatori copii Ilfov",
    "Organizare petreceri copii", "Petreceri tematice copii", "Mascote pentru petreceri copii",
    "Personaje pentru petreceri copii", "Pictură pe față copii", "Modelaj baloane copii",
    "Mini-disco copii", "Jocuri interactive pentru copii", "Animatori botez",
    "Animatori moț și turtă", "Ursitoare botez", "Animatori grădiniță",
    "Animatori școală și serbări", "Animatori copii la restaurant", "Deschideri grădinițe",
    "Deschideri școli", "Deschideri restaurante", "Animatori copii evenimente corporate",
    "Family Day copii", "Moș Crăciun la evenimente", "Iepuraș de Paște la evenimente",
    "Decoruri baloane pentru evenimente", "Decorațiuni baloane copii", "Arcade din baloane",
    "Ghirlande din baloane", "Panouri foto pentru evenimente", "Photo corner evenimente",
    "Baloane cu heliu", "Stand vată de zahăr", "Stand popcorn", "Standuri dulciuri pentru evenimente",
    "Pachete animatori și baloane", "Mascote pentru grădinițe", "Mascote pentru școli",
    "Mascote pentru evenimente corporate"
];

let foundBasic = [];
let foundCustom = [];
let missingCustom = [];
let corruptedServiceFound = false;

let lowerText = text.toLowerCase();

// Check for corrupted strings like "Animatori copii BucureștiAnimatori copii Ilfov"
// A simple way is to check if it contains the substring "BucureștiAnimatori" or "copiiAnimatori"
if (text.includes("BucureștiAnimatori") || text.includes("copiiAnimatori") || text.includes("copiiPetreceri") || text.includes("copiiMascote")) {
    corruptedServiceFound = true;
}

for (let srv of basicServices) {
    if (lowerText.includes(srv.toLowerCase())) {
        foundBasic.push(srv);
    }
}

for (let srv of customServices) {
    // Exact search in the text block
    let found = lowerText.includes(srv.toLowerCase());
    
    // Also, if the corrupted string contains it, we should NOT count it as a separate valid service!
    // We can do a regex check or just check if it's there.
    // If it's corrupted, we will delete the corrupted one anyway.
    
    if (found) {
        foundCustom.push(srv);
    } else {
        missingCustom.push(srv);
    }
}

console.log("Basic found: " + foundBasic.join(', '));
console.log("Custom found: " + foundCustom.length + " (" + foundCustom.join(', ') + ")");
console.log("Custom missing: " + missingCustom.length + " (" + missingCustom.join(', ') + ")");
console.log("Corrupted string found: " + corruptedServiceFound);

// If corrupted string found, write a deletion script
if (corruptedServiceFound) {
    console.log("Attempting to find and delete the corrupted service...");
    let deleteCorruptedJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            if (!target) return 'NO_IFRAME';
            let doc = target.contentWindow.document;
            
            // Find the element containing the corrupted text
            let els = Array.from(doc.querySelectorAll('div[role=button], span, a'));
            let corrupted = els.find(e => {
                let t = e.innerText || '';
                return t.includes('BucureștiAnimatori') || t.includes('copiiAnimatori') || t.includes('copiiPetreceri');
            });
            
            if (corrupted) {
                corrupted.click();
                return 'CLICKED_CORRUPTED';
            }
            return 'CORRUPTED_NOT_FOUND';
        })();"
    end tell
    `;
    let resClick = runAppleScript(deleteCorruptedJs);
    console.log("Click corrupted: " + resClick);
    
    if (resClick === 'CLICKED_CORRUPTED') {
        execSync('sleep 2');
        let deleteBtnJs = `
        tell application "Google Chrome"
            execute active tab of first window javascript "
            (function() {
                let iframes = Array.from(document.querySelectorAll('iframe'));
                let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
                let doc = target.contentWindow.document;
                let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
                let delBtn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'șterge serviciul');
                if (delBtn) {
                    delBtn.click();
                    return 'DELETED';
                }
                return 'NO_DELETE_BTN';
            })();"
        end tell
        `;
        console.log("Delete button click: " + runAppleScript(deleteBtnJs));
        execSync('sleep 2');
        
        let confirmBtnJs = `
        tell application "Google Chrome"
            execute active tab of first window javascript "
            (function() {
                let btns = Array.from(document.querySelectorAll('button, div[role=button]'));
                let conf = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'șterge');
                if (conf) conf.click();
                
                let iframes = Array.from(document.querySelectorAll('iframe'));
                let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
                if (target) {
                    let doc = target.contentWindow.document;
                    let btnsI = Array.from(doc.querySelectorAll('button, div[role=button]'));
                    let confI = btnsI.find(b => (b.innerText || '').toLowerCase().trim() === 'șterge');
                    if (confI) confI.click();
                }
            })();"
        end tell
        `;
        runAppleScript(confirmBtnJs);
        console.log("Confirmed deletion.");
    }
}
