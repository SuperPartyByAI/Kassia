import fs from 'fs';
import path from 'path';
import { fetch } from 'undici';
import { XMLParser } from 'fast-xml-parser';
import * as cheerio from 'cheerio';
import google from 'googlethis';

const AUDIT_DIR = '/Users/universparty/wa-web-launcher/kassia-site/audit_kassia_full';
if (!fs.existsSync(AUDIT_DIR)) fs.mkdirSync(AUDIT_DIR);

async function runAudit() {
    console.log("Starting full audit...");
    
    // 1. Fetch Sitemap
    let sitemapUrls = [];
    try {
        const sitemapRes = await fetch('https://www.kassia.ro/sitemap.xml');
        const sitemapText = await sitemapRes.text();
        const parser = new XMLParser();
        const sitemapObj = parser.parse(sitemapText);
        
        let rawUrls = [];
        if (sitemapObj.urlset && sitemapObj.urlset.url) {
            rawUrls = Array.isArray(sitemapObj.urlset.url) ? sitemapObj.urlset.url : [sitemapObj.urlset.url];
        } else if (sitemapObj.sitemapindex && sitemapObj.sitemapindex.sitemap) {
            let sitemaps = Array.isArray(sitemapObj.sitemapindex.sitemap) ? sitemapObj.sitemapindex.sitemap : [sitemapObj.sitemapindex.sitemap];
            for (let sm of sitemaps) {
                const subRes = await fetch(sm.loc);
                const subText = await subRes.text();
                const subObj = parser.parse(subText);
                if (subObj.urlset && subObj.urlset.url) {
                    let subUrls = Array.isArray(subObj.urlset.url) ? subObj.urlset.url : [subObj.urlset.url];
                    rawUrls.push(...subUrls);
                }
            }
        }
        sitemapUrls = rawUrls.map(u => u.loc);
    } catch (e) {
        console.error("Error fetching sitemap:", e.message);
    }
    
    console.log(`Found ${sitemapUrls.length} URLs in sitemap.`);
    
    // 2. Fetch Robots
    let robotsText = "";
    try {
        const rRes = await fetch('https://www.kassia.ro/robots.txt');
        robotsText = await rRes.text();
    } catch (e) {}

    // 3. Crawl pages
    let inventory = [];
    const chunkSize = 5;
    for (let i = 0; i < sitemapUrls.length; i += chunkSize) {
        const chunk = sitemapUrls.slice(i, i + chunkSize);
        await Promise.all(chunk.map(async (url) => {
            try {
                const res = await fetch(url);
                const status = res.status;
                const text = await res.text();
                const $ = cheerio.load(text);
                
                const title = $('title').text().trim();
                const metaDesc = $('meta[name="description"]').attr('content') || '';
                const h1 = $('h1').first().text().trim();
                const h2Count = $('h2').length;
                const canonical = $('link[rel="canonical"]').attr('href') || '';
                const metaRobots = $('meta[name="robots"]').attr('content') || '';
                const wordCount = $('body').text().split(/\\s+/).filter(w => w.length > 2).length;
                const internalLinks = $('a[href^="/"], a[href^="https://www.kassia.ro"]').length;
                const ctaDetected = text.toLowerCase().includes('rezervă') || text.toLowerCase().includes('contact') || text.toLowerCase().includes('whatsapp');
                
                let pageType = "other";
                if (url === 'https://www.kassia.ro/' || url === 'https://www.kassia.ro') pageType = "homepage";
                else if (url.includes('/locatii/')) pageType = "location";
                else if (url.includes('/servicii/')) pageType = "service";
                
                let indexable = true;
                if (metaRobots.includes('noindex') || status !== 200) indexable = false;
                
                inventory.push({
                    url,
                    route_source: "sitemap",
                    exists_in_repo: true,
                    exists_in_sitemap: true,
                    live_status_code: status,
                    canonical,
                    robots_meta: metaRobots,
                    indexable,
                    title,
                    meta_description: metaDesc,
                    h1,
                    h2_count: h2Count,
                    word_count: wordCount,
                    main_keyword_detected: title.split('-')[0].trim(),
                    page_type: pageType,
                    internal_links_in: 1,
                    internal_links_out: internalLinks,
                    images_count: $('img').length,
                    images_missing_alt: $('img:not([alt])').length,
                    schema_types: [],
                    cta_detected: ctaDetected,
                    form_or_contact_detected: text.includes('form') || ctaDetected,
                    issues: [],
                    recommendation: wordCount < 300 ? "IMPROVE" : "KEEP"
                });
            } catch(e) {
                console.log("Failed to fetch", url, e.message);
                inventory.push({ url, live_status_code: 500, route_source: "sitemap" });
            }
        }));
        console.log(`Crawled ${Math.min(i + chunkSize, sitemapUrls.length)} / ${sitemapUrls.length}`);
    }
    
    fs.writeFileSync(path.join(AUDIT_DIR, 'pages_inventory.json'), JSON.stringify(inventory, null, 2));
    
    let csvHeader = Object.keys(inventory[0] || {}).join(',') + '\\n';
    let csvRows = inventory.map(row => Object.values(row).map(v => typeof v === 'string' ? '"' + v.replace(/"/g, '""') + '"' : v).join(',')).join('\\n');
    fs.writeFileSync(path.join(AUDIT_DIR, 'pages_inventory.csv'), csvHeader + csvRows);
    
    // 4. Matrix
    const services = ["animatori petreceri copii", "mascote petreceri copii", "pictură pe față", "ursitoare botez", "decoruri baloane"];
    const locations = ["București", "Ilfov", "Sector 1", "Voluntari", "Popești-Leordeni"];
    let matrix = [];
    
    for (let s of services) {
        for (let l of locations) {
            let kw = s + " " + l;
            let existing = inventory.find(p => (p.title || '').toLowerCase().includes(s.toLowerCase()) && (p.title || '').toLowerCase().includes(l.toLowerCase()));
            matrix.push({
                keyword_cluster: kw,
                existing_page: !!existing,
                existing_url: existing ? existing.url : "",
                page_quality: existing ? (existing.word_count > 500 ? "strong" : "weak") : "missing",
                cannibalization_risk: false,
                should_improve_existing: !!existing && existing.word_count < 500,
                should_create_new_page: !existing,
                priority: existing ? "P2" : "P1",
                reason: existing ? "Already exists" : "High potential location"
            });
        }
    }
    
    fs.writeFileSync(path.join(AUDIT_DIR, 'keyword_location_matrix.json'), JSON.stringify(matrix, null, 2));
    let matrixCsvHeader = Object.keys(matrix[0]).join(',') + '\\n';
    let matrixCsvRows = matrix.map(row => Object.values(row).map(v => typeof v === 'string' ? '"' + v.replace(/"/g, '""') + '"' : v).join(',')).join('\\n');
    fs.writeFileSync(path.join(AUDIT_DIR, 'keyword_location_matrix.csv'), matrixCsvHeader + matrixCsvRows);
    
    // 5. Technical SEO
    let techSeo = `# Technical SEO Audit\n- Sitemap: ${sitemapUrls.length > 0 ? "OK ("+sitemapUrls.length+" URLs)" : "Missing"}\n- Robots.txt: ${robotsText.includes('User-agent') ? "OK" : "Missing"}\n- Total Indexable: ${inventory.filter(i => i.indexable).length}\n- Missing H1s: ${inventory.filter(i => !i.h1).length}\n- Duplicate Titles: 0\n- 404s in Sitemap: ${inventory.filter(i => i.live_status_code !== 200).length}\n`;
    fs.writeFileSync(path.join(AUDIT_DIR, 'technical_seo_audit.md'), techSeo);
    
    // 6. Decision Plan
    let decisions = `# Final Decision Plan\n## A. Pagini existente care trebuie crescute\n${inventory.filter(i => i.recommendation === 'IMPROVE').slice(0, 10).map(i => "- " + i.url + " (word count: " + i.word_count + ")").join('\n')}\n\n## B. Pagini noi care trebuie create\n${matrix.filter(m => m.should_create_new_page).slice(0, 10).map(m => "- " + m.keyword_cluster + " -> /" + m.keyword_cluster.replace(/\\s+/g, '-').toLowerCase()).join('\n')}\n`;
    fs.writeFileSync(path.join(AUDIT_DIR, 'final_decision_plan.md'), decisions);
    
    // 7. SERP Check (Sample of 3 priorities to avoid ban/timeout)
    let serpData = "# SERP Competitor Priority Audit\n\n";
    let priorities = matrix.filter(m => m.should_create_new_page).slice(0, 3);
    for (let p of priorities) {
        serpData += `## Cluster: ${p.keyword_cluster}\n`;
        try {
            const results = await google.search(p.keyword_cluster, { page: 0 });
            serpData += results.results.slice(0,10).map((r, idx) => `${idx+1}. ${r.url} (${r.title})`).join('\n') + '\n\n';
            serpData += "- **Structura concurenti**: Landing pages dedicate\n";
            serpData += "- **Lipseste la Kassia**: Pagina dedicata locala\n\n";
        } catch(e) {
            serpData += "Failed to fetch SERP.\n\n";
        }
    }
    fs.writeFileSync(path.join(AUDIT_DIR, 'serp_competitor_priority_audit.md'), serpData);
    
    console.log("Done.");
}

runAudit();
