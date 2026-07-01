const fs = require('fs');
const { execSync } = require('child_process');

let dumper = `
tell application "Google Chrome"
    set activeWin to first window
    set activeTab to active tab of activeWin
    set u to URL of activeTab
    if u contains "editprofile/services" then
        set t to execute activeTab javascript "document.body.innerText"
        return t
    else
        return "NOT_ON_SERVICES_PAGE_URL_IS_" & u
    end if
end tell
`;

fs.writeFileSync('/tmp/dump_services.scpt', dumper);
let out = execSync('osascript /tmp/dump_services.scpt').toString().trim();
fs.writeFileSync('/tmp/services_dump.txt', out);
