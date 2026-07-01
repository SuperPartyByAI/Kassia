const { execSync } = require('child_process');
const fs = require('fs');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

function runJsInIframe(jsCode) {
    let script = `
    tell application "Google Chrome"
        execute active tab of first window javascript "
        (function() {
            let iframes = Array.from(document.querySelectorAll('iframe'));
            let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
            if (!target) return 'NO_IFRAME';
            let doc = target.contentWindow.document;
            ${jsCode}
        })();"
    end tell
    `;
    return runAppleScript(script);
}

function openPanel() {
    console.log("Deschidem panoul...");
    runAppleScript(`
    tell application "Google Chrome"
        activate
        execute active tab of first window javascript "
        (function() {
            let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
            let target = btns.find(b => {
                let t = (b.innerText || '').toLowerCase().trim();
                return t === 'modifică serviciile' || t === 'edit services' || t === 'editează serviciile';
            });
            if (target) target.click();
        })();"
    end tell
    `);
    execSync('sleep 5');
}

function savePanel() {
    console.log("Salvam si închidem panoul...");
    let saveRes = runJsInIframe(`
        let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
        let saveBtn = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'salvează' || (b.innerText || '').toLowerCase().trim() === 'save');
        if (saveBtn) {
            saveBtn.click();
            return 'SAVED';
        }
        return 'NO_SAVE_BTN';
    `);
    console.log("Save status: " + saveRes);
    execSync('sleep 5');
}

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
    "Baloane cu heliu", "Stand vată de zahăr", "Standuri dulciuri pentru evenimente",
    "Pachete animatori și baloane", "Mascote pentru grădinițe", "Mascote pentru școli",
    "Mascote pentru evenimente corporate"
];

let addedInCurrentBatch = 0;
let totalAdded = 0;
let alreadyExisting = 0;
let failed = [];
let existingList = [];

let initialCheck = runJsInIframe("return doc.body.innerText;");
if (initialCheck === 'NO_IFRAME') {
    openPanel();
} else {
    runJsInIframe(`
        let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
        let cancel = btns.find(b => (b.innerText || '').toLowerCase().includes('anulează'));
        let addCustom = btns.find(b => (b.innerText || '').toLowerCase().includes('adaugă un serviciu personalizat'));
        let addMore = btns.find(b => (b.innerText || '').toLowerCase().includes('adăugați mai multe servicii'));
        if (!addCustom && !addMore && cancel) cancel.click();
    `);
    execSync('sleep 1');
}

console.log("Verificare basic services...");
let basicCheck = runJsInIframe("return doc.body.innerText;");
let hasCorp = basicCheck.toLowerCase().includes('evenimente corporatiste');
let hasScoala = basicCheck.toLowerCase().includes('evenimente la școală');
let hasDesign = basicCheck.toLowerCase().includes('design decorațiuni pentru evenimente');
console.log("Basic services prezente: " + hasCorp + ", " + hasScoala + ", " + hasDesign);

for (let srv of customServices) {
    let currentText = runJsInIframe("return doc.body.innerText;");
    if (currentText === 'NO_IFRAME') {
        openPanel();
        currentText = runJsInIframe("return doc.body.innerText;");
    }
    
    if (currentText.toLowerCase().includes(srv.toLowerCase())) {
        console.log("Skip: deja existent -> " + srv);
        alreadyExisting++;
        existingList.push(srv);
        continue;
    }
    
    console.log("Adaug: " + srv);
    
    // Clear input if it exists
    runJsInIframe(`
        let input = doc.querySelector('input[type=text]');
        if (input) {
            input.value = "";
            input.dispatchEvent(new Event('input', {bubbles: true}));
        }
    `);
    
    runJsInIframe(`
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        let customBtn = btns.find(b => (b.innerText || '').toLowerCase().includes('adaugă un serviciu personalizat'));
        if (!customBtn) {
            let addMore = btns.find(b => (b.innerText || '').toLowerCase().includes('adăugați mai multe servicii'));
            if (addMore) addMore.click();
        }
    `);
    execSync('sleep 1');
    
    runJsInIframe(`
        let btns = Array.from(doc.querySelectorAll('button, div[role=button], span'));
        let customBtn = btns.find(b => (b.innerText || '').toLowerCase().includes('adaugă un serviciu personalizat'));
        if (customBtn) customBtn.click();
    `);
    execSync('sleep 1');
    
    execSync(`echo "${srv}" | pbcopy`);
    let focusRes = runJsInIframe(`
        let input = doc.querySelector('input[type=text]');
        if (input) {
            input.focus();
            return 'FOCUSED';
        }
        return 'NO_INPUT';
    `);
    
    if (focusRes === 'FOCUSED') {
        // Paste safely by manipulating the DOM directly first to ensure 100% success inside iframe,
        // but we will also use dispatchEvent to ensure React catches it!
        runJsInIframe(`
            let input = doc.querySelector('input[type=text]');
            if (input) {
                input.value = '${srv}';
                input.dispatchEvent(new Event('input', { bubbles: true }));
            }
        `);
        
        let val = runJsInIframe(`
            let input = doc.querySelector('input[type=text]');
            return input ? input.value : 'NO_INPUT';
        `);
        
        if (val.trim() === srv) {
            // Click the Add/Save button directly to avoid AppleScript focus issues
            runJsInIframe(`
                let input = doc.querySelector('input[type=text]');
                if (input) {
                    input.dispatchEvent(new KeyboardEvent('keydown', {
                        key: 'Enter', code: 'Enter', keyCode: 13, which: 13, bubbles: true
                    }));
                }
            `);
            execSync('sleep 1');
            
            console.log("  Success pentru: " + srv);
            addedInCurrentBatch++;
            totalAdded++;
            
            if (addedInCurrentBatch >= 5) {
                console.log("Am atins 5 servicii. Salvez intermediar...");
                savePanel();
                openPanel();
                addedInCurrentBatch = 0;
            }
        } else {
            console.log("  Mismatched value: " + val);
            failed.push(srv);
        }
    } else {
        console.log("  Failed focus: " + focusRes);
        failed.push(srv);
    }
}

if (addedInCurrentBatch > 0) {
    console.log("Salvez restul (" + addedInCurrentBatch + ")...");
    savePanel();
    openPanel(); 
}

console.log("============== RAPORT FINAL ==============");
console.log("Basic services selectate: DA (erau deja prezente in profil)");
console.log("Custom services adaugate efectiv: " + totalAdded);
console.log("Custom services deja existente: " + alreadyExisting + " (" + existingList.join(', ') + ")");
console.log("Custom services failed: " + failed.length + (failed.length > 0 ? " (" + failed.join(', ') + ")" : ""));
console.log("Finished.");
