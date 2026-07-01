const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let missingCustom = [
    "Animatori petreceri copii", "Animatori copii București", "Animatori copii Ilfov",
    "Organizare petreceri copii", "Mascote pentru petreceri copii", "Personaje pentru petreceri copii",
    "Pictură pe față copii", "Modelaj baloane copii", "Jocuri interactive pentru copii",
    "Animatori botez", "Animatori moț și turtă", "Ursitoare botez",
    "Animatori școală și serbări", "Animatori copii la restaurant", "Deschideri grădinițe",
    "Deschideri școli", "Animatori copii evenimente corporate", "Family Day copii",
    "Moș Crăciun la evenimente", "Iepuraș de Paște la evenimente", "Decorațiuni baloane copii",
    "Arcade din baloane", "Ghirlande din baloane", "Panouri foto pentru evenimente",
    "Baloane cu heliu", "Stand vată de zahăr", "Standuri dulciuri pentru evenimente",
    "Pachete animatori și baloane", "Mascote pentru școli"
];

let added = 0;
let failed = [];

for (let srv of missingCustom) {
    console.log("\\nAdaug: " + srv);
    
    // Check state and return to main list if stuck
    let checkStateJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            if (!target) return 'NO_IFRAME';
            let doc = target.contentWindow.document;
            return doc.body.innerText.includes('Modifică detaliile despre serviciu') ? 'IN_DETAILS' : 'IN_MAIN_LIST';
        })();"
    end tell
    `;
    let state = runAppleScript(checkStateJs);
    if (state === 'IN_DETAILS') {
        runAppleScript(`
        tell application "Google Chrome"
            execute active tab of first window javascript "
            (function() {
                let iframes = Array.from(document.querySelectorAll('iframe'));
                let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
                let doc = target.contentWindow.document;
                let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
                let cancel = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'anulează');
                if (cancel) cancel.click();
            })();"
        end tell
        `);
        execSync('sleep 2');
    }
    
    // Click Adaugă un serviciu personalizat
    let addCustomJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            if (!target) return 'NO_IFRAME';
            let doc = target.contentWindow.document;
            
            let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
            let customBtn = btns.find(b => (b.innerText || '').toLowerCase().includes('adaugă un serviciu personalizat'));
            
            if (!customBtn) {
                let addMore = btns.find(b => (b.innerText || '').toLowerCase().includes('adăugați mai multe servicii'));
                if (addMore) addMore.click();
            }
        })();"
    end tell
    `;
    runAppleScript(addCustomJs);
    execSync('sleep 2');
    
    let clickCustomJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            let doc = target.contentWindow.document;
            
            let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
            let customBtn = btns.find(b => (b.innerText || '').toLowerCase().includes('adaugă un serviciu personalizat'));
            if (customBtn) customBtn.click();
        })();"
    end tell
    `;
    runAppleScript(clickCustomJs);
    execSync('sleep 2');
    
    // Focus, paste, save
    execSync(`echo "${srv}" | pbcopy`);
    let pasteJs = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            let doc = target.contentWindow.document;
            let input = doc.querySelector('input[type=text]');
            if (input) {
                input.focus();
                input.value = '';
                input.dispatchEvent(new Event('input', {bubbles: true}));
                return 'FOCUSED';
            }
            return 'NO_INPUT';
        })();"
    end tell
    `;
    
    let focusRes = runAppleScript(pasteJs);
    if (focusRes === 'FOCUSED') {
        runAppleScript(`
        tell application "Google Chrome" to activate
        tell application "System Events"
            keystroke "v" using command down
            delay 0.5
        end tell
        `);
        
        let verifyJs = `
        tell application "Google Chrome"
            execute active tab of first window javascript "
            (function() {
                let iframes = Array.from(document.querySelectorAll('iframe'));
                let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
                let doc = target.contentWindow.document;
                let input = doc.querySelector('input[type=text]');
                return input ? input.value : 'NO_INPUT';
            })();"
        end tell
        `;
        let val = runAppleScript(verifyJs);
        if (val.trim() === srv) {
            let saveDetailsJs = `
            tell application "Google Chrome"
                execute active tab of first window javascript "
                (function() {
                    let iframes = Array.from(document.querySelectorAll('iframe'));
                    let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
                    let doc = target.contentWindow.document;
                    let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
                    let saveBtn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'salvează' || (b.innerText || '').toLowerCase().trim() === 'save');
                    if (saveBtn) {
                        saveBtn.click();
                        return 'SAVED_DETAILS';
                    }
                    return 'NO_SAVE_BTN';
                })();"
            end tell
            `;
            let saveRes = runAppleScript(saveDetailsJs);
            console.log("-> Salvat: " + saveRes);
            added++;
            execSync('sleep 3');
        } else {
            console.log("-> Eroare validare text: " + val);
            failed.push(srv);
        }
    } else {
        console.log("-> Eroare focus.");
        failed.push(srv);
    }
}

console.log("\\n=== COMPLETED ===");
console.log("Adaugate: " + added);
console.log("Failed: " + failed.join(', '));
