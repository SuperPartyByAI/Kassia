const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

// 1. Find tab and dump Rezervari button
let dumpJs = `
tell application "Google Chrome"
    activate
    set nmxTab to missing value
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" then
                set pageText to execute t javascript "document.body.innerText"
                if pageText contains "Compania ta pe Google" then
                    set active tab index of w to tabIndex
                    set index of w to 1
                    set nmxTab to t
                    exit repeat
                end if
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if nmxTab is not missing value then exit repeat
    end repeat

    execute active tab of first window javascript "
    (function() {
        let els = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
        let target = els.find(b => (b.innerText || '').trim() === 'Rezervări' && b.children.length === 0);
        if (target) {
            let parent = target.closest('a') || target.closest('button') || target.closest('div[role=button]');
            if (parent) {
                return parent.outerHTML;
            }
            return target.outerHTML;
        }
        return 'NOT_FOUND';
    })();"
end tell
`;
console.log(runAppleScript(dumpJs));
