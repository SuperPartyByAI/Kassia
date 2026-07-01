tell application "Google Chrome"
    activate
    
    -- Create a new window or use existing
    make new window
    
    tell active tab of front window
        set URL to "http://localhost:4321/admin/pages/dbab7a7c-6718-4c99-990a-5331490937e0"
        
        -- Wait for page load
        delay 3
        
        -- 1. Completeaza tab-ul SEO
        execute javascript "
            document.querySelector('textarea[name=\"meta_description\"]').value = 'Demonstratie Live Antigravity: Acesta este un test real de content entry!';
            document.querySelector('textarea[name=\"meta_description\"]').style.backgroundColor = '#ffffcc';
        "
        delay 2
        
        -- Salveaza SEO
        execute javascript "
            const forms = document.querySelectorAll('form');
            for(let f of forms) {
               if(f.querySelector('input[value=\"update_seo\"]')) {
                   f.querySelector('button').click();
               }
            }
        "
        delay 3
        
        -- 2. Mergi la tab-ul Sections
        execute javascript "switchTab('sections');"
        delay 2
        
        -- Gaseste prima sectiune si adauga text
        execute javascript "
            const textareas = document.querySelectorAll('#sections textarea');
            if(textareas.length > 0) {
                textareas[0].value = 'Continut generat live in timpul demonstratiei... Testul functioneaza perfect!';
                textareas[0].style.backgroundColor = '#ffffcc';
            }
        "
        delay 2
        
        -- Salveaza sectiunea
        execute javascript "
            const sectionsDiv = document.getElementById('sections');
            if(sectionsDiv) {
                const saveBtns = sectionsDiv.querySelectorAll('button[type=\"submit\"]');
                if(saveBtns.length > 0) saveBtns[0].click();
            }
        "
        delay 3
        
        -- 3. Mergi la Publish Guard ca sa aratam ca e blocat
        execute javascript "switchTab('publish');"
        delay 3
        
        -- Evidentiaza butonul de Publish disabled
        execute javascript "
            const pubBtn = document.querySelector('button[title*=\"Publish is disabled\"]');
            if(pubBtn) {
                pubBtn.style.border = '4px solid red';
                pubBtn.innerText = 'Publish Page (COMPLET BLOCAT)';
            }
        "
    end tell
end tell
