const fs = require('fs');
const { execSync } = require('child_process');

let dumper = `
tell application "Google Chrome"
    set activeWin to first window
    set activeTab to active tab of activeWin
    set t to execute activeTab javascript "document.body.innerText"
    return t
end tell
`;

fs.writeFileSync('/tmp/dump_fresh.scpt', dumper);
let out = execSync('osascript /tmp/dump_fresh.scpt').toString().trim();
fs.writeFileSync('/tmp/fresh_dump.txt', out);
