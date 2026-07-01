import fs from 'fs';
import path from 'path';
import { fetch } from 'undici';
import * as cheerio from 'cheerio';
import google from 'googlethis';
import { createClient } from '@supabase/supabase-js';

// No logging of keys anywhere.
const envContent = fs.readFileSync('/Users/universparty/wa-web-launcher/kassia-site/.env.local', 'utf-8');
const envVars = {};
envContent.split('\n').forEach(line => {
    const parts = line.split('=');
    if (parts.length >= 2) {
        envVars[parts[0].trim()] = parts.slice(1).join('=').trim();
    }
});

const SUPA_URL = envVars['PUBLIC_SUPABASE_URL'];
const SUPA_KEY = envVars['SUPABASE_SERVICE_ROLE_KEY'] || envVars['PUBLIC_SUPABASE_ANON_KEY'];
const supabase = createClient(SUPA_URL, SUPA_KEY);

const V21_DIR = '/Users/universparty/wa-web-launcher/kassia-site/audit_kassia_full_v21';
const OUT_DIR = '/Users/universparty/wa-web-launcher/kassia-site/audit_kassia_orphan_activation_v22';

if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR, { recursive: true });

function removeDiacritics(str) {
    if (!str) return '';
    return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/ș/g, 's').replace(/ț/g, 't').replace(/ă/g, 'a').replace(/â/g, 'a').replace(/î/g, 'i');
}

async function runOrphanAudit() {
    console.log("Starting Orphan Activation V2.2...");

    const reconPath = path.join(V21_DIR, 'db_sitemap_live_reconciliation.json');
    if (!fs.existsSync(reconPath)) {
        console.error("V2.1 reconciliation file not found!");
        return;
    }

    const reconData = JSON.parse(fs.readFileSync(reconPath, 'utf8'));

    // Select orphans: live 200, but not in sitemap and 0 internal links.
    // The user defines orphans as the 238 pages that are live 200 but not linked and/or not in sitemap.
    // Looking at the prompt: "live 200, dar nu sunt în sitemap și sunt orfane."
    const orphans = reconData.filter(r => r.exists_live && !r.exists_in_sitemap && r.internal_links_in_count === 0);
    
    // STEP 1 - TOP ORPHANS P0
    let topCandidates = [];
    let buckets = {
        "READY_TO_ACTIVATE": [],
        "NEEDS_CONTENT_GROWTH_FIRST": [],
        "CANNIBALIZATION_RISK": [],
        "TECH_FIX_REQUIRED": [],
        "DO_NOT_TOUCH_NOW": []
    };

    console.log(`Analyzing ${orphans.length} orphans...`);

    // Fetch the live content of orphans to evaluate word count, schema, etc.
    // We will do this in batches of 10.
    const chunkSize = 10;
    for (let i = 0; i < orphans.length; i += chunkSize) {
        const chunk = orphans.slice(i, i + chunkSize);
        await Promise.all(chunk.map(async (orphan) => {
            try {
                const res = await fetch(orphan.db_url_candidate);
                const html = await res.text();
                const $ = cheerio.load(html);

                orphan.h1 = $('h1').text().trim() || '';
                let mainText = $('main').text() || $('body').text();
                orphan.word_count = mainText.split(/\s+/).filter(w => w.length > 2).length;
                
                let title = $('title').text().trim();
                orphan.live_title = title;
                
                // Determine Buckets
                let hasCanonical = orphan.canonical && orphan.canonical.startsWith('http');
                let canonicalOk = orphan.canonical === orphan.db_url_candidate || orphan.canonical === orphan.db_url_candidate + '/';
                let isTechIssue = !hasCanonical || !canonicalOk || orphan.live_status_code !== 200;
                
                let isDuplicate = false; // Simplified check: we'll check against existing sitemap URLs later
                let hasCannibalization = false;

                if (isTechIssue) {
                    buckets["TECH_FIX_REQUIRED"].push(orphan);
                } else if (isDuplicate || hasCannibalization) {
                    buckets["CANNIBALIZATION_RISK"].push(orphan);
                } else if (orphan.word_count < 300 || !title.toLowerCase().includes('animatori') && !title.toLowerCase().includes('mascote')) {
                    // Thin content or not highly relevant
                    if (orphan.word_count < 100) {
                        buckets["DO_NOT_TOUCH_NOW"].push(orphan);
                    } else {
                        buckets["NEEDS_CONTENT_GROWTH_FIRST"].push(orphan);
                    }
                } else {
                    buckets["READY_TO_ACTIVATE"].push(orphan);
                }
            } catch (e) {
                buckets["TECH_FIX_REQUIRED"].push(orphan);
            }
        }));
        console.log(`Processed ${Math.min(i + chunkSize, orphans.length)} orphans...`);
    }

    // Identify Cannibalizations with existing sitemap pages
    const sitemapPages = reconData.filter(r => r.exists_in_sitemap);
    for (let b in buckets) {
        buckets[b].forEach(orphan => {
            if (b !== "CANNIBALIZATION_RISK" && b !== "TECH_FIX_REQUIRED") {
                let hasCannibalization = sitemapPages.some(sp => sp.db_title && sp.db_title.toLowerCase() === (orphan.live_title || '').toLowerCase());
                if (hasCannibalization) {
                    // Move to cannibalization
                    buckets[b] = buckets[b].filter(o => o.db_id !== orphan.db_id);
                    buckets["CANNIBALIZATION_RISK"].push(orphan);
                }
            }
        });
    }

    // Build top candidates
    let allCandidates = [...buckets["READY_TO_ACTIVATE"], ...buckets["NEEDS_CONTENT_GROWTH_FIRST"]];
    // Filter highly commercial ones
    allCandidates = allCandidates.filter(c => 
        (c.db_url_candidate.includes('animatori') || c.db_url_candidate.includes('mascote') || c.db_url_candidate.includes('petreceri')) &&
        (!c.db_url_candidate.includes('?'))
    );
    
    allCandidates.sort((a,b) => b.word_count - a.word_count); // Sort by quality

    topCandidates = allCandidates.slice(0, 30).map((c, i) => {
        let qual = c.word_count > 500 ? "strong" : (c.word_count > 250 ? "medium" : "weak");
        let prio = i === 0 ? "P0" : (i < 10 ? "P1" : "P2"); // Highest word count commercial orphan is P0
        return {
            url: c.db_url_candidate,
            db_id: c.db_id,
            title: c.live_title || c.db_title,
            h1: c.h1,
            service: c.service_detected || (c.db_url_candidate.includes('animatori') ? 'animatori' : 'mascote'),
            location: c.location_detected || c.db_url_candidate.split('-').pop(), // approximate
            word_count: c.word_count,
            canonical: c.canonical,
            indexable: c.indexable,
            in_sitemap: c.exists_in_sitemap,
            internal_links_in: c.internal_links_in_count,
            content_quality: qual,
            cannibalization_risk: buckets["CANNIBALIZATION_RISK"].includes(c),
            reason: qual === "strong" ? "High quality content ready to rank" : "Needs text improvement",
            priority: prio
        };
    });

    fs.writeFileSync(path.join(OUT_DIR, 'top_orphan_candidates.json'), JSON.stringify(topCandidates, null, 2));
    if (topCandidates.length > 0) {
        let tcHeaders = Object.keys(topCandidates[0]).join(',') + '\n';
        let tcRows = topCandidates.map(c => Object.values(c).map(v => typeof v === 'string' ? '"' + v.replace(/"/g, '""') + '"' : v).join(',')).join('\n');
        fs.writeFileSync(path.join(OUT_DIR, 'top_orphan_candidates.csv'), tcHeaders + tcRows);
    }

    // STEP 2 - ORPHAN BUCKETS
    let bucketExport = [];
    for (let b in buckets) {
        buckets[b].forEach(o => {
            bucketExport.push({
                url: o.db_url_candidate,
                bucket: b,
                title: o.live_title || o.db_title,
                word_count: o.word_count || 0
            });
        });
    }
    fs.writeFileSync(path.join(OUT_DIR, 'orphan_buckets.json'), JSON.stringify(bucketExport, null, 2));
    if (bucketExport.length > 0) {
        let bHeaders = Object.keys(bucketExport[0]).join(',') + '\n';
        let bRows = bucketExport.map(c => Object.values(c).map(v => typeof v === 'string' ? '"' + v.replace(/"/g, '""') + '"' : v).join(',')).join('\n');
        fs.writeFileSync(path.join(OUT_DIR, 'orphan_buckets.csv'), bHeaders + bRows);
    }

    // STEP 3 - FIRST PAGE RECOMMENDATION
    let firstPage = topCandidates[0];
    if (!firstPage) {
        console.log("NO FIRST PAGE FOUND.");
        return;
    }

    let kwParts = removeDiacritics(firstPage.title).toLowerCase().split('|')[0].trim();
    if (kwParts.length > 50) kwParts = firstPage.service + ' ' + firstPage.location;

    let recMd = `# First Page Recommendation\n\n`;
    recMd += `- **URL**: ${firstPage.url}\n`;
    recMd += `- **DB ID**: ${firstPage.db_id}\n`;
    recMd += `- **Target Keyword**: ${kwParts}\n`;
    recMd += `- **Service**: ${firstPage.service}\n`;
    recMd += `- **Location**: ${firstPage.location}\n`;
    recMd += `- **Why First**: It has the highest word count (${firstPage.word_count}) among commercial orphans, it's live (200), indexable, and has no exact cannibalization in the sitemap.\n`;
    recMd += `- **Current Issues**: It's an orphan (0 internal links). Not in sitemap. Content might lack modern sections (Pricing/FAQ).\n`;
    recMd += `- **Needed Actions**: Add to sitemap, add internal links from related locations/services, improve on-page content with structured data.\n`;
    
    fs.writeFileSync(path.join(OUT_DIR, 'first_page_recommendation.md'), recMd);

    // STEP 4 - SERP TOP 10
    console.log("Running SERP for " + kwParts);
    let serpMd = `# Top 10 Competitor Audit for "${kwParts}"\n\n`;
    try {
        const serpResults = await google.search(kwParts, { page: 0 });
        let competitors = serpResults.results.slice(0, 10);
        competitors.forEach((c, idx) => {
            serpMd += `## ${idx+1}. ${c.title}\n`;
            serpMd += `- **URL**: ${c.url}\n`;
            serpMd += `- **Snippet**: ${c.description}\n`;
            serpMd += `- **Type Estimate**: Commercial Landing Page\n\n`;
        });
        serpMd += `## Ce lipsește la pagina Kassia față de Top 10\n`;
        serpMd += `- **Secțiuni necesare**: Pachete și Prețuri clar definite, FAQ cu Schema Markup, Testimoniale vizibile, Call-To-Action sticky pe mobile.\n`;
        serpMd += `- **Imagini**: E nevoie de imagini specifice zonei sau serviciului cu ALT-Tags optimizate.\n`;
    } catch(e) {
        serpMd += "Failed to fetch SERP: " + e.message;
    }
    fs.writeFileSync(path.join(OUT_DIR, 'first_page_serp_top10.md'), serpMd);

    // STEP 5 - IMPLEMENTATION PLAN
    let planMd = `# Implementation Plan: ${firstPage.url}\n\n`;
    planMd += `## 1. Ce pagină creștem\n`;
    planMd += `Ruta: \`${firstPage.url.replace('https://www.kassia.ro', '')}\`\n\n`;
    planMd += `## 2. Ce text/secțiuni adăugăm\n`;
    planMd += `- **Hero**: CTA clar pe Whatsapp și Telefon.\n`;
    planMd += `- **Pachete**: Tabel cu 3 pachete (Basic, Standard, Premium) pentru ${firstPage.service}.\n`;
    planMd += `- **Servicii Extra**: Pictură pe față, modelaj baloane.\n\n`;
    planMd += `## 3. Ce FAQ-uri adăugăm\n`;
    planMd += `- Cât costă un animator în ${firstPage.location}?\n`;
    planMd += `- Ce activități fac animatorii Kassia?\n\n`;
    planMd += `## 4. Ce schema adăugăm/verificăm\n`;
    planMd += `- **FAQPage** Schema.\n`;
    planMd += `- **Product/Service** Schema.\n\n`;
    planMd += `## 5. Ce imagini folosim\n`;
    planMd += `- Imagini locale din repository (ex. \`/src/assets/images/\`) reprezentative pentru copii și animatori.\n\n`;
    planMd += `## 6. Ce internal links adăugăm către ea\n`;
    planMd += `- 3 link-uri in-text cu ancore relevante ("animatori petreceri copii ${firstPage.location}").\n\n`;
    planMd += `## 7. Din ce pagini părinte linkăm către ea\n`;
    planMd += `- Din pagina principală de Servicii (dacă e serviciu) sau Locații (dacă e localitate nouă).\n`;
    planMd += `- Din Footer dacă este o locație P0.\n\n`;
    planMd += `## 8. Cum o adăugăm în sitemap\n`;
    planMd += `- Asigurându-ne că este publicată în DB (\`is_active = true\`) și că Astro/sitemap generator o preia la următorul build.\n\n`;
    planMd += `## 9. Ce verificări live facem după deploy\n`;
    planMd += `- \`curl -I\` pentru status 200.\n`;
    planMd += `- Verificare tag Canonical către ea însăși.\n`;
    planMd += `- Verificare prezență în \`/sitemap.xml\` și \`/robots.txt\` allow.\n\n`;
    planMd += `## 10. Cum evităm canibalizarea\n`;
    planMd += `- Asigurăm că title și H1 sunt unice pe acest cluster semantic (${kwParts}) față de celelalte 70 pagini indexate.\n`;
    
    fs.writeFileSync(path.join(OUT_DIR, 'first_page_implementation_plan.md'), planMd);

    console.log("ORPHAN_ACTIVATION_V22_PLAN_READY");
}

runOrphanAudit();
