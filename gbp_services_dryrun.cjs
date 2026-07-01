const fs = require('fs');
const { execSync } = require('child_process');

const FOLDER_PATH = '/Users/universparty/wa-web-launcher/kassia-site';

const payload = `
(async function() {
    window.__gbpDryRunResult = null;
    try {
        let is_nmx_panel = true;
        let has_kassia_events = document.body.innerText.toLowerCase().includes('kassia events');
        
        let btns = Array.from(document.querySelectorAll('a, button, div[role=button], div[data-tooltip]'));
        let editServicesBtn = btns.find(b => {
            let txt = (b.innerText || '').toLowerCase().trim();
            return txt === 'editează serviciile' || txt === 'modifică serviciile' || txt === 'edit services' || txt === 'servicii';
        });

        if (!editServicesBtn) {
            window.__gbpDryRunResult = JSON.stringify({
                step1: {
                    is_nmx_panel: is_nmx_panel,
                    has_kassia_events: has_kassia_events,
                    has_modifica_serviciile: false,
                    url: window.location.href,
                    title: document.title
                },
                error: 'SERVICES_BTN_NOT_FOUND'
            });
            return;
        }

        let step1 = {
            is_nmx_panel: is_nmx_panel,
            has_kassia_events: has_kassia_events,
            has_modifica_serviciile: true,
            url: window.location.href,
            title: document.title
        };

        // Open panel
        editServicesBtn.click();
        await new Promise(r => setTimeout(r, 3000));

        let dialog = document.querySelector('div[role=dialog]');
        if (!dialog) {
            window.__gbpDryRunResult = JSON.stringify({ step1, error: 'DIALOG_NOT_FOUND' });
            return;
        }

        // Extract services
        let existing_services = [];
        let available_suggested_services = [];
        let custom_service_button_available = false;
        let requires_description = false;
        let requires_price = false;
        let raw_services_lines = [];

        // In NMX, selected services usually have a checkbox checked or a switch "on" or specific styling
        // Suggested services have a "+" icon or are just listed.
        // We will just extract all text inside the dialog to analyze it.
        // Also look for "Adaugă un serviciu personalizat" button
        let dialogBtns = Array.from(dialog.querySelectorAll('button, div[role=button]'));
        custom_service_button_available = dialogBtns.some(b => {
            let t = (b.innerText || '').toLowerCase();
            return t.includes('adaugă un serviciu personalizat') || t.includes('add custom service');
        });

        // Look for inputs like price or description
        let textareas = dialog.querySelectorAll('textarea');
        if (textareas.length > 0) requires_description = true;
        let priceInputs = dialog.querySelectorAll('input[type=number], input[name*=price]');
        if (priceInputs.length > 0) requires_price = true;

        raw_services_lines = dialog.innerText.split('\\n').map(l => l.trim()).filter(l => l.length > 0);

        // Click Cancel to ensure read-only
        let cancelBtn = dialogBtns.find(b => {
            let t = (b.innerText || '').toLowerCase();
            return t === 'anulează' || t === 'cancel' || t === 'închide' || t === 'close';
        });
        if (cancelBtn) cancelBtn.click();

        let step2 = {
            services_panel_opened: true,
            existing_services: existing_services,
            available_suggested_services: available_suggested_services,
            custom_service_button_available: custom_service_button_available,
            requires_description: requires_description,
            requires_price: requires_price,
            raw_services_lines: raw_services_lines
        };

        window.__gbpDryRunResult = JSON.stringify({ step1, step2 });
        
    } catch (e) {
        window.__gbpDryRunResult = JSON.stringify({ error: e.message });
    }
})();
`;

const triggerScript = `
tell application "Google Chrome"
    activate
    set injected to false
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" and (u contains "Kassia" or title of t contains "Kassia") then
                set has_nmx to true
                if has_nmx is true then
                    set active tab index of w to tabIndex
                    set index of w to 1
                    execute t javascript "${payload.replace(/"/g, '\\"')}"
                    set injected to true
                    exit repeat
                end if
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if injected is true then exit repeat
    end repeat
    if injected is false then return "NOT_FOUND"
    return "INJECTED"
end tell
`;

fs.writeFileSync('/tmp/trigger_dryrun.scpt', triggerScript);
let res = execSync('osascript /tmp/trigger_dryrun.scpt').toString().trim();
console.log("Trigger result:", res);

if (res === "INJECTED") {
    let result = null;
    for (let i = 0; i < 15; i++) {
        execSync('sleep 1');
        const pollScript = `
        tell application "Google Chrome"
            repeat with w in windows
                repeat with t in tabs of w
                    set u to URL of t
                    if u starts with "https://www.google.com/search" then
                        set r to execute t javascript "window.__gbpDryRunResult"
                        if r is not missing value then return r
                    end if
                end repeat
            end repeat
            return ""
        end tell
        `;
        fs.writeFileSync('/tmp/poll_dryrun.scpt', pollScript);
        let pollRes = execSync('osascript /tmp/poll_dryrun.scpt').toString().trim();
        if (pollRes !== "" && pollRes !== "null") {
            result = pollRes;
            break;
        }
    }
    fs.writeFileSync('/tmp/gbp_dryrun_res.json', result || '{"error": "TIMEOUT"}');
    console.log("Extraction complete. See /tmp/gbp_dryrun_res.json");
}
