const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Inject a global variable to collect
let setupJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        window.my_unique_thumbnails = new Set();
        window.my_pending_cards = 0;
        
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('mediatool'));
        if (!targetFrame) return 'NO_MEDIATOOL';
        
        targetFrame.contentWindow.my_unique_thumbnails = new Set();
        targetFrame.contentWindow.my_pending_cards = 0;
    })();"
end tell
`;
console.log(runAppleScript(setupJs));

// 2. Scroll and collect step
let stepJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('mediatool'));
        if (!targetFrame) return;
        let doc = targetFrame.contentWindow.document;
        let win = targetFrame.contentWindow;
        
        // Collect
        let imgs = Array.from(doc.querySelectorAll('div[role=img], img'));
        imgs.forEach(img => {
            let identifier = img.src || img.style.backgroundImage || img.getAttribute('aria-label');
            if (identifier && identifier.length > 5) {
                win.my_unique_thumbnails.add(identifier);
            }
        });
        
        let txts = Array.from(doc.querySelectorAll('*'));
        txts.forEach(el => {
            if(el.children.length > 0) return;
            let t = (el.innerText || '').toLowerCase();
            if (t === 'în așteptare' || t === 'pending' || t === 'în examinare') win.my_pending_cards++;
        });
        
        // Scroll
        let scrollable = Array.from(doc.querySelectorAll('*')).find(el => el.scrollHeight > el.clientHeight && getComputedStyle(el).overflowY !== 'hidden' && el.tagName !== 'BODY' && el.tagName !== 'HTML');
        if (!scrollable) scrollable = doc.scrollingElement || doc.body;
        scrollable.scrollBy(0, 1000);
        return win.my_unique_thumbnails.size;
    })();"
end tell
`;

for (let i = 0; i < 8; i++) {
    console.log("Step " + i + ": " + runAppleScript(stepJs));
    execSync('sleep 1');
}

let finalizeJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let targetFrame = iframes.find(i => (i.src || '').includes('mediatool'));
        if (!targetFrame) return JSON.stringify({ error: 'NO_MEDIATOOL_IFRAME' });
        
        let doc = targetFrame.contentWindow.document;
        let win = targetFrame.contentWindow;
        
        let duplicateWarnings = false;
        let txts = Array.from(doc.querySelectorAll('*'));
        txts.forEach(el => {
            if(el.children.length > 0) return;
            let t = (el.innerText || '').toLowerCase();
            if (t.includes('duplicate') || t.includes('duplicat')) duplicateWarnings = true;
        });
        
        return JSON.stringify({
            unique_thumbnails_count: win.my_unique_thumbnails.size,
            pending_count: Math.round(win.my_pending_cards / 8),
            duplicate_warnings: duplicateWarnings
        });
    })();"
end tell
`;
console.log("FINAL: " + runAppleScript(finalizeJs));
execSync('screencapture -x /Users/universparty/Desktop/gbp_photos_proof_full.png');
