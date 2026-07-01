const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// Ensure SERP
runAppleScript(`
tell application "Google Chrome" to activate
tell application "Google Chrome"
    set URL of active tab of first window to "https://www.google.com/search?q=Kassia+Events"
end tell
`);
execSync('sleep 5');

// Click "Vezi profilul" if needed
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

// Click "Fotografii"
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

// Scroll and collect in mediatool
let scrollAndCollectJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (async function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('mediatool'));
        if (!targetFrame) return JSON.stringify({ error: 'NO_MEDIATOOL_IFRAME' });
        
        let doc = targetFrame.contentWindow.document;
        
        // Find scrollable container
        let scrollable = Array.from(doc.querySelectorAll('*')).find(el => el.scrollHeight > el.clientHeight && getComputedStyle(el).overflowY !== 'hidden' && el.tagName !== 'BODY' && el.tagName !== 'HTML');
        if (!scrollable) scrollable = doc.scrollingElement || doc.body;
        
        let uniqueThumbnails = new Set();
        let pendingCards = 0;
        let failedCards = 0;
        let duplicateWarnings = false;
        
        // Scroll loop
        for (let i = 0; i < 15; i++) {
            // Colecteaza imagini (bg sau src)
            let imgs = Array.from(doc.querySelectorAll('div[role=img], img'));
            imgs.forEach(img => {
                let identifier = img.src || img.style.backgroundImage || img.getAttribute('aria-label');
                if (identifier && identifier.length > 5) {
                    uniqueThumbnails.add(identifier);
                }
            });
            
            // Verifica pending/errors in view
            let txts = Array.from(doc.querySelectorAll('*'));
            txts.forEach(el => {
                if(el.children.length > 0) return; // look at leaf nodes
                let t = (el.innerText || '').toLowerCase();
                if (t === 'în așteptare' || t === 'pending' || t === 'în examinare') pendingCards++;
                if (t.includes('eșuat') || t.includes('eroare') || t.includes('failed')) failedCards++;
                if (t.includes('duplicate') || t.includes('duplicat')) duplicateWarnings = true;
            });
            
            scrollable.scrollBy(0, 1000);
            await new Promise(r => setTimeout(r, 600));
        }
        
        return JSON.stringify({
            unique_thumbnails_count: uniqueThumbnails.size,
            pending_count: Math.round(pendingCards / 15), // roughly since we count same text multiple times
            failed_count: Math.round(failedCards / 15),
            duplicate_warnings: duplicateWarnings
        });
    })();"
end tell
`;
console.log(runAppleScript(scrollAndCollectJs));

execSync('screencapture -x /Users/universparty/Desktop/gbp_photos_proof_full.png');
console.log("Screenshot taken at /Users/universparty/Desktop/gbp_photos_proof_full.png");
