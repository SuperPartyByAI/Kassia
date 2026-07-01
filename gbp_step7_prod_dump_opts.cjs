const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpOptsJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        let doc = target.contentWindow.document;
        
        let opts = Array.from(doc.querySelectorAll('div[role=option], li[role=option], span'));
        return opts.map(o => o.innerText).filter(t => t && t.trim().length > 0).join('\\n');
    })();"
end tell
`;
console.log(runAppleScript(dumpOptsJs));
