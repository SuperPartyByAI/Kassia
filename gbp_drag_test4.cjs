const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Click "Adaugă fotografii"
let clickAddPhotos = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = btns.find(b => (b.innerText || '').trim() === 'Adaugă fotografii');
        if (target) {
            target.click();
            return 'CLICKED_ADAUGA_FOTOGRAFII';
        }
        return 'NOT_FOUND_ADAUGA_FOTO';
    })();"
end tell
`;
console.log(runAppleScript(clickAddPhotos));
execSync('sleep 4');

// 2. Measure coordinates of dropzone or iframe
let getCoordsJs = `
tell application "Google Chrome"
    execute active tab of first window javascript "
    (function() {
        // Try to find the iframe that was just opened (usually it's a modal)
        let iframes = Array.from(document.querySelectorAll('iframe'));
        // The upload iframe usually has 'upload' or something, or it's the largest visible iframe
        let visibleIframes = iframes.filter(i => i.offsetWidth > 100 && i.offsetHeight > 100);
        if (visibleIframes.length === 0) return 'NO_VISIBLE_IFRAME';
        
        let i = visibleIframes[visibleIframes.length - 1]; // usually the last one is the modal
        let rect = i.getBoundingClientRect();
        
        // Return window.screenX + rect.left, window.screenY + rect.top, etc.
        // We can just return the relative to browser viewport, then we'll adjust with AppleScript bounds
        return JSON.stringify({
            x: rect.left + (rect.width/2),
            y: rect.top + (rect.height/2),
            w: rect.width,
            h: rect.height,
            src: i.src
        });
    })();"
end tell
`;
console.log(runAppleScript(getCoordsJs));

let getBrowserBoundsJs = `
tell application "Google Chrome"
    get bounds of first window
end tell
`;
console.log(runAppleScript(getBrowserBoundsJs));
