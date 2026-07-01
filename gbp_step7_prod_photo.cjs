const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Click photo button
let clickPhotoJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        let doc = target.contentWindow.document;
        
        let btns = Array.from(doc.querySelectorAll('button, div[role=button]'));
        let btn = btns.find(b => (b.innerText || '').toLowerCase().includes('selectați o fotografie') || (b.innerText || '').toLowerCase().includes('select a photo'));
        if (btn) {
            btn.click();
            return 'CLICKED_PHOTO_BTN';
        }
        return 'NO_PHOTO_BTN';
    })();"
end tell
`;
console.log(runAppleScript(clickPhotoJs));
execSync('sleep 2');

// Upload via System Events
runAppleScript(`
tell application "Google Chrome" to activate
tell application "System Events"
    keystroke "g" using {shift down, command down}
    delay 1
    keystroke "/Users/universparty/wa-web-launcher/kassia-site/kassia-maps-poze/party2_mickey_1772698274288.png"
    delay 1
    key code 36 -- Enter
    delay 1
    key code 36 -- Enter
    delay 3
end tell
`);

let dumpTextJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        let doc = target.contentWindow.document;
        return doc.body.innerText;
    })();"
end tell
`;
console.log("PAGE TEXT:\\n" + runAppleScript(dumpTextJs));
