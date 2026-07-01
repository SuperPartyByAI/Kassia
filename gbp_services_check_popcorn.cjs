const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Reopen panel
console.log("Re-opening panel...");
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let edit = btns.find(b => {
            let t = (b.innerText || '').toLowerCase().trim();
            return t === 'modifică serviciile' || t === 'edit services' || t === 'editează serviciile';
        });
        if (edit) edit.click();
    })();"
end tell
`);
execSync('sleep 5');

// 2. Read iframe text
let checkJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_IFRAME';
        let doc = target.contentWindow.document;
        return doc.body.innerText;
    })();"
end tell
`;

let res = runAppleScript(checkJs);
if (res.toLowerCase().includes("stand popcorn")) {
    console.log("SUCCESS: 'Stand popcorn' FOUND after reopen!");
} else {
    console.log("FAIL: 'Stand popcorn' NOT FOUND after reopen.");
    console.log(res);
}
