const fs = require('fs');
const { execSync } = require('child_process');

const appleScriptContent = `
tell application "Google Chrome"
    activate
    
    -- Check if NMX is ALREADY open on any tab to avoid duplicates
    set found to false
    repeat with w in windows
        set tabIndex to 1
        repeat with t in tabs of w
            set u to URL of t
            if u starts with "https://www.google.com/search" and (u contains "Kassia" or title of t contains "Kassia") then
                set has_nmx to execute t javascript "document.body.innerText.toLowerCase().includes('compania ta') || document.body.innerText.toLowerCase().includes('editează profilul') || document.body.innerText.toLowerCase().includes('edit profile')"
                if has_nmx is true then
                    set active tab index of w to tabIndex
                    set index of w to 1
                    set activeWin to w
                    set activeTab to t
                    set found to true
                    exit repeat
                end if
            end if
            set tabIndex to tabIndex + 1
        end repeat
        if found is true then exit repeat
    end repeat

    if found is false then
        set activeWin to first window
        set activeTab to make new tab at end of tabs of activeWin
        set URL of activeTab to "https://business.google.com/locations"
        delay 6
        
        set u to URL of activeTab
        if u does not contain "google.com/search" then
            set js_click to "
            (function() {
                let links = Array.from(document.querySelectorAll('a, button, div[role=button]'));
                let kassiaLink = links.find(l => (l.innerText || '').toLowerCase().includes('kassia events') || (l.innerText || '').toLowerCase().includes('vezi profilul'));
                if (kassiaLink) {
                    kassiaLink.click();
                    return 'CLICKED';
                }
                return 'NOT_FOUND';
            })();
            "
            execute activeTab javascript js_click
            delay 6
        end if
    end if

    set js_extract to "
    (function() {
        let text = document.body.innerText.toLowerCase();
        let has_kassia = text.includes('kassia events');
        let has_modifica = text.includes('modifică serviciile') || text.includes('editează serviciile') || text.includes('edit services');
        let has_compania = text.includes('compania ta pe google') || text.includes('your business on google');
        let has_editeaza = text.includes('editează profilul') || text.includes('edit profile');
        let is_nmx = has_compania || has_editeaza || has_modifica;
        
        let lines = document.body.innerText.split('\\\\n').map(l=>l.trim()).filter(l=>l.length>0);
        let relevant = lines.filter(l => l.toLowerCase().includes('kassia') || l.toLowerCase().includes('compania') || l.toLowerCase().includes('servici') || l.toLowerCase().includes('profil')).slice(0, 15);
        
        return JSON.stringify({
            is_nmx_panel: is_nmx,
            has_kassia_events: has_kassia,
            has_modifica_serviciile: has_modifica,
            has_compania_ta_pe_google: has_compania,
            has_editeaza_profilul: has_editeaza,
            url: window.location.href,
            title: document.title,
            visible_relevant_lines: relevant,
            hold_reasons: []
        }, null, 2);
    })();
    "
    set res to execute activeTab javascript js_extract
    return res
end tell
`;

fs.writeFileSync('/tmp/recover_nmx.scpt', appleScriptContent);

try {
    let output = execSync('osascript /tmp/recover_nmx.scpt').toString().trim();
    fs.writeFileSync('/tmp/gbp_nmx_proof.json', output);
    console.log("NMX Proof saved to /tmp/gbp_nmx_proof.json");
} catch (e) {
    console.error("Failed", e);
}
