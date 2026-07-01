const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Deschide NMX and click Adaugă fotografii
runAppleScript(`
tell application "Google Chrome" to activate
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').trim() === 'Adaugă fotografii');
        if (target) target.click();
    })();"
end tell
`);
execSync('sleep 5');

// 2. Focus pe butonul "Selectează imagini"
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('photos/add'));
        if (!targetFrame) return;
        
        let doc = targetFrame.contentWindow.document;
        let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().includes('select'));
        if (target) {
            target.focus();
        }
    })();"
end tell
`);
execSync('sleep 1');

runAppleScript(`
tell application "System Events"
    key code 49 -- Space
    delay 2
    
    -- Deschidem dialogul 'Go to folder' (Cmd+Shift+G)
    keystroke "g" using {command down, shift down}
    delay 1
    
    -- Introducem calea către folderul 31-40
    keystroke "/Users/universparty/Desktop/KASSIA_GBP_UPLOAD_31_40"
    delay 1
    
    -- Apăsăm Enter pentru a accesa folderul
    key code 36
    delay 2
    
    -- Selectăm toate fișierele (Cmd+A)
    keystroke "a" using {command down}
    delay 1
    
    -- Apăsăm Enter pentru a confirma și a uploada
    key code 36
end tell
`);

console.log("Upload mini-batch 1 (31-40) initiated.");
