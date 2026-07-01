const fs = require('fs');
const { execSync } = require('child_process');

const jsSnippet = `
window.extractedGBPResult = "PENDING";
(async function() {
    function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }
    
    let result = {
      url: window.location.href,
      title: document.title,
      extracted_at: new Date().toISOString(),
      business_name_detected: "Not found",
      primary_category_detected: "Not found",
      phone_detected: "Not found",
      website_detected: "Not found",
      chat_provider_detected: "Not found",
      chat_phone_detected: "Not found",
      service_areas_detected: [],
      hours_detected: { luni: "", marti: "", miercuri: "", joi: "", vineri: "", sambata: "", duminica: "" },
      services_detected: [],
      cards_or_tasks_visible: [],
      bad_strings_found: [],
      raw_relevant_lines: [],
      pass_checks: {
        business_name_ok: false,
        category_ok: false,
        phone_ok: false,
        website_ok: false,
        chat_whatsapp_ok: false,
        bucuresti_area_ok: false,
        ilfov_area_ok: false,
        hours_24_7_ok: false,
        services_basic_ok: false
      },
      hold_reasons: []
    };

    let keywords = [
        "Kassia Events", "Organizator de evenimente", "0763795919", "kassia.ro",
        "WhatsApp", "Text message", "SMS", "Mesaje", "București", "Ilfov", "Sector",
        "Voluntari", "Pipera", "Popești", "Bragadiru", "Chiajna", "Berceni", "Luni",
        "Marți", "Miercuri", "Joi", "Vineri", "Sâmbătă", "Duminică", "24 de ore",
        "Deschis", "Închis", "Adaugă programul de lucru", "Adaugă opțiunea de chat",
        "Evenimente corporatiste", "Evenimente la școală", "Design decorațiuni pentru evenimente",
        "Design decorațiuni", "Animatori", "Mascote", "Baloane", "Pictură", "Modelaj", "Mini-disco", "Moș Crăciun", "Ursitoare", "Popcorn", "Vată"
    ];

    function addRelevantLines(text, sectionName) {
        if (!text) return;
        let lines = text.split(/[\\n\\r]+/);
        let addedHeader = false;
        for (let line of lines) {
            let l = line.toLowerCase();
            let match = keywords.some(k => l.includes(k.toLowerCase()));
            if (match) {
                if (!addedHeader) {
                    result.raw_relevant_lines.push("--- " + sectionName + " ---");
                    addedHeader = true;
                }
                result.raw_relevant_lines.push(line.trim());
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
        addRelevantLines(mainText, "MAIN PANEL");
        
        if (mainText.includes('Adaugă programul de lucru')) result.cards_or_tasks_visible.push('Adaugă programul de lucru');
        if (mainText.includes('Adaugă opțiunea de chat')) result.cards_or_tasks_visible.push('Adaugă opțiunea de chat');
        
        let opened = clickByText(['Editează profilul', 'Edit profile', 'Editează pro...'], 'div, span, a, button');
        if (!opened) {
            result.hold_reasons.push("Nu am putut deschide Editează profilul. Poate panoul NMX nu este vizibil.");
            window.extractedGBPResult = JSON.stringify(result, null, 2);
            return;
        }
        
        await sleep(3000);
        
        let text = getAllText();
        addRelevantLines(text, "DESPRE");
        
        if (text.includes("Kassia Events")) {
            result.business_name_detected = "Kassia Events";
            result.pass_checks.business_name_ok = true;
        }
        if (text.includes("Organizator de evenimente")) {
            result.primary_category_detected = "Organizator de evenimente";
            result.pass_checks.category_ok = true;
        }

        clickByText(['Contact'], 'div, span, button, a, div[role="tab"]');
        await sleep(2000);
        text = getAllText();
        addRelevantLines(text, "CONTACT");
        
        if (text.includes("0763 795 919") || text.includes("0763795919")) {
            result.phone_detected = "0763795919";
            result.pass_checks.phone_ok = true;
        }
        if (text.includes("kassia.ro") || text.includes("https://www.kassia.ro")) {
            result.website_detected = "kassia.ro";
            result.pass_checks.website_ok = true;
        }

        clickByText(['Locație', 'Location'], 'div, span, button, a, div[role="tab"]');
        await sleep(2000);
        text = getAllText();
        addRelevantLines(text, "LOCATIE");
        
        if (text.includes("București") || text.includes("Bucuresti")) {
            result.service_areas_detected.push("București, România");
            result.pass_checks.bucuresti_area_ok = true;
        }
        if (text.includes("Ilfov")) {
            result.service_areas_detected.push("Ilfov, România");
            result.pass_checks.ilfov_area_ok = true;
        }

        clickByText(['Program'], 'div, span, button, a, div[role="tab"]');
        await sleep(2000);
        text = getAllText();
        addRelevantLines(text, "PROGRAM");
        
        let days = ['Luni', 'Marți', 'Miercuri', 'Joi', 'Vineri', 'Sâmbătă', 'Duminică'];
        let all24 = true;
        let textForHours = text;
        for (let i = 0; i < days.length; i++) {
            let day = days[i];
            let key = day.toLowerCase().replace('ț', 't').replace('ă', 'a').replace('â', 'a');
            
            let idx = textForHours.indexOf(day);
            if (idx === -1 && day === 'Marți') idx = textForHours.indexOf('Marti');
            if (idx === -1 && day === 'Sâmbătă') idx = textForHours.indexOf('Sambata');
            
            if (idx !== -1) {
                let chunk = textForHours.substring(idx, idx + 100).toLowerCase();
                if (chunk.includes('24 de ore') || chunk.includes('deschis non-stop') || chunk.includes('deschis nonstop') || chunk.includes('24 de')) {
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
            }
        }
        result.pass_checks.hours_24_7_ok = all24;

        let closeBtns = document.querySelectorAll('button');
        for (let b of closeBtns) {
            let label = b.getAttribute('aria-label');
            if (label === 'Închide' || label === 'Close' || (b.innerText && b.innerText.trim() === 'Anulează')) {
                b.click();
                break;
            }
        }
        await sleep(2000);

        let servOpened = clickByText(['Modifică serviciile', 'Modifică ser...', 'Edit services'], 'div, span, a, button');
        if (servOpened) {
            await sleep(3000);
            text = getAllText();
            addRelevantLines(text, "SERVICII");
            
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
            result.pass_checks.services_basic_ok = hasAll;
            if (!hasAll) {
                result.custom_services_pending = true;
                result.hold_reasons.push("Serviciile custom nu sunt adăugate încă.");
            }
            
            let closeBtns2 = document.querySelectorAll('button');
            for (let b of closeBtns2) {
                let label = b.getAttribute('aria-label');
                if (label === 'Închide' || label === 'Close') {
                    b.click();
                    break;
                }
            }
        } else {
            result.hold_reasons.push("Nu am gasit panoul Modifică serviciile.");
        }

        if (mainText.includes('WhatsApp')) {
            result.chat_provider_detected = 'WhatsApp';
            result.pass_checks.chat_whatsapp_ok = true;
        } else if (mainText.includes('Text message') || mainText.includes('SMS') || mainText.includes('Mesaje') || mainText.includes('Adaugă opțiunea de chat')) {
            result.chat_provider_detected = 'SMS sau Nesetat';
            result.pass_checks.chat_whatsapp_ok = false;
            result.hold_reasons.push("Chat-ul nu este setat corect pe WhatsApp.");
        } else {
            result.hold_reasons.push("Nu s-a putut detecta starea chat-ului din textul principal.");
        }

        window.extractedGBPResult = JSON.stringify(result, null, 2);
    } catch (e) {
        window.extractedGBPResult = "ERROR: " + e.message;
    }
})();
`.replace(/\\/g, "\\\\").replace(/"/g, "\\\"");

const appleScript = `
tell application "Google Chrome"
    activate
    
    set target_tab to missing value
    
    repeat with w in windows
        repeat with t in tabs of w
            if URL of t contains "google.com/search" and (URL of t contains "Kassia" or title of t contains "Kassia") then
                -- check if it has NMX
                set has_nmx to execute t javascript "document.documentElement.outerHTML.includes('Editează pro')"
                if has_nmx is true then
                    set target_tab to t
                    set index of w to 1
                    set active tab index of w to index of t
                    exit repeat
                end if
            end if
        end repeat
        if target_tab is not missing value then exit repeat
    end repeat
    
    if target_tab is missing value then
        tell window 1
            set target_tab to make new tab with properties {URL:"https://www.google.com/search?q=Kassia+Events"}
        end tell
        delay 5
    end if
    
    execute target_tab javascript "${jsSnippet}"
    
    set wait_time to 0
    repeat while wait_time < 20
        delay 1
        set wait_time to wait_time + 1
        set res to execute target_tab javascript "window.extractedGBPResult"
        if res is not "PENDING" and res is not missing value then
            return res
        end if
    end repeat
    
    return "ERROR: Timeout la extractie."
end tell
`;

fs.writeFileSync('/tmp/runner.scpt', appleScript);
try {
    const out = execSync('osascript /tmp/runner.scpt', { encoding: 'utf8' }).trim();
    if (out.startsWith("ERROR:")) {
        console.error(out);
        process.exit(1);
    }
    fs.writeFileSync('/tmp/gbp_profile_state_proof.json', out);
} catch(e) {
    console.error("AppleScript Error:", e.stderr || e.message);
    process.exit(1);
}
