const fs = require('fs');
const { execSync } = require('child_process');

const jsSnippet = `
window.extractedGBPResultPatch = "PENDING";
(async function() {
    function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }
    
    let result = {
      source_context: "GBP_NMX",
      hours_detected: { luni: "", marti: "", miercuri: "", joi: "", vineri: "", sambata: "", duminica: "" },
      hours_24_7_ok: false,
      services_detected: [],
      services_basic_ok: false,
      raw_program_lines: [],
      raw_services_lines: [],
      hold_reasons: []
    };

    let keywordsHours = ["Luni", "Marți", "Miercuri", "Joi", "Vineri", "Sâmbătă", "Duminică", "luni", "marti", "miercuri", "joi", "vineri", "sambata", "duminica", "24 de ore", "Deschis", "Închis", "Adaugă programul de lucru"];
    let keywordsServices = ["Evenimente corporatiste", "Evenimente la școală", "Design decorațiuni", "Animatori", "Mascote", "Baloane", "Pictură", "Modelaj", "Mini-disco", "Moș Crăciun", "Ursitoare", "Popcorn", "Vată"];

    function addRelevantLines(text, sectionName, keywords, targetArray) {
        if (!text) return;
        let lines = text.split(/[\\n\\r]+/);
        let addedHeader = false;
        for (let line of lines) {
            let l = line.toLowerCase();
            let match = keywords.some(k => l.includes(k.toLowerCase()));
            if (match) {
                if (!addedHeader) {
                    targetArray.push("--- " + sectionName + " ---");
                    addedHeader = true;
                }
                targetArray.push(line.trim());
            }
        }
    }

    try {
        function clickByText(textOptions, selector = '*') {
            let els = document.querySelectorAll(selector);
            for (let el of els) {
                let t = (el.innerText || "").trim();
                if (textOptions.includes(t) && el.children.length === 0) {
                    el.click();
                    return true;
                }
            }
            for (let el of els) {
                let t = (el.innerText || "").trim();
                if (textOptions.some(opt => t.includes(opt))) {
                    el.click();
                    return true;
                }
            }
            return false;
        }
        
        function getAllText() {
            return document.body.innerText || "";
        }
        
        function normalizeDayKey(s) {
          return s
            .toLowerCase()
            .normalize('NFD')
            .replace(/[\\u0300-\\u036f]/g, '')
            .replace(/ș/g, 's')
            .replace(/ş/g, 's')
            .replace(/ț/g, 't')
            .replace(/ţ/g, 't')
            .replace(/ă/g, 'a')
            .replace(/â/g, 'a')
            .replace(/î/g, 'i');
        }

        window.extractedGBPResultPatch = "DEBUG: Start extraction";
        
        // Deschidem panoul de Program dacă suntem în panou principal.
        window.extractedGBPResultPatch = "DEBUG: Clicking Editează profilul if needed or Program directly";
        // Let's ensure we click 'Program' whether we are in the main view or the edit modal.
        // It might be better to click "Editează profilul" first just in case.
        let mainText = getAllText();
        if (mainText.includes('Editează profilul') || mainText.includes('Edit profile')) {
             clickByText(['Editează profilul', 'Edit profile', 'Editează pro...', 'Profilul companiei'], 'div, span, a, button');
             await sleep(3000);
        }

        window.extractedGBPResultPatch = "DEBUG: Clicking Program";
        let programOpened = clickByText(['Program'], 'div, span, button, a, div[role="tab"]');
        if (!programOpened) {
            result.hold_reasons.push("Nu am putut deschide tabul Program.");
        } else {
            await sleep(2000);
            let text = getAllText();
            addRelevantLines(text, "PROGRAM", keywordsHours, result.raw_program_lines);
            
            let days = ['Luni', 'Marți', 'Miercuri', 'Joi', 'Vineri', 'Sâmbătă', 'Duminică'];
            let all24 = true;
            let allPresent = true;
            let textForHours = text;
            for (let i = 0; i < days.length; i++) {
                let day = days[i];
                let key = normalizeDayKey(day);
                
                let idx = textForHours.indexOf(day);
                if (idx === -1 && day === 'Marți') idx = textForHours.indexOf('Marti');
                if (idx === -1 && day === 'Sâmbătă') idx = textForHours.indexOf('Sambata');
                
                if (idx !== -1) {
                    let chunk = textForHours.substring(idx, idx + 100).toLowerCase();
                    if (chunk.includes('24 de ore') || chunk.includes('deschis non-stop') || chunk.includes('deschis nonstop') || chunk.includes('24 de') || chunk.includes('00:00–23:59') || chunk.includes('00:00-23:59')) {
                        result.hours_detected[key] = "24 de ore";
                    } else if (chunk.includes('închis') || chunk.includes('inchis')) {
                        result.hours_detected[key] = "Închis";
                        all24 = false;
                    } else {
                        result.hours_detected[key] = "Unknown: " + chunk.substring(0, 30).replace(/[\\n\\r]+/g, " ");
                        all24 = false;
                    }
                } else {
                    result.hours_detected[key] = "Not found";
                    all24 = false;
                    allPresent = false;
                }
            }
            result.hours_24_7_ok = all24 && allPresent;
            if (!all24 || !allPresent) result.hold_reasons.push("Programul nu este 24 de ore clar definit în fiecare zi.");

            // Închide panoul Program if it was a modal, but actually usually "Program" just switches tab inside the "Editează profilul" modal.
            // We just need to stay in the modal and go to Services, or close if Services is somewhere else.
            // Wait, Services is "Modifică serviciile" which is usually a separate button on the MAIN search page NMX bar!
            // Let's close the "Editează profilul" modal completely first.
            window.extractedGBPResultPatch = "DEBUG: Closing Program modal / Editează profilul";
            let closeBtns = document.querySelectorAll('button');
            for (let b of closeBtns) {
                let label = b.getAttribute('aria-label');
                if (label === 'Închide' || label === 'Close' || (b.innerText && b.innerText.trim() === 'Anulează') || (b.innerText && b.innerText.trim() === 'X')) {
                    b.click();
                    break;
                }
            }
            await sleep(2000);
        }

        // Now we are back in NMX main panel.
        window.extractedGBPResultPatch = "DEBUG: Clicking Edit services";
        let servOpened = clickByText(['Modifică serviciile', 'Modifică ser...', 'Edit services'], 'div, span, a, button');
        if (servOpened) {
            await sleep(3000);
            let text = getAllText();
            addRelevantLines(text, "SERVICII", keywordsServices, result.raw_services_lines);
            
            let requiredServices = ['Evenimente corporatiste', 'Evenimente la școală', 'Design decorațiuni'];
            let hasAll = true;
            for (let s of requiredServices) {
                let sNorm = s.toLowerCase().replace('ș', 's').replace('ț', 't');
                let tNorm = text.toLowerCase().replace('ș', 's').replace('ț', 't');
                if (tNorm.includes(sNorm)) {
                    result.services_detected.push(s);
                } else {
                    hasAll = false;
                }
            }
            result.services_basic_ok = hasAll;
            if (!hasAll) {
                result.hold_reasons.push("Nu au fost găsite toate serviciile de bază (Evenimente corporatiste, Evenimente la școală, Design decorațiuni).");
            }
            
            let closeBtns2 = document.querySelectorAll('button');
            for (let b of closeBtns2) {
                let label = b.getAttribute('aria-label');
                if (label === 'Închide' || label === 'Close' || (b.innerText && b.innerText.trim() === 'X')) {
                    b.click();
                    break;
                }
            }
        } else {
            result.hold_reasons.push("Nu am gasit panoul Modifică serviciile.");
        }

        window.extractedGBPResultPatch = JSON.stringify(result, null, 2);
    } catch (e) {
        window.extractedGBPResultPatch = "ERROR: " + e.message;
    }
})();
`.replace(/\\/g, "\\\\").replace(/"/g, "\\\"");

const appleScript = `
tell application "Google Chrome"
    activate
    
    set the_tab to missing value
    set the_win to missing value
    
    repeat with w in windows
        repeat with t in tabs of w
            set u to URL of t
            if title of t contains "Kassia" or u contains "Kassia" or u contains "google.com" then
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
    
    if the_tab is missing value then
        return "ERROR: Nu am gasit niciun tab cu NMX deschis. STOP."
    end if
    
    set index of the_win to 1
    
    execute the_tab javascript "${jsSnippet}"
    
    set wait_time to 0
    repeat while wait_time < 45
        delay 1
        set wait_time to wait_time + 1
        set res to execute the_tab javascript "window.extractedGBPResultPatch"
        if res is not "PENDING" and res does not start with "DEBUG:" and res is not missing value then
            return res
        end if
    end repeat
    
    set debug_state to execute the_tab javascript "window.extractedGBPResultPatch"
    return "ERROR: Timeout la extractie patch. Stare: " & debug_state
end tell
`;

fs.writeFileSync('/tmp/runner_patch.scpt', appleScript);

let fallbackJson = {
  source_context: "GBP_NMX",
  hours_detected: { luni: "", marti: "", miercuri: "", joi: "", vineri: "", sambata: "", duminica: "" },
  hours_24_7_ok: false,
  services_detected: [],
  services_basic_ok: false,
  raw_program_lines: [],
  raw_services_lines: [],
  hold_reasons: []
};

try {
    const out = execSync('osascript /tmp/runner_patch.scpt', { encoding: 'utf8' }).trim();
    if (out.startsWith("ERROR:")) {
        console.error(out);
        fallbackJson.hold_reasons.push(out);
        fs.writeFileSync('/tmp/gbp_profile_state_proof_patch_hours_services.json', JSON.stringify(fallbackJson, null, 2));
    } else {
        fs.writeFileSync('/tmp/gbp_profile_state_proof_patch_hours_services.json', out);
    }
} catch(e) {
    console.error("AppleScript Error:", e.stderr || e.message);
    fallbackJson.hold_reasons.push(e.stderr || e.message);
    fs.writeFileSync('/tmp/gbp_profile_state_proof_patch_hours_services.json', JSON.stringify(fallbackJson, null, 2));
}
