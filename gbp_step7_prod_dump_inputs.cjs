const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/products'));
        let doc = target.contentWindow.document;
        
        let inputs = Array.from(doc.querySelectorAll('input, textarea'));
        let inputDump = inputs.map(i => i.tagName + ' | type=' + i.type + ' | aria-label=' + i.getAttribute('aria-label') + ' | placeholder=' + i.placeholder).join('\\n');
        
        let btns = Array.from(doc.querySelectorAll('div[role=button], div[role=combobox]'));
        let btnDump = btns.map(b => b.tagName + ' | role=' + b.getAttribute('role') + ' | text=' + b.innerText.replace(/\\n/g, ' ')).join('\\n');
        
        return 'INPUTS:\\n' + inputDump + '\\n\\nBUTTONS/COMBO:\\n' + btnDump;
    })();"
end tell
`;
console.log(runAppleScript(dumpJs));
