const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpValueJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let inputs = Array.from(doc.querySelectorAll('input[type=text], input[type=url]'));
        if (inputs.length > 0) {
            return 'INPUT VALUE: ' + inputs[0].value;
        }
        return 'NO_INPUT';
    })();"
end tell
`;
console.log(runAppleScript(dumpValueJs));
