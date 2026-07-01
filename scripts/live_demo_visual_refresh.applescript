tell application "Google Chrome"
    activate
    make new window
    tell active tab of front window
        set URL to "http://localhost:4321/admin/visual/dbab7a7c-6718-4c99-990a-5331490937e0"
        delay 3
        
        -- Evidențiază elemente noile (Hero, Secțiuni, FAQs)
        execute javascript "
            window.scrollTo({ top: 0, behavior: 'smooth' });
            setTimeout(() => {
                const h1 = document.querySelector('.editable-h1');
                if(h1) {
                    h1.style.outline = '4px solid #ec4899';
                    h1.style.backgroundColor = 'rgba(236,72,153,0.2)';
                }
            }, 1000);
            
            setTimeout(() => {
                window.scrollTo({ top: 500, behavior: 'smooth' });
            }, 3000);
            
            setTimeout(() => {
                window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
            }, 5000);
        "
    end tell
end tell
