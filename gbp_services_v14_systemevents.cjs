const fs = require('fs');
const { execSync } = require('child_process');

function runAppleScript(script) {
    try {
        return execSync(`osascript -e '${script.replace(/'/g, "'\\''")}'`).toString().trim();
    } catch (e) {
        return "";
    }
}

// 1. Get Tab Prefix
const getTabScriptPrefix = `
    set nmxTab to missing value
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" and (u contains "Kassia" or title of t contains "Kassia") then
                set has_nmx to execute t javascript "document.body.innerText.toLowerCase().includes('compania ta') || document.body.innerText.toLowerCase().includes('editează profilul') || document.body.innerText.toLowerCase().includes('edit profile')"
                if has_nmx is true then
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
    if nmxTab is missing value then return "NOT_FOUND"
`;

// 2. Focus the button and press Enter via System Events
let clickScript = `
tell application "Google Chrome"
    activate
${getTabScriptPrefix}
    
    set focusRes to execute nmxTab javascript "
    (function() {
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip]'));
        let editBtn = btns.find(b => {
            let txt = (b.innerText || '').toLowerCase().trim();
            return txt === 'modifică serviciile' || txt === 'edit services' || txt === 'editează serviciile';
        });
        if (editBtn) {
            editBtn.scrollIntoView({behavior: 'instant', block: 'center', inline: 'center'});
            editBtn.focus();
            return 'FOCUSED';
        }
        return 'NOT_FOUND';
    })();"
    
    if focusRes is "FOCUSED" then
        tell application "System Events"
            delay 1
            key code 36 -- Press Return
            delay 1
        end tell
        return "CLICKED_VIA_SYSTEM_EVENTS"
    else
        return focusRes
    end if
end tell
`;

let clickRes = runAppleScript(clickScript);
if (clickRes !== 'CLICKED_VIA_SYSTEM_EVENTS') {
    console.log(JSON.stringify({ error: "Focus or click failed", clickRes }, null, 2));
    process.exit(0);
}

// 3. Poll for modal text
let step2 = {
    services_panel_opened: false,
    dialog_detected: false,
    panel_title_detected: "",
    raw_services_lines: []
};

let modalFound = false;
for (let i = 0; i < 6; i++) {
    execSync('sleep 2');
    let extractModalScript = `
    tell application "Google Chrome"
${getTabScriptPrefix}
        execute nmxTab javascript "
        (function() {
            let t = document.body.innerText.toLowerCase();
            let isServicesOpen = t.includes('adaugă un serviciu personalizat') || t.includes('add custom service') || t.includes('adaugă alt serviciu') || t.includes('categorii de servicii') || t.includes('caută servicii');
            if (!isServicesOpen) return 'NO_DIALOG';
            
            let container = Array.from(document.querySelectorAll('div')).find(d => {
                let dTxt = d.innerText.toLowerCase();
                return (dTxt.includes('adaugă') || dTxt.includes('servici')) && d.offsetHeight > 300 && d.offsetWidth > 300;
            }) || document.body;

            let lines = container.innerText.split('\\\\n').map(l => l.trim()).filter(l => l.length > 0);
            return JSON.stringify({ lines: lines });
        })();"
    end tell
    `;
    let modalRes = runAppleScript(extractModalScript);
    if (modalRes && modalRes !== 'NO_DIALOG' && modalRes !== 'NOT_FOUND') {
        let data = JSON.parse(modalRes);
        step2.dialog_detected = true;
        step2.services_panel_opened = true;
        step2.raw_services_lines = data.lines;
        modalFound = true;
        break;
    }
}

// Ensure the modal is closed so the user doesn't get stuck
if (modalFound || !modalFound) {
    runAppleScript(`
    tell application "Google Chrome"
        activate
        tell application "System Events"
            key code 53 -- Press Escape
            delay 1
        end tell
    end tell
    `);
}

let result = {
    step1: { is_nmx_panel: true },
    step2: step2,
    step3: { reasons: modalFound ? [] : ["Panoul de servicii nu s-a deschis prin focus + Enter."] }
};

console.log(JSON.stringify(result, null, 2));
