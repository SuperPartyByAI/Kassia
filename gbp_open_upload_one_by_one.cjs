const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Deschidem fereastra cu NMX (SERP)
runAppleScript(`
tell application "Google Chrome" to activate
tell application "Google Chrome"
    set URL of active tab of first window to "https://www.google.com/search?q=Kassia+Events"
end tell
`);
execSync('sleep 4');

// 2. Apasăm Vezi Profilul pentru a deschide NMX-ul complet
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'vezi profilul');
        if (target) target.click();
    })();"
end tell
`);
execSync('sleep 3');

// 3. Apasăm Adaugă fotografii
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').trim() === 'Adaugă fotografii');
        if (target) target.click();
    })();"
end tell
`);
execSync('sleep 4');

// 4. Focus pe butonul "Selectează imagini" și Space
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
    delay 1
end tell
`);

console.log("Gata, am deschis dropzone-ul si file picker-ul");
