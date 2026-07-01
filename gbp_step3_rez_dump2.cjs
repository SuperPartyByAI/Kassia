const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpRezJs = `
tell application "Google Chrome"
    set out to ""
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" then
                set rez to execute t javascript "
                (function() {
                    let els = Array.from(document.querySelectorAll('a, button, div[role=button], span, div'));
                    // Find an element containing exactly Rezervări, but we want the deepest one
                    let target = els.find(b => (b.innerText || '').trim() === 'Rezervări');
                    if (target) {
                        return target.tagName + ' | ' + target.outerHTML;
                    }
                    return 'NOT_FOUND';
                })();"
                if rez is not equal to "NOT_FOUND" then
                    set out to out & u & " => " & rez & "\\n"
                end if
            end if
        end repeat
    end repeat
    return out
end tell
`;
console.log(runAppleScript(dumpRezJs));
