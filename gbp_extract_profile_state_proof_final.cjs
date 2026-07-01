const fs = require('fs');
const { execSync } = require('child_process');

const jsSnippet = `
window.extractedGBPResultFinal = "PENDING";
(async function() {
    function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }
    
    let result = {
      source_context: "GBP_NMX",
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
        is_gbp_panel: false,
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
      custom_services_pending: true,
      hold_reasons: []
    };

    let keywords = [
        "GBP_NMX", "Kassia Events", "Organizator de evenimente", "0763795919", "0763 795 919", "kassia.ro",
        "WhatsApp", "Text message", "SMS", "Mesaje", "București", "Ilfov", "Sector",
        "Voluntari", "Pipera", "Popești", "Bragadiru", "Chiajna", "Berceni", "Luni",
        "Marți", "Miercuri", "Joi", "Vineri", "Sâmbătă", "Duminică", "luni", "marti", "miercuri", "joi", "vineri", "sambata", "duminica", "24 de ore",
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
            return document.body.innerText || "";
        }

        window.extractedGBPResultFinal = "DEBUG: Start extraction";
        let mainText = getAllText();
        addRelevantLines(mainText, "MAIN PANEL");
        
        let hasNMX = mainText.includes('Compania ta pe Google') || mainText.includes('Editează profilul') || mainText.includes('Profilul companiei') || mainText.includes('Completează profilul');
        if (hasNMX && mainText.includes('Kassia Events')) {
            result.pass_checks.is_gbp_panel = true;
        } else {
            result.hold_reasons.push("Nu am gasit panoul NMX impreuna cu Kassia Events in textul principal.");
        }
        
        if (mainText.includes('Adaugă programul de lucru')) result.cards_or_tasks_visible.push('Adaugă programul de lucru');
        if (mainText.includes('Adaugă opțiunea de chat')) result.cards_or_tasks_visible.push('Adaugă opțiunea de chat');
        
        window.extractedGBPResultFinal = "DEBUG: Clicking Editează profilul";
        let opened = clickByText(['Editează profilul', 'Edit profile', 'Editează pro...', 'Profilul companiei'], 'div, span, a, button');
        if (!opened) {
            result.hold_reasons.push("Nu am putut deschide Editează profilul / NMX panel edit.");
            window.extractedGBPResultFinal = JSON.stringify(result, null, 2);
            return;
        }
        
        await sleep(3000);
        window.extractedGBPResultFinal = "DEBUG: Extracting About";
        
        let text = getAllText();
        addRelevantLines(text, "DESPRE");
        
        if (text.includes("Kassia Events")) {
            result.business_name_detected = "Kassia Events";
            result.pass_checks.business_name_ok = true;
        } else {
            result.hold_reasons.push("Numele companiei nu este Kassia Events.");
        }
        
        if (text.includes("Organizator de evenimente")) {
            result.primary_category_detected = "Organizator de evenimente";
            result.pass_checks.category_ok = true;
        } else {
            result.hold_reasons.push("Categoria nu este Organizator de evenimente.");
        }

        window.extractedGBPResultFinal = "DEBUG: Clicking Contact";
        clickByText(['Contact'], 'div, span, button, a, div[role="tab"]');
        await sleep(2000);
        text = getAllText();
        addRelevantLines(text, "CONTACT");
        
        if (text.includes("0763 795 919") || text.includes("0763795919")) {
            result.phone_detected = "0763795919";
            result.pass_checks.phone_ok = true;
        } else {
            result.hold_reasons.push("Telefonul corect nu a fost găsit.");
        }
        
        if (text.includes("kassia.ro") || text.includes("https://www.kassia.ro")) {
            result.website_detected = "kassia.ro";
            result.pass_checks.website_ok = true;
        } else {
            result.hold_reasons.push("Website-ul nu este kassia.ro.");
        }

        window.extractedGBPResultFinal = "DEBUG: Clicking Location";
        clickByText(['Locație', 'Location'], 'div, span, button, a, div[role="tab"]');
        await sleep(2000);
        text = getAllText();
        addRelevantLines(text, "LOCATIE");
        
        if (text.includes("București") || text.includes("Bucuresti")) {
            result.service_areas_detected.push("București, România");
            result.pass_checks.bucuresti_area_ok = true;
        } else {
            result.hold_reasons.push("București lipsește din zonele de servicii.");
        }
        
        if (text.includes("Ilfov")) {
            result.service_areas_detected.push("Ilfov, România");
            result.pass_checks.ilfov_area_ok = true;
        } else {
            result.hold_reasons.push("Ilfov lipsește din zonele de servicii.");
        }

        window.extractedGBPResultFinal = "DEBUG: Clicking Program";
        clickByText(['Program'], 'div, span, button, a, div[role="tab"]');
        await sleep(2000);
        text = getAllText();
        addRelevantLines(text, "PROGRAM");
        
        let days = ['Luni', 'Marți', 'Miercuri', 'Joi', 'Vineri', 'Sâmbătă', 'Duminică'];
        let all24 = true;
        let allPresent = true;
        let textForHours = text;
        for (let i = 0; i < days.length; i++) {
            let day = days[i];
            let key = day.toLowerCase().replace('ț', 't').replace('ă', 'a').replace('â', 'a');
            
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
        result.pass_checks.hours_24_7_ok = all24 && allPresent;
        if (!all24 || !allPresent) result.hold_reasons.push("Programul nu este 24 de ore clar definit în fiecare zi.");

        window.extractedGBPResultFinal = "DEBUG: Closing modal";
        let closeBtns = document.querySelectorAll('button');
        for (let b of closeBtns) {
            let label = b.getAttribute('aria-label');
            if (label === 'Închide' || label === 'Close' || (b.innerText && b.innerText.trim() === 'Anulează') || (b.innerText && b.innerText.trim() === 'X')) {
                b.click();
                break;
            }
        }
        await sleep(2000);

        window.extractedGBPResultFinal = "DEBUG: Clicking Edit services";
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
                result.hold_reasons.push("Serviciile custom urmează să fie adăugate din Edit services după confirmarea profilului de bază.");
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
            result.custom_services_pending = true;
            result.hold_reasons.push("Serviciile custom urmează să fie adăugate din Edit services după confirmarea profilului de bază.");
        }

        if (mainText.includes('WhatsApp')) {
            result.chat_provider_detected = 'WhatsApp';
            result.pass_checks.chat_whatsapp_ok = true;
        } else if (mainText.includes('Text message') || mainText.includes('SMS') || mainText.includes('Mesaje') || mainText.includes('Adaugă opțiunea de chat')) {
            result.chat_provider_detected = 'SMS sau Nesetat';
            result.pass_checks.chat_whatsapp_ok = false;
            result.hold_reasons.push("Chat-ul nu este setat corect pe WhatsApp.");
        } else {
            result.hold_reasons.push("Nu s-a putut detecta starea chat-ului din textul principal (lipsă text WhatsApp).");
        }

        window.extractedGBPResultFinal = JSON.stringify(result, null, 2);
    } catch (e) {
        window.extractedGBPResultFinal = "ERROR: " + e.message;
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
        set res to execute the_tab javascript "window.extractedGBPResultFinal"
        if res is not "PENDING" and res does not start with "DEBUG:" and res is not missing value then
            return res
        end if
    end repeat
    
    set debug_state to execute the_tab javascript "window.extractedGBPResultFinal"
    return "ERROR: Timeout la extractie finala. Stare: " & debug_state
end tell
`;

fs.writeFileSync('/tmp/runner_final.scpt', appleScript);

let fallbackJson = {
    source_context: "GBP_NMX",
    url: "Unknown",
    title: "Unknown",
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
        is_gbp_panel: false,
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
    custom_services_pending: true,
    hold_reasons: []
};

try {
    const out = execSync('osascript /tmp/runner_final.scpt', { encoding: 'utf8' }).trim();
    if (out.startsWith("ERROR:")) {
        console.error(out);
        fallbackJson.hold_reasons.push(out);
        fs.writeFileSync('/tmp/gbp_profile_state_proof_final.json', JSON.stringify(fallbackJson, null, 2));
    } else {
        fs.writeFileSync('/tmp/gbp_profile_state_proof_final.json', out);
    }
} catch(e) {
    console.error("AppleScript Error:", e.stderr || e.message);
    fallbackJson.hold_reasons.push(e.stderr || e.message);
    fs.writeFileSync('/tmp/gbp_profile_state_proof_final.json', JSON.stringify(fallbackJson, null, 2));
}
