const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR: " + e.message;
    }
}

let dumpRezHrefJs = `
tell application "Google Chrome"
    set out to ""
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" then
                set rez to execute t javascript "
                (function() {
                    let els = Array.from(document.querySelectorAll('a, button, div[role=button], span'));
                    let target = els.find(b => (b.innerText || '').trim() === 'Rezervări' && b.children.length === 0);
                    if (target) {
                        let parentA = target.closest('a');
                        if (parentA) return parentA.href;
                        return 'FOUND_BUT_NO_HREF';
                    }
                    return 'NOT_FOUND';
                })();"
                set out to out & u & " => " & rez & "\\n"
            end if
        end repeat
    end repeat
    return out
end tell
`;
console.log(runAppleScript(dumpRezHrefJs));
