const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let scrollJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('mediatool'));
        if (!targetFrame) return;
        let doc = targetFrame.contentWindow.document;
        let scrollable = Array.from(doc.querySelectorAll('*')).find(el => el.scrollHeight > el.clientHeight && getComputedStyle(el).overflowY !== 'hidden' && el.tagName !== 'BODY' && el.tagName !== 'HTML');
        if (!scrollable) scrollable = doc.scrollingElement || doc.body;
        scrollable.scrollBy(0, 2000);
    })();"
end tell
`;

for (let i = 0; i < 5; i++) {
    runAppleScript(scrollJs);
    execSync('sleep 1');
}

let collectJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('mediatool'));
        if (!targetFrame) return JSON.stringify({ error: 'NO_MEDIATOOL_IFRAME' });
        
        let doc = targetFrame.contentWindow.document;
        
        let uniqueThumbnails = new Set();
        let pendingCards = 0;
        let failedCards = 0;
        let duplicateWarnings = false;
        
        let imgs = Array.from(doc.querySelectorAll('div[role=img], img'));
        imgs.forEach(img => {
            let identifier = img.src || img.style.backgroundImage || img.getAttribute('aria-label');
            if (identifier && identifier.length > 5) {
                uniqueThumbnails.add(identifier);
            }
        });
        
        let txts = Array.from(doc.querySelectorAll('*'));
        txts.forEach(el => {
            if(el.children.length > 0) return;
            let t = (el.innerText || '').toLowerCase();
            if (t === 'în așteptare' || t === 'pending' || t === 'în examinare') pendingCards++;
            if (t.includes('eșuat') || t.includes('eroare') || t.includes('failed')) failedCards++;
            if (t.includes('duplicate') || t.includes('duplicat')) duplicateWarnings = true;
        });
        
        return JSON.stringify({
            unique_thumbnails_count: uniqueThumbnails.size,
            pending_count: pendingCards,
            failed_count: failedCards,
            duplicate_warnings: duplicateWarnings
        });
    })();"
end tell
`;
console.log(runAppleScript(collectJs));
execSync('screencapture -x /Users/universparty/Desktop/gbp_photos_proof_full.png');
