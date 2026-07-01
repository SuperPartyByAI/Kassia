const fs = require('fs');
const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "";
    }
}

// Ensure Chrome is frontmost
runAppleScript(`
tell application "Google Chrome"
    activate
end tell
`);
execSync('sleep 1');

// Get active tab and coordinates
let getCoordsScript = `
tell application "Google Chrome"
    set nmxTab to missing value
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" and (u contains "Kassia" or title of t contains "Kassia") then
                if u contains "#mpd" then
                    execute t javascript "window.location.hash = ''; window.location.reload();"
                    delay 4
                    repeat with i from 1 to 10
                        set isReady to execute t javascript "document.body.innerText.includes('Kassia')"
                        if isReady is true then exit repeat
                        delay 1
                    end repeat
                end if
                set active tab index of w to tabIndex
                set index of w to 1
                set nmxTab to t
                exit repeat
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if nmxTab is not missing value then exit repeat
    end repeat
    
    if nmxTab is missing value then return "NOT_FOUND"

    execute nmxTab javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip]'));
        let editBtn = btns.find(b => {
            let txt = (b.innerText || '').toLowerCase().trim();
            return txt === 'modifică serviciile' || txt === 'edit services' || txt === 'editează serviciile';
        });
        if (!editBtn) return 'BTN_NOT_FOUND';
        
        editBtn.scrollIntoView({behavior: 'instant', block: 'center', inline: 'center'});
        
        let rect = editBtn.getBoundingClientRect();
        // Calculate screen coordinates
        let barHeight = window.outerHeight - window.innerHeight;
        let x = window.screenX + rect.left + (rect.width / 2);
        let y = window.screenY + barHeight + rect.top + (rect.height / 2);
        
        return Math.round(x) + ',' + Math.round(y);
    })();"
end tell
`;

let coords = runAppleScript(getCoordsScript);
if (!coords || coords === 'NOT_FOUND' || coords === 'BTN_NOT_FOUND') {
    console.error("Could not find button or tab: " + coords);
    process.exit(1);
}

console.log("Found Modifică serviciile at: " + coords);

// Use cliclick to click
let [cx, cy] = coords.split(',');
execSync(`/opt/homebrew/bin/cliclick m:${cx},${cy} w:500 c:.`);
console.log("Clicked mechanically using cliclick.");

// Wait for modal to open
execSync('sleep 4');

// Check what is visible now
let checkModalScript = `
tell application "Google Chrome"
    set activeWin to first window
    set activeTab to active tab of activeWin
    execute activeTab javascript "
    (function() {
        let t = document.body.innerText.toLowerCase();
        let isOpen = t.includes('adaugă un serviciu personalizat') || t.includes('add custom service') || t.includes('categorii de servicii') || t.includes('caută servicii');
        return isOpen.toString();
    })();"
end tell
`;
let modalOpen = runAppleScript(checkModalScript);
console.log("Modal opened? " + modalOpen);

if (modalOpen === 'true') {
    // Dump the modal text to see how to proceed
    let dumpModal = `
    tell application "Google Chrome"
        set activeWin to first window
        set activeTab to active tab of activeWin
        execute activeTab javascript "
        (function() {
            let container = Array.from(document.querySelectorAll('div')).find(d => {
                let dTxt = d.innerText.toLowerCase();
                return (dTxt.includes('adaugă un serviciu personalizat') || dTxt.includes('add custom service')) && d.offsetHeight > 300 && d.offsetWidth > 300;
            }) || document.body;
            return container.innerText;
        })();"
    end tell
    `;
    let txt = runAppleScript(dumpModal);
    fs.writeFileSync('/tmp/gbp_services_modal_text.txt', txt);
    console.log("Modal text dumped to /tmp/gbp_services_modal_text.txt");
}
