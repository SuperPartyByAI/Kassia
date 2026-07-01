tell application "Google Chrome"
    activate
    
    make new window
    tell active tab of front window
        set URL to "http://localhost:4321/admin/visual/dbab7a7c-6718-4c99-990a-5331490937e0"
        
        delay 4
        
        -- Modifică Titlul H1 vizual
        execute javascript "
            const h1 = document.querySelector('.editable-h1');
            if(h1) {
                h1.focus();
                h1.style.backgroundColor = '#fdf4ff';
                h1.style.border = '2px dashed #ec4899';
                h1.innerText = 'Decoratiuni Baloane (Editat LIVE Vizual!)';
            }
        "
        delay 3
        
        -- Modifică o secțiune
        execute javascript "
            const body = document.querySelector('.editable-body');
            if(body) {
                body.focus();
                body.style.backgroundColor = '#fdf4ff';
                body.style.border = '2px dashed #ec4899';
                body.innerHTML = '<p>Așa arată acum! Ownerul dă click direct pe pagină și scrie textul fără să atingă codul.</p>';
            }
        "
        delay 3
        
        -- Salvează
        execute javascript "
            const saveBtn = document.getElementById('save-visual-btn');
            if(saveBtn) {
                saveBtn.style.transform = 'scale(1.1)';
                saveBtn.click();
            }
        "
        
    end tell
end tell
