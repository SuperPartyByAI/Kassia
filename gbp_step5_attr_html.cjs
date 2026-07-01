const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpHtmlJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile') && !(i.src || '').includes('services'));
        let doc = target.contentWindow.document;
        
        let sections = ['Opțiuni pentru serviciu', 'Planificare'];
        let out = '';
        
        for (let s of sections) {
            let els = Array.from(doc.querySelectorAll('div, span'));
            let txt = els.find(e => (e.innerText || '').trim() === s && e.children.length === 0);
            if (txt) {
                let parent = txt.parentElement.parentElement;
                out += s + ' HTML: ' + parent.outerHTML + '\\n\\n';
            }
        }
        return out;
    })();"
end tell
`;
console.log(runAppleScript(dumpHtmlJs));
