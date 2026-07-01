const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR";
    }
}

let script = `
tell application "Google Chrome"
    activate
    
    -- 1. Find the NMX tab
    set nmxTab to missing value
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" then
                set pageText to execute t javascript "document.body.innerText"
                if pageText contains "Compania ta pe Google" or pageText contains "Gestionezi acest profil" then
                    set active tab index of w to tabIndex
                    set index of w to 1
                    set nmxTab to t
                    exit repeat
                end if
            else if u starts with "https://local.google.com" then
                set active tab index of w to tabIndex
                set index of w to 1
                set nmxTab to t
                exit repeat
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if nmxTab is not missing value then exit repeat
    end repeat

    if nmxTab is missing value then
        return "ERROR: Nu am gasit tabul NMX."
    end if

    -- 2. Execute JS inside the iframe
    set js to "(function() {
        let iframes = Array.from(document.querySelectorAll('iframe'));
        let target = iframes.find(i => (i.src || '').includes('editprofile/services'));
        if (!target) return 'NO_IFRAME';
        
        let doc = target.contentWindow.document;
        
        // Return innerText so we can parse it in Node
        return doc.body.innerText;
    })();"
    
    set res to execute active tab of first window javascript js
    return res
end tell
`;

let res = runAppleScript(script);
console.log("Iframe Initial Content:\\n" + res);
