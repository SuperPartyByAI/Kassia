const fs = require('fs');
const { execSync } = require('child_process');

const jsCheckSnippet = `
(function() {
    let result = {
      url: window.location.href,
      title: document.title,
      is_business_google: window.location.href.includes('business.google.com'),
      is_locations_page: window.location.href.includes('business.google.com/locations'),
      is_nmx_panel: false,
      has_kassia_events: false,
      has_editeaza_profilul: false,
      has_compania_ta_pe_google: false,
      visible_relevant_lines: [],
      hold_reasons: []
    };
    
    function getAllText() {
        let els = document.querySelectorAll('*:not(script):not(style):not(noscript):not(link):not(meta)');
        let out = [];
        for (let i=0; i<els.length; i++) {
            if (els[i].children.length === 0 && els[i].textContent && els[i].textContent.trim().length > 0) {
                out.push(els[i].textContent.trim());
            }
        }
        return out.join('\\n');
    }
    
    let mainText = getAllText();
    let lines = mainText.split(/[\\n\\r]+/);
    
    let keywords = ['Compania ta pe Google', 'Editează profilul', 'Profilul companiei', 'Completează profilul', 'Kassia Events'];
    let added = false;
    for(let line of lines) {
        if(keywords.some(k => line.toLowerCase().includes(k.toLowerCase()))) {
            result.visible_relevant_lines.push(line.trim());
        }
    }
    
    if (mainText.includes('Compania ta pe Google')) result.has_compania_ta_pe_google = true;
    if (mainText.includes('Editează profilul')) result.has_editeaza_profilul = true;
    if (mainText.includes('Kassia Events')) result.has_kassia_events = true;
    
    if (result.has_compania_ta_pe_google || result.has_editeaza_profilul || mainText.includes('Profilul companiei') || mainText.includes('Completează profilul')) {
        result.is_nmx_panel = true;
    } else {
        result.hold_reasons.push("Nu am gasit Editează profilul sau Compania ta pe Google în pagină.");
    }
    
    return JSON.stringify(result, null, 2);
})();
`.replace(/\\/g, "\\\\").replace(/"/g, "\\\"");


const appleScript = `
tell application "Google Chrome"
    activate
    
    set the_tab to missing value
    set the_win to missing value
    
    -- 1. Check if we already have a locations tab
    repeat with w in windows
        repeat with t in tabs of w
            if URL of t contains "business.google.com/locations" then
                set the_tab to t
                set the_win to w
                exit repeat
            end if
        end repeat
        if the_tab is not missing value then exit repeat
    end repeat
    
    -- 2. If not, check if we already have an NMX tab
    if the_tab is missing value then
        repeat with w in windows
            repeat with t in tabs of w
                set u to URL of t
                if u contains "google.com/search" and (u contains "Kassia" or title of t contains "Kassia") then
                    set has_nmx to execute t javascript "document.documentElement.outerHTML.includes('Editează pro') || document.documentElement.outerHTML.includes('Compania ta')"
                    if has_nmx is true then
                        set the_tab to t
                        set the_win to w
                        exit repeat
                    end if
                end if
            end repeat
            if the_tab is not missing value then exit repeat
        end repeat
    end if
    
    -- 3. If STILL no tab, create a locations tab
    if the_tab is missing value then
        tell window 1
            set the_tab to make new tab with properties {URL:"https://business.google.com/locations"}
            set the_win to it
        end tell
        delay 6
    end if
    
    -- Bring to front
    set index of the_win to 1
    
    -- Check if we are on locations
    set u to URL of the_tab
    if u contains "business.google.com/locations" then
        -- Click Kassia Events
        execute the_tab javascript "
            let els = document.querySelectorAll('*');
            for(let e of els) {
                if(e.innerText && e.innerText.trim() === 'Kassia Events') {
                    e.click();
                    break;
                }
            }
        "
        -- Wait for navigation to finish
        delay 8
    end if
    
    -- 4. Inject the checking script
    set res to execute the_tab javascript "${jsCheckSnippet}"
    
    if res is missing value then
        return "ERROR: Nu s-a putut extrage rezultatul."
    else
        return res
    end if
end tell
`;

fs.writeFileSync('/tmp/runner3.scpt', appleScript);

let fallbackJson = {
  url: "Unknown",
  title: "Unknown",
  is_business_google: false,
  is_locations_page: false,
  is_nmx_panel: false,
  has_kassia_events: false,
  has_editeaza_profilul: false,
  has_compania_ta_pe_google: false,
  visible_relevant_lines: [],
  hold_reasons: ["Eroare la execuția AppleScript"]
};

try {
    const out = execSync('osascript /tmp/runner3.scpt', { encoding: 'utf8' }).trim();
    if (out.startsWith("ERROR:")) {
        console.error(out);
        fallbackJson.hold_reasons.push(out);
        fs.writeFileSync('/tmp/gbp_profile_nav_proof.json', JSON.stringify(fallbackJson, null, 2));
    } else {
        fs.writeFileSync('/tmp/gbp_profile_nav_proof.json', out);
    }
} catch(e) {
    console.error("AppleScript Error:", e.stderr || e.message);
    fallbackJson.hold_reasons.push(e.stderr || e.message);
    fs.writeFileSync('/tmp/gbp_profile_nav_proof.json', JSON.stringify(fallbackJson, null, 2));
}
