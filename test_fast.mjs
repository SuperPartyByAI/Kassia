import https from 'https';

async function fetchUrl(url, label) {
    console.log(`\n--- Fetching via: ${label} ---`);
    try {
        const text = await Promise.race([
            fetch(url).then(r => r.text()),
            new Promise((_, reject) => setTimeout(() => reject(new Error('Timeout')), 5000))
        ]);

        const terms = [
            'face-painting', 'experiență superioară', 'Costurile pot varia'
        ];
        
        let anyDirty = false;
        for (const t of terms) {
            const has = text.includes(t);
            if (has) anyDirty = true;
            console.log(`- ${t}: ${has ? 'PRESENT (DIRTY)' : 'ABSENT (CLEAN)'}`);
        }
    } catch (e) {
        console.log("Error:", e.message);
    }
}

(async () => {
    const directUrl = 'https://www.kassia.ro/animatori-petreceri-copii/';
    
    // 1. Direct fetch (Local Sandbox Machine)
    await fetchUrl(directUrl, "Direct Local Sandbox");

    // 2. Microlink API
    await fetchUrl(`https://api.microlink.io?url=${encodeURIComponent(directUrl)}`, "Microlink Proxy");

    // 3. Corsproxy API
    await fetchUrl(`https://corsproxy.io/?${encodeURIComponent(directUrl)}`, "CorsProxy.io API");
})();
