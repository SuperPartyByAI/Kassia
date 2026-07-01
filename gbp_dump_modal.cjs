const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "ERROR";
    }
}

let modalText = runAppleScript(`tell application "Google Chrome" to execute active tab of first window javascript "document.body.innerText"`);
require('fs').writeFileSync('/tmp/gbp_services_modal_dump.txt', modalText);
console.log("Dumped modal text.");
