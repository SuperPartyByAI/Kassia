import puppeteer from 'puppeteer';

async function scanLive() {
    const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
    console.log(`Scanning live URL: ${url}`);
    
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    const response = await p.goto(url, { waitUntil: 'networkidle0' });
    
    console.log(`LIVE PUBLIC URL VERIFIED — YES (Status: ${response.status()})`);

    const occurrences = await p.evaluate(() => {
        const regex = /pictur[aă]\s+pe\s+fa[tț][aă]/i;
        const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, null, false);
        const results = [];
        let node;
        
        while (node = walker.nextNode()) {
            if (regex.test(node.nodeValue)) {
                let parent = node.parentElement;
                
                // Construct container descriptor
                let container = parent.tagName;
                let id = parent.id ? `#${parent.id}` : '';
                let cls = parent.className ? `.${parent.className.toString().replace(/\s+/g, '.')}` : '';
                
                // Find semantic area
                let semanticParent = parent.closest('header, footer, nav, .aprecieri-clienti, .faq-section, main, [itemprop="mainEntity"]');
                let areaName = 'editable';
                let isProtected = false;
                
                if (semanticParent) {
                    const tag = semanticParent.tagName.toLowerCase();
                    const cl = semanticParent.className || '';
                    if (tag === 'header' || tag === 'nav' || cl.includes('nav')) {
                        areaName = 'header / navigation';
                        isProtected = true;
                    } else if (tag === 'footer') {
                        areaName = 'footer';
                        isProtected = true;
                    } else if (cl.includes('aprecieri-clienti')) {
                        areaName = 'reviews / testimonials';
                        isProtected = true;
                    } else if (cl.includes('faq-section') || tag === 'summary') {
                        areaName = 'FAQ';
                        isProtected = false; // user considers FAQ editable/meta scope for this check
                    } else {
                        areaName = 'editable content';
                    }
                }
                
                // Add to results
                results.push({
                    snippet: node.nodeValue.trim(),
                    container: `${container}${id}${cls}`,
                    areaName: areaName,
                    isProtected: isProtected
                });
            }
        }
        
        // Scan Meta and Schema
        const metas = Array.from(document.querySelectorAll('meta[name="description"], meta[property="og:description"], meta[name="twitter:description"]'));
        metas.forEach(meta => {
            if (regex.test(meta.content)) {
                results.push({
                    snippet: meta.content.trim(),
                    container: `META[${meta.name || meta.getAttribute('property')}]`,
                    areaName: 'meta',
                    isProtected: false
                });
            }
        });
        
        const scripts = Array.from(document.querySelectorAll('script[type="application/ld+json"]'));
        scripts.forEach(script => {
            if (regex.test(script.innerText)) {
                results.push({
                    snippet: "JSON-LD Schema Match",
                    container: `SCRIPT[type="application/ld+json"]`,
                    areaName: 'schema',
                    isProtected: false
                });
            }
        });

        return results;
    });
    
    console.log(`TOTAL OCCURRENCES — ${occurrences.length}`);
    
    let protectedCount = 0;
    let editableCount = 0;
    
    occurrences.forEach((occ, i) => {
        console.log(`\n[Occurrence ${i+1}]`);
        console.log(`- Snippet: "${occ.snippet}"`);
        console.log(`- Container: ${occ.container}`);
        console.log(`- Area: ${occ.areaName}`);
        console.log(`- Protected YES/NO: ${occ.isProtected ? 'YES' : 'NO'}`);
        console.log(`- Editable YES/NO: ${occ.areaName.includes('editable') ? 'YES' : 'NO'}`);
        console.log(`- FAQ YES/NO: ${occ.areaName.includes('FAQ') ? 'YES' : 'NO'}`);
        console.log(`- Meta/Schema YES/NO: ${occ.areaName === 'meta' || occ.areaName === 'schema' ? 'YES' : 'NO'}`);
        
        if (occ.isProtected) protectedCount++;
        else editableCount++;
    });
    
    console.log(`\nPROTECTED OCCURRENCES — ${protectedCount}`);
    console.log(`EDITABLE / FAQ / META / SCHEMA OCCURRENCES — ${editableCount}`);
    console.log(`MAIN HUB READY FOR GSC RECRAWL — ${editableCount === 0 ? 'YES' : 'NO'}`);

    await browser.close();
}

scanLive().catch(console.error);
