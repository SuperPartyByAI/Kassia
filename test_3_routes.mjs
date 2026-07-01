import https from 'https';

async function fetchFrom(url, label) {
    console.log(`\n--- Fetching via: ${label} ---`);
    try {
        const text = await new Promise((resolve, reject) => {
            https.get(url, { headers: { 'User-Agent': 'Mozilla/5.0' } }, (res) => {
                let data = '';
                res.on('data', chunk => data += chunk);
                res.on('end', () => resolve(data));
            }).on('error', reject);
        });

        const terms = [
            'face-painting', 'experiență superioară', 'Costurile pot varia',
            'Servicii conexe care completează atmosfera', 'De ce să alegi Kassia Events',
            'Animatori pentru petreceri de copii în sectoarele Bucureștiului',
            'Ghid pentru planificarea programului de animație'
        ];
        
        let anyDirty = false;
        for (const t of terms) {
            const has = text.includes(t);
            if (has) anyDirty = true;
            console.log(`- ${t}: ${has ? 'PRESENT (DIRTY)' : 'ABSENT (CLEAN)'}`);
        }
        
        console.log(`- Pentru detalii comerciale actualizate: ${text.includes('Pentru detalii comerciale actualizate și opțiuni suplimentare') ? 'PRESENT' : 'ABSENT'}`);
        console.log(`- Pricing: 280 lei (${text.includes('280 lei')}), 490 lei (${text.includes('490 lei')}), 830 lei (${text.includes('830 lei')})`);
        console.log(`- 1-3 ore: ${text.includes('1-3 ore') ? 'PRESENT' : 'ABSENT'}`);
        console.log(`- Protected Blocks: reviews (${text.includes('Ce spun clienții noștri')}), stars (${text.includes('gtb-stars')}), badge (${text.includes('google-trust-badge')})`);

        return !anyDirty;

    } catch (e) {
        console.log("Error fetching:", e.message);
        return false;
    }
}

(async () => {
    // 1. Direct fetch (Local Sandbox Machine)
    const directUrl = 'https://www.kassia.ro/animatori-petreceri-copii/';
    await fetchFrom(directUrl, "Direct Local Sandbox");

    // 2. AllOrigins Proxy
    const proxyUrl = 'https://api.allorigins.win/raw?url=' + encodeURIComponent(directUrl);
    await fetchFrom(proxyUrl, "AllOrigins Proxy (Global API)");

    // 3. Another Proxy (CorsProxy.io)
    const corsProxyUrl = 'https://corsproxy.io/?' + encodeURIComponent(directUrl);
    await fetchFrom(corsProxyUrl, "CorsProxy.io (External Tool)");
})();
