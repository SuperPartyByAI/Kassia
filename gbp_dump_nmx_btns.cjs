const fs = require('fs');
const { execSync } = require('child_process');

let js_extract = `
tell application "Google Chrome"
    set activeWin to first window
    set activeTab to active tab of activeWin
    execute activeTab javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip]'));
        let btnData = btns.map(b => {
            let t = (b.innerText || '').trim().replace(/\\\\n/g, ' ');
            let al = b.getAttribute('aria-label') || '';
            let dt = b.getAttribute('data-tooltip') || '';
            if (t || al || dt) {
                return 'TEXT: ' + t + ' | ARIA: ' + al + ' | TOOLTIP: ' + dt;
            }
            return null;
        }).filter(x => x);
        return btnData.join('\\\\n');
    })();
    "
end tell
`;

fs.writeFileSync('/tmp/dump_nmx_btns.scpt', js_extract);
let output = execSync('osascript /tmp/dump_nmx_btns.scpt').toString().trim();
fs.writeFileSync('/tmp/nmx_btns.txt', output);
