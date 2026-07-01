import puppeteer from 'puppeteer';
import fs from 'fs';

async function auditSitemap() {
    console.log("Starting Sitemap-wide Internal Link Audit...");
    const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
    const p = await browser.newPage();
    
    console.log("Fetching sitemap.xml...");
    const sitemapUrl = 'https://www.kassia.ro/sitemap.xml';
    
    let urlsToScan = [];
    try {
        const res = await fetch(sitemapUrl);
        const xmlText = await res.text();
        const matches = xmlText.match(/<loc>(.*?)<\/loc>/g);
        if (matches) {
            urlsToScan = matches.map(m => m.replace(/<\/?loc>/g, '').trim());
        }
    } catch(e) {
        console.log("Failed to fetch sitemap:", e.message);
    }
    
    urlsToScan = urlsToScan.filter(u => u.includes('kassia.ro'));
    console.log(`Found ${urlsToScan.length} URLs in sitemap.`);
    
    const TARGET_URL = '/animatori-petreceri-copii/';
    const finalReport = [];
    
    for (let i = 0; i < urlsToScan.length; i++) {
        const url = urlsToScan[i];
        console.log(`[${i+1}/${urlsToScan.length}] Scanning: ${url}`);
        try {
            const response = await p.goto(url, { waitUntil: 'networkidle2', timeout: 15000 });
            const status_code = response.status();
            
            const data = await p.evaluate((targetUrl, currentUrl) => {
                let robotsMeta = 'none';
                const robotsEl = document.querySelector('meta[name="robots"]');
                if (robotsEl) robotsMeta = robotsEl.content;
                
                let canonical = 'none';
                const canonicalEl = document.querySelector('link[rel="canonical"]');
                if (canonicalEl) canonical = canonicalEl.href;
                
                const isNoindex = robotsMeta.toLowerCase().includes('noindex');
                const isCanonicalMatch = canonical === currentUrl || canonical === currentUrl.replace(/\/$/, '') || canonical === currentUrl + '/';
                const indexable_final = (!isNoindex && isCanonicalMatch);
                
                const links = document.querySelectorAll(`a[href*="${targetUrl}"]`);
                const extractedLinks = [];
                
                links.forEach(a => {
                    let area = 'body contextual';
                    let isContextual = true;
                    
                    if (a.closest('header')) { area = 'header'; isContextual = false; }
                    else if (a.closest('.mobile-menu-drawer') || a.closest('.mobile-nav') || a.closest('.mobile-menu-links')) { area = 'mobile nav'; isContextual = false; }
                    else if (a.closest('nav') || a.closest('.dropdown-menu')) { area = 'header'; isContextual = false; }
                    else if (a.closest('footer')) { area = 'footer'; isContextual = false; }
                    else if (a.closest('.card') || a.closest('.pachet-card')) { area = 'card'; isContextual = false; }
                    else if (a.closest('.breadcrumb')) { area = 'breadcrumb'; isContextual = false; }
                    
                    const anchor_text = a.innerText.trim() || a.getAttribute('aria-label') || 'IMG/Empty';
                    const parentText = (a.parentElement && a.parentElement.innerText) ? a.parentElement.innerText.toLowerCase() : '';
                    
                    let semantic_reason = "Generic Link";
                    if (anchor_text.toLowerCase().includes('animator') || anchor_text.toLowerCase().includes('petrece')) {
                        semantic_reason = "Anchor keyword match";
                    } else if (parentText.includes('animator') || parentText.includes('petrece')) {
                        semantic_reason = "Parent block keyword match";
                    } else if (area === 'header' || area === 'footer' || area === 'mobile nav') {
                        semantic_reason = "Site navigation";
                    } else {
                        semantic_reason = "No direct context";
                    }
                    
                    let visible = true;
                    if (a.offsetParent === null) {
                        // might be hidden mobile menu
                        visible = false;
                        if (area === 'mobile nav') visible = true; // functionally visible on mobile
                    }
                    
                    extractedLinks.push({
                        anchor_text,
                        area,
                        rel: a.getAttribute('rel') || 'follow',
                        visible_yes_no: visible ? 'YES' : 'NO',
                        semantic_relevance_reason: semantic_reason,
                        is_contextual_body_link_yes_no: isContextual ? 'YES' : 'NO'
                    });
                });
                
                return {
                    robots_meta: robotsMeta,
                    canonical: canonical,
                    indexable_final_yes_no: indexable_final ? 'YES' : 'NO',
                    links: extractedLinks
                };
            }, TARGET_URL, url);
            
            if (data.links.length > 0) {
                data.links.forEach(l => {
                    finalReport.push({
                        source_url: url,
                        status_code,
                        robots_meta: data.robots_meta,
                        canonical: data.canonical,
                        indexable_final_yes_no: (status_code === 200 && data.indexable_final_yes_no === 'YES') ? 'YES' : 'NO',
                        target_link_found_yes_no: 'YES',
                        ...l
                    });
                });
            } else {
                finalReport.push({
                    source_url: url,
                    status_code,
                    robots_meta: data.robots_meta,
                    canonical: data.canonical,
                    indexable_final_yes_no: (status_code === 200 && data.indexable_final_yes_no === 'YES') ? 'YES' : 'NO',
                    target_link_found_yes_no: 'NO',
                    anchor_text: '-',
                    area: '-',
                    rel: '-',
                    visible_yes_no: '-',
                    semantic_relevance_reason: '-',
                    is_contextual_body_link_yes_no: '-'
                });
            }
        } catch(e) {
            console.error(`Error on ${url}:`, e.message);
        }
    }
    
    await browser.close();
    
    let mdOutput = `# KASSIA INTERNAL LINK AUDIT (Sitemap-wide)\n\n`;
    mdOutput += `| Source URL | Status | Robots | Canonical | Indexable | Target Found | Anchor Text | Area | Rel | Visible | Semantic Relevance | Contextual Body |\n`;
    mdOutput += `|---|---|---|---|---|---|---|---|---|---|---|---|\n`;
    
    finalReport.forEach(r => {
        mdOutput += `| ${r.source_url} | ${r.status_code} | ${r.robots_meta} | ${r.canonical} | ${r.indexable_final_yes_no} | ${r.target_link_found_yes_no} | ${r.anchor_text.replace(/\|/g, '-').replace(/\n/g, ' ')} | ${r.area} | ${r.rel} | ${r.visible_yes_no} | ${r.semantic_relevance_reason} | ${r.is_contextual_body_link_yes_no} |\n`;
    });
    
    fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/internal_links_table.md', mdOutput);
    console.log("Audit complete. Saved to internal_links_table.md");
}

auditSitemap().catch(console.error);
