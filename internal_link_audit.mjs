import puppeteer from 'puppeteer';

async function auditLinks() {
    console.log("Starting LIVE INTERNAL LINK AUDIT for Kassia...");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    
    const TARGET_URL = '/animatori-petreceri-copii/';
    const results = [];
    
    async function scanPage(url, pageType) {
        try {
            const response = await p.goto(url, { waitUntil: 'networkidle2', timeout: 15000 });
            const isIndexable = response.status() === 200; // Simplified
            
            const links = await p.evaluate((target, pType, sourceUrl, indexable) => {
                const found = [];
                const allLinks = document.querySelectorAll(`a[href*="${target}"]`);
                
                allLinks.forEach(a => {
                    // Determine area
                    let area = 'body';
                    if (a.closest('header') || a.closest('nav') || a.closest('.mobile-menu-drawer')) area = 'header/nav';
                    else if (a.closest('footer')) area = 'footer';
                    else if (a.closest('.card') || a.closest('.pachet-card')) area = 'card';
                    else if (a.closest('.breadcrumb')) area = 'breadcrumb';
                    else area = 'contextual';
                    
                    found.push({
                        sourceUrl: sourceUrl,
                        sourceType: pType,
                        anchorText: a.innerText.trim() || a.getAttribute('aria-label') || 'IMG/Icon',
                        area: area,
                        rel: a.getAttribute('rel') || 'follow (default)',
                        isVisible: a.offsetParent !== null,
                        isIndexable: indexable,
                        isSemanticRelevant: true // Generally true for this site
                    });
                });
                return found;
            }, TARGET_URL, pageType, url, isIndexable);
            
            results.push(...links);
        } catch(e) {
            console.error(`Failed to scan ${url}:`, e.message);
        }
    }
    
    // Pages to scan
    const pagesToScan = [
        { url: 'https://www.kassia.ro/', type: 'homepage' },
        { url: 'https://www.kassia.ro/pachete-animatori-copii-bucuresti/', type: 'servicii animatori' },
        { url: 'https://www.kassia.ro/mascote-petreceri-copii-bucuresti/', type: 'servicii animatori' },
        { url: 'https://www.kassia.ro/pictura-pe-fata-copii-bucuresti/', type: 'servicii animatori' },
        { url: 'https://www.kassia.ro/modelaj-baloane-copii-bucuresti/', type: 'baloane/evenimente' },
        { url: 'https://www.kassia.ro/animatori-petreceri-copii-sector-1/', type: 'pagini locale' },
        { url: 'https://www.kassia.ro/animatori-petreceri-copii-sector-2/', type: 'pagini locale' },
        { url: 'https://www.kassia.ro/animatori-petreceri-copii-sector-3/', type: 'pagini locale' },
        { url: 'https://www.kassia.ro/animatori-petreceri-copii-sector-4/', type: 'pagini locale' },
        { url: 'https://www.kassia.ro/animatori-petreceri-copii-sector-5/', type: 'pagini locale' },
        { url: 'https://www.kassia.ro/animatori-petreceri-copii-sector-6/', type: 'pagini locale' },
        { url: 'https://www.kassia.ro/animatori-petreceri-copii-voluntari/', type: 'pagini locale' },
        { url: 'https://www.kassia.ro/animatori-petreceri-copii-popesti-leordeni/', type: 'pagini locale' },
        { url: 'https://www.kassia.ro/animatori-petreceri-copii-berceni/', type: 'pagini locale' }
    ];
    
    for (let page of pagesToScan) {
        console.log(`Scanning ${page.url}...`);
        await scanPage(page.url, page.type);
    }
    
    // Now check outbound from Main Hub
    console.log("Scanning Main Hub outbound links...");
    await p.goto('https://www.kassia.ro/animatori-petreceri-copii/', { waitUntil: 'networkidle2' });
    const outboundLocal = await p.evaluate(() => {
        const locals = ['sector-1', 'sector-2', 'sector-3', 'sector-4', 'sector-5', 'sector-6', 'voluntari', 'berceni', 'popesti-leordeni'];
        const status = {};
        locals.forEach(loc => {
            const link = document.querySelector(`a[href*="${loc}"]`);
            status[loc] = !!link;
        });
        return status;
    });

    await browser.close();
    
    console.log("\n=== INBOUND LINKS TO MAIN HUB ===");
    const categories = {
        'homepage': [],
        'header/nav': [], // from anywhere
        'footer': [], // from anywhere
        'pagini locale': [],
        'servicii animatori': [],
        'baloane/evenimente': [],
        'alte pagini': []
    };
    
    results.forEach(r => {
        if (r.area === 'header/nav') categories['header/nav'].push(r);
        else if (r.area === 'footer') categories['footer'].push(r);
        else if (r.sourceType === 'homepage') categories['homepage'].push(r);
        else if (r.sourceType === 'pagini locale') categories['pagini locale'].push(r);
        else if (r.sourceType === 'servicii animatori') categories['servicii animatori'].push(r);
        else if (r.sourceType === 'baloane/evenimente') categories['baloane/evenimente'].push(r);
        else categories['alte pagini'].push(r);
    });
    
    for (const [cat, links] of Object.entries(categories)) {
        console.log(`\n--- ${cat.toUpperCase()} (${links.length} links) ---`);
        links.forEach(l => {
            console.log(`Source: ${l.sourceUrl}`);
            console.log(`Anchor: "${l.anchorText}"`);
            console.log(`Area: ${l.area}`);
            console.log(`Rel: ${l.rel} | Visible: ${l.isVisible} | Indexable: ${l.isIndexable} | Semantic: ${l.isSemanticRelevant}`);
        });
    }
    
    console.log("\n=== OUTBOUND LOCAL LINKS FROM MAIN HUB ===");
    console.log(outboundLocal);
    
}

auditLinks().catch(console.error);
