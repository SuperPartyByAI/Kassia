const fs = require('fs');
const { execSync } = require('child_process');

let dumper = `
tell application "Google Chrome"
    set nmxTab to missing value
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" and (u contains "Kassia" or title of t contains "Kassia") then
                set nmxTab to t
                exit repeat
            end if
        end repeat
        if nmxTab is not missing value then exit repeat
    end repeat
    
    if nmxTab is missing value then return "NOT_FOUND"

    set t to execute nmxTab javascript "document.body.innerText"
    return t
end tell
`;

fs.writeFileSync('/tmp/dump_current.scpt', dumper);
let out = execSync('osascript /tmp/dump_current.scpt').toString().trim();
fs.writeFileSync('/tmp/current_dump.txt', out);
