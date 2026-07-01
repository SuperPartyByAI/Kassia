const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Asigură-te că suntem pe SERP
runAppleScript(`
tell application "Google Chrome" to activate
tell application "Google Chrome"
    set URL of active tab of first window to "https://www.google.com/search?q=Kassia+Events"
end tell
`);
execSync('sleep 5');

// 2. Apasă "Vezi profilul" (dacă e nevoie)
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

// 3. Apasă "Fotografii" din NMX (modulul principal)
runAppleScript(`
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').toLowerCase().trim() === 'fotografii');
        if (target) target.click();
    })();"
end tell
`);
execSync('sleep 5');

// 4. Dump continut iframe "mediatool"
let dumpIframeBodyJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('mediatool'));
        if (!targetFrame) return 'NO_MEDIATOOL_IFRAME';
        
        try {
            let doc = targetFrame.contentWindow.document;
            
            // Dump text
            let text = doc.body.innerText.substring(0, 2000);
            
            // Dump număr de imagini
            let imgs = Array.from(doc.querySelectorAll('div[role=img], img'));
            
            // Check for pending text
            let pendingNodes = Array.from(doc.querySelectorAll('*')).filter(el => {
                let t = (el.innerText || '').toLowerCase();
                return t.includes('pending') || t.includes('așteptare') || t.includes('examinare') || t.includes('uploaded') || t.includes('încărcat');
            });
            
            return JSON.stringify({
                text: text,
                img_count: imgs.length,
                has_pending: pendingNodes.length > 0
            });
            
        } catch(e) {
            return 'CORS_ERROR: ' + e.message;
        }
    })();"
end tell
`;
console.log(runAppleScript(dumpIframeBodyJs));

// 5. Take screenshot
execSync('screencapture -x /Users/universparty/Desktop/gbp_photos_proof.png');
console.log("Screenshot taken at /Users/universparty/Desktop/gbp_photos_proof.png");
