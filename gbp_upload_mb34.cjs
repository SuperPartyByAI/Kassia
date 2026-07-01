const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Upload MB3
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
execSync('sleep 4');
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
        if (target) target.focus();
    })();"
end tell
`);
execSync('sleep 1');
runAppleScript(`
tell application "System Events"
    key code 49
    delay 2
    keystroke "g" using {command down, shift down}
    delay 1
    keystroke "/Users/universparty/Desktop/KASSIA_GBP_UPLOAD_51_60"
    delay 1
    key code 36
    delay 2
    keystroke "a" using {command down}
    delay 1
    key code 36
end tell
`);

execSync('sleep 15');

// Upload MB4
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
execSync('sleep 4');
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
        if (target) target.focus();
    })();"
end tell
`);
execSync('sleep 1');
runAppleScript(`
tell application "System Events"
    key code 49
    delay 2
    keystroke "g" using {command down, shift down}
    delay 1
    keystroke "/Users/universparty/Desktop/KASSIA_GBP_UPLOAD_61_73"
    delay 1
    key code 36
    delay 2
    keystroke "a" using {command down}
    delay 1
    key code 36
end tell
`);

console.log("Upload MB3 and MB4 initiated.");
