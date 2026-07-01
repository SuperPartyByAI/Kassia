import https from 'https';

async function fetchUrl(url, label) {
    console.log(`\n--- Fetching via: ${label} ---`);
    try {
        const text = await Promise.race([
            fetch(url).then(r => r.text()),
            new Promise((_, reject) => setTimeout(() => reject(new Error('Timeout')), 5000))
        ]);

        const terms = [
            'momentele de momentele', 'ajută la o o', 'Un singur animator la un grup foarte mare riscă',
            'Pentru un grup foarte mare, un singur personaj animator poate pierde'
        ];
        
        for (const t of terms) {
            const has = text.includes(t);
            console.log(`- "${t}": ${has ? 'PRESENT' : 'ABSENT'}`);
        }
    } catch (e) {
        console.log("Error:", e.message);
    }
}

(async () => {
    // 1. HTTP without WWW
    await fetchUrl('http://kassia.ro/animatori-petreceri-copii/', "HTTP No-WWW");
    
    // 2. HTTPS without WWW
    await fetchUrl('https://kassia.ro/animatori-petreceri-copii/', "HTTPS No-WWW");
    
    // 3. HTTP with WWW
    await fetchUrl('http://www.kassia.ro/animatori-petreceri-copii/', "HTTP WWW");
    
    // 4. HTTPS with WWW
    await fetchUrl('https://www.kassia.ro/animatori-petreceri-copii/', "HTTPS WWW");
})();
