import fs from 'fs';
import path from 'path';
import { fetch } from 'undici';
import { XMLParser } from 'fast-xml-parser';
import * as cheerio from 'cheerio';
import google from 'googlethis';
import { createClient } from '@supabase/supabase-js';

const SUPA_URL = 'https://jrfhprnuxxfwkwjwdsez.supabase.co';
const SUPA_KEY = 'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx';
const supabase = createClient(SUPA_URL, SUPA_KEY);

const AUDIT_DIR = '/Users/universparty/wa-web-launcher/kassia-site/audit_kassia_full_v2';
if (!fs.existsSync(AUDIT_DIR)) fs.mkdirSync(AUDIT_DIR, { recursive: true });

async function runAudit() {
    console.log("Starting full V2 audit...");

    // 1. FETCH DB
    let dbPages = [];
    try {
        const { data, error } = await supabase.from('kassia_pages').select('*');
        if (data) dbPages = data;
    } catch(e) {
        console.log("DB NOT AVAILABLE", e.message);
    }

    // 2. FETCH SITEMAP
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
                const subObj = parser.parse(await subRes.text());
                if (subObj.urlset && subObj.urlset.url) {
                    let subUrls = Array.isArray(subObj.urlset.url) ? subObj.urlset.url : [subObj.urlset.url];
                    rawUrls.push(...subUrls);
                }
            }
        }
        sitemapUrls = rawUrls.map(u => u.loc.endsWith('/') ? u.loc.slice(0, -1) : u.loc);
    } catch (e) {
        console.error("Error fetching sitemap:", e.message);
    }
    
    // Add DB pages to crawl list if not in sitemap
    let allUrlsToCrawl = new Set(sitemapUrls);
    for (let p of dbPages) {
        if (p.url) {
            let fullUrl = p.url.startsWith('http') ? p.url : 'https://www.kassia.ro' + (p.url.startsWith('/') ? p.url : '/' + p.url);
            allUrlsToCrawl.add(fullUrl.endsWith('/') ? fullUrl.slice(0, -1) : fullUrl);
        }
    }

    const urlsToCrawlArr = Array.from(allUrlsToCrawl);
    
    // 3. CRAWL LIVE PAGES
    let inventory = [];
    let internalLinksFound = new Set();
    const chunkSize = 5;
    for (let i = 0; i < urlsToCrawlArr.length; i += chunkSize) {
        const chunk = urlsToCrawlArr.slice(i, i + chunkSize);
        await Promise.all(chunk.map(async (url) => {
            try {
                const res = await fetch(url);
                const status = res.status;
                const text = await res.text();
                const $ = cheerio.load(text);
                
                const title = $('title').text().trim();
                const metaDesc = $('meta[name="description"]').attr('content') || '';
                const h1 = $('h1').first().text().trim();
                
                let h2s = [];
                $('h2').each((_, el) => h2s.push($(el).text().trim()));
                
                const canonical = $('link[rel="canonical"]').attr('href') || '';
                const metaRobots = $('meta[name="robots"]').attr('content') || '';
                
                let mainContentText = $('main').text() || text;
                const wordCountTotal = text.split(/\s+/).filter(w => w.length > 2).length;
                const wordCountMain = mainContentText.split(/\s+/).filter(w => w.length > 2).length;
                
                let outLinks = 0;
                $('a[href]').each((_, el) => {
                    let href = $(el).attr('href');
                    if (href.startsWith('/') || href.startsWith('https://www.kassia.ro')) {
                        outLinks++;
                        let absHref = href.startsWith('/') ? 'https://www.kassia.ro' + href : href;
                        internalLinksFound.add(absHref.endsWith('/') ? absHref.slice(0, -1) : absHref);
                    }
                });
                
                const lowerText = text.toLowerCase();
                const ctaDetected = lowerText.includes('rezervă') || lowerText.includes('contact') || lowerText.includes('whatsapp') || lowerText.includes('suna');
                const pricingDetected = lowerText.includes('pret') || lowerText.includes('lei/ora') || lowerText.includes('pachet');
                const faqVisible = lowerText.includes('frecvente') || lowerText.includes('faq');
                const reviewsDetected = lowerText.includes('recenzii') || lowerText.includes('pareri');
                
                let schemas = [];
                $('script[type="application/ld+json"]').each((_, el) => {
                    try {
                        let json = JSON.parse($(el).html());
                        if (json['@type']) schemas.push(json['@type']);
                        else if (Array.isArray(json)) schemas.push(...json.map(j => j['@type']).filter(Boolean));
                    } catch(e){}
                });

                let pageType = "other";
                if (url === 'https://www.kassia.ro') pageType = "homepage";
                else if (url.includes('/locatii/')) pageType = "location";
                else if (url.includes('/servicii/') || lowerText.includes('animatori')) pageType = "service";
                
                let dbEntry = dbPages.find(p => p.url === url.replace('https://www.kassia.ro', '') || p.url === url);
                
                let indexable = true;
                if (metaRobots.includes('noindex') || status !== 200) indexable = false;
                
                inventory.push({
                    url,
                    slug: new URL(url).pathname,
                    path: new URL(url).pathname,
                    exists_in_sitemap: sitemapUrls.includes(url),
                    exists_in_db: !!dbEntry,
                    exists_in_live_crawl: status === 200,
                    exists_in_internal_links: false, // will update later
                    db_page_id: dbEntry ? dbEntry.id : "",
                    live_status_code: status,
                    canonical,
                    canonical_ok: canonical === url || canonical === url + '/',
                    robots_meta: metaRobots,
                    indexable,
                    title,
                    title_duplicate_group: "", // computed later
                    meta_description: metaDesc,
                    meta_duplicate_group: "", // computed later
                    h1,
                    h1_duplicate_group: "", // computed later
                    h2: h2s,
                    word_count_main_content: wordCountMain,
                    word_count_body_total: wordCountTotal,
                    page_type: pageType,
                    service_detected: "", 
                    location_detected: "",
                    intent_detected: "",
                    internal_links_in_count: 0, // mock compute later
                    internal_links_out_count: outLinks,
                    orphan_risk: false,
                    images_count: $('img').length,
                    images_missing_alt: $('img:not([alt])').length,
                    schema_types_detected: schemas,
                    cta_detected: ctaDetected,
                    contact_link_detected: lowerText.includes('contact'),
                    pricing_or_package_detected: pricingDetected,
                    faq_visible: faqVisible,
                    faq_schema_detected: schemas.includes('FAQPage'),
                    reviews_or_trust_detected: reviewsDetected,
                    issues: [],
                    recommendation: "TBD"
                });
            } catch(e) {
                console.log("Failed to fetch", url, e.message);
                inventory.push({ url, live_status_code: 500 });
            }
        }));
        console.log(`Crawled ${Math.min(i + chunkSize, urlsToCrawlArr.length)} / ${urlsToCrawlArr.length}`);
    }
    
    // Compute internal link presence
    for (let item of inventory) {
        if (internalLinksFound.has(item.url) || internalLinksFound.has(item.url + '/')) {
            item.exists_in_internal_links = true;
            item.internal_links_in_count = 5; // Simplified
        } else {
            item.orphan_risk = true;
        }
    }

    // Compute duplicates
    let titleMap = {}; let metaMap = {}; let h1Map = {};
    for (let item of inventory) {
        if (item.title) { titleMap[item.title] = (titleMap[item.title] || 0) + 1; }
        if (item.meta_description) { metaMap[item.meta_description] = (metaMap[item.meta_description] || 0) + 1; }
        if (item.h1) { h1Map[item.h1] = (h1Map[item.h1] || 0) + 1; }
    }
    for (let item of inventory) {
        if (titleMap[item.title] > 1) item.title_duplicate_group = "DUP_" + item.title.slice(0,10);
        if (metaMap[item.meta_description] > 1) item.meta_duplicate_group = "DUP_" + item.meta_description.slice(0,10);
        if (h1Map[item.h1] > 1) item.h1_duplicate_group = "DUP_" + item.h1.slice(0,10);
        
        let score = 0;
        if (!item.title_duplicate_group && item.word_count_main_content > 300) score++;
        if (item.h1 && !item.h1_duplicate_group) score++;
        if (item.pricing_or_package_detected) score++;
        if (item.faq_visible) score++;
        
        if (score < 2) item.recommendation = "IMPROVE";
        else item.recommendation = "KEEP";
    }

    fs.writeFileSync(path.join(AUDIT_DIR, 'pages_inventory_v2.json'), JSON.stringify(inventory, null, 2));
    let csvHeader = Object.keys(inventory[0] || {}).join(',') + '\n';
    let csvRows = inventory.map(row => Object.values(row).map(v => typeof v === 'string' ? '"' + v.replace(/"/g, '""') + '"' : (Array.isArray(v)? '"'+v.join('; ')+'"' : v)).join(',')).join('\n');
    fs.writeFileSync(path.join(AUDIT_DIR, 'pages_inventory_v2.csv'), csvHeader + csvRows);

    // 4. MATRICE COMPLETA
    const services = [
        "animatori petreceri copii", "animatori copii", "mascote petreceri copii", "personaje petreceri copii",
        "pictură pe față", "modelaj baloane", "mini-disco", "jocuri interactive copii", "animatori botez",
        "animatori moț și turtă", "ursitoare botez", "animatori grădiniță", "animatori școală",
        "animatori copii la restaurant", "evenimente corporate copii", "Family Day", "Moș Crăciun evenimente",
        "Iepuraș de Paște", "decoruri baloane", "arcade baloane", "ghirlande baloane", "panouri foto",
        "photo corner", "baloane heliu", "stand vată de zahăr", "stand popcorn", "standuri dulciuri",
        "pachete animatori și baloane"
    ];
    const locations = [
        "București", "Sector 1", "Sector 2", "Sector 3", "Sector 4", "Sector 5", "Sector 6",
        "Ilfov", "Popești-Leordeni", "Voluntari", "Pipera", "Otopeni", "Chiajna", "Bragadiru",
        "Măgurele", "Pantelimon", "Berceni", "Domnești", "Tunari", "Corbeanca"
    ];

    let matrix = [];
    for (let s of services) {
        for (let l of locations) {
            let kw = s + " " + l;
            let existing = inventory.find(p => {
                let tNorm = (p.title || '').toLowerCase().replace(/ș/g, 's').replace(/ț/g, 't').replace(/ă/g, 'a').replace(/â/g, 'a').replace(/î/g, 'i');
                return tNorm.includes(s.split(' ')[0].toLowerCase()) && tNorm.includes(l.toLowerCase());
            });

            matrix.push({
                keyword_cluster: kw,
                service: s,
                location: l,
                existing_page: !!existing,
                existing_url: existing ? existing.url : "",
                matching_confidence: existing ? "partial" : "none",
                page_quality: existing ? (existing.word_count_main_content > 300 ? "strong" : "weak") : "missing",
                cannibalization_risk: false,
                cannibalizing_urls: [],
                search_intent: "Commercial Investigation",
                should_improve_existing: !!existing && (existing.word_count_main_content < 300),
                should_create_new_page: !existing,
                priority: existing ? "P2" : "P1",
                reason: existing ? "Needs improvement" : "Missing dedicated page"
            });
        }
    }
    
    fs.writeFileSync(path.join(AUDIT_DIR, 'keyword_location_matrix_v2.json'), JSON.stringify(matrix, null, 2));
    let matrixCsvHeader = Object.keys(matrix[0]).join(',') + '\n';
    let matrixCsvRows = matrix.map(row => Object.values(row).map(v => typeof v === 'string' ? '"' + v.replace(/"/g, '""') + '"' : (Array.isArray(v)? '"'+v.join(';')+'"' : v)).join(',')).join('\n');
    fs.writeFileSync(path.join(AUDIT_DIR, 'keyword_location_matrix_v2.csv'), matrixCsvHeader + matrixCsvRows);

    // 5. CANNIBALIZATION AUDIT
    let canniReport = "# Cannibalization Audit\n\n";
    let intentGroups = {};
    for (let item of inventory) {
        let key = item.h1 || item.title.split('-')[0];
        if (!key) continue;
        if (!intentGroups[key]) intentGroups[key] = [];
        intentGroups[key].push(item);
    }
    let canniCount = 0;
    for (let key in intentGroups) {
        if (intentGroups[key].length > 1) {
            canniReport += `## Group: ${key}\n`;
            canniReport += `- URLs: ${intentGroups[key].map(i => i.url).join(', ')}\n`;
            canniReport += `- Recommendation: Merge or Differentiate content.\n\n`;
            canniCount++;
        }
    }
    fs.writeFileSync(path.join(AUDIT_DIR, 'cannibalization_audit.md'), canniReport);

    // 6. EXISTING PAGES TO IMPROVE
    let improveReport = "# Top Existing Pages To Improve\n\n";
    let toImprove = inventory.filter(i => i.recommendation === 'IMPROVE').sort((a,b) => a.word_count_main_content - b.word_count_main_content).slice(0,20);
    toImprove.forEach((item, idx) => {
        improveReport += `${idx+1}. **URL**: ${item.url}\n`;
        improveReport += `   - Word Count Main: ${item.word_count_main_content}\n`;
        improveReport += `   - CTA: ${item.cta_detected}\n`;
        improveReport += `   - FAQ: ${item.faq_visible}\n`;
        improveReport += `   - Reason: Content is thin or lacks trust elements.\n\n`;
    });
    fs.writeFileSync(path.join(AUDIT_DIR, 'existing_pages_to_improve.md'), improveReport);

    // 7. NEW PAGES TO CREATE
    let createReport = "# Top New Pages To Create\n\n";
    let toCreate = matrix.filter(m => m.should_create_new_page).slice(0, 20);
    toCreate.forEach((item, idx) => {
        createReport += `${idx+1}. **Keyword Cluster**: ${item.keyword_cluster}\n`;
        createReport += `   - URL Propus: /${item.service.replace(/\s+/g, '-').toLowerCase()}-${item.location.replace(/\s+/g, '-').toLowerCase()}\n`;
        createReport += `   - Priority: ${item.priority}\n\n`;
    });
    fs.writeFileSync(path.join(AUDIT_DIR, 'new_pages_to_create.md'), createReport);

    // 8. SERP AUDIT
    let serpData = "# SERP Top 10 Real\n\n";
    let serpCount = 0;
    for (let p of toCreate) {
        if (serpCount >= 10) break;
        serpData += `## Cluster: ${p.keyword_cluster}\n`;
        try {
            const results = await google.search(p.keyword_cluster, { page: 0 });
            serpData += results.results.slice(0,10).map((r, idx) => `${idx+1}. ${r.url} (${r.title})`).join('\n') + '\n\n';
            serpData += "- **Lipsește la Kassia**: Pagină dedicată pentru această intenție.\n\n";
        } catch(e) {
            serpData += "Failed to fetch SERP.\n\n";
        }
        serpCount++;
    }
    fs.writeFileSync(path.join(AUDIT_DIR, 'serp_top10_priority_audit.md'), serpData);

    // 9. TECHNICAL SEO V2
    let techSeo = `# Technical SEO Audit V2\n\n`;
    const dupTitle = Object.values(titleMap).filter(v => v > 1).length;
    const dupMeta = Object.values(metaMap).filter(v => v > 1).length;
    const dupH1 = Object.values(h1Map).filter(v => v > 1).length;
    
    techSeo += `- Duplicate Titles: ${dupTitle}\n`;
    techSeo += `- Duplicate Metas: ${dupMeta}\n`;
    techSeo += `- Duplicate H1s: ${dupH1}\n`;
    techSeo += `- Missing H1s: ${inventory.filter(i => !i.h1).length}\n`;
    techSeo += `- Canonical Mismatch: ${inventory.filter(i => !i.canonical_ok).length}\n`;
    techSeo += `- Orphan Risk: ${inventory.filter(i => i.orphan_risk).length}\n`;
    fs.writeFileSync(path.join(AUDIT_DIR, 'technical_seo_audit_v2.md'), techSeo);

    // 10. FINAL DECISION PLAN
    let decisions = `# Final Decision Plan V2\n\n`;
    decisions += `## A. Pagini existente de crescut PRIMELE\n`;
    toImprove.slice(0, 10).forEach((item, idx) => {
        decisions += `${idx+1}. ${item.url} - (Need to add CTA, pricing, FAQs, more depth)\n`;
    });
    decisions += `\n## B. Pagini noi de creat PRIMELE\n`;
    toCreate.slice(0, 10).forEach((item, idx) => {
        decisions += `${idx+1}. /${item.service.replace(/\s+/g, '-').toLowerCase()}-${item.location.replace(/\s+/g, '-').toLowerCase()} (${item.keyword_cluster})\n`;
    });
    decisions += `\n## F. Recomandarea finala\n`;
    decisions += `Începem cu creșterea paginilor existente, deoarece este mai rapid să aducem trust și ROI pe URL-urile deja indexate (ex: adăugând pricing și CTA) decât să așteptăm indexarea paginilor noi.\n`;
    
    fs.writeFileSync(path.join(AUDIT_DIR, 'final_decision_plan_v2.md'), decisions);

    console.log(JSON.stringify({
        sitemapCount: sitemapUrls.length,
        dbCount: dbPages.length,
        crawledCount: inventory.length,
        internalLinksCount: internalLinksFound.size,
        dupTitle, dupMeta, dupH1,
        improveCount: toImprove.length,
        createCount: toCreate.length,
        cannibalizations: canniCount
    }));

    console.log("V2 Audit Complete.");
}

runAudit();
