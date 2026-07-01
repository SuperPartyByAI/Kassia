import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import { google } from 'googleapis';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '/Users/universparty/wa-web-launcher/kassia-site/.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
    realtime: {
        transport: WebSocket
    }
});

const legacyUrls = [
    "https://www.kassia.ro/animatori-copii-sector-1/",
    "https://www.kassia.ro/animatori-copii-sector-2/",
    "https://www.kassia.ro/animatori-copii-sector-3/",
    "https://www.kassia.ro/animatori-copii-sector-4/",
    "https://www.kassia.ro/animatori-copii-sector-5/",
    "https://www.kassia.ro/animatori-copii-sector-6/",
    "https://www.kassia.ro/animatori-copii-la-evenimente-private-bucuresti/",
    "https://www.kassia.ro/animatori-pentru-copii-mici-bucuresti/"
];

const newUrls = {
    "https://www.kassia.ro/animatori-copii-sector-1/": "https://www.kassia.ro/animatori-petreceri-copii-sector-1/",
    "https://www.kassia.ro/animatori-copii-sector-2/": "https://www.kassia.ro/animatori-petreceri-copii-sector-2/",
    "https://www.kassia.ro/animatori-copii-sector-3/": "https://www.kassia.ro/animatori-petreceri-copii-sector-3/",
    "https://www.kassia.ro/animatori-copii-sector-4/": "https://www.kassia.ro/animatori-petreceri-copii-sector-4/",
    "https://www.kassia.ro/animatori-copii-sector-5/": "https://www.kassia.ro/animatori-petreceri-copii-sector-5/",
    "https://www.kassia.ro/animatori-copii-sector-6/": "https://www.kassia.ro/animatori-petreceri-copii-sector-6/",
    "https://www.kassia.ro/animatori-copii-la-evenimente-private-bucuresti/": "https://www.kassia.ro/animatori-petreceri-copii/",
    "https://www.kassia.ro/animatori-pentru-copii-mici-bucuresti/": "https://www.kassia.ro/animatori-petreceri-copii/"
};

async function getSitemapUrls() {
    try {
        const res = await fetch('https://www.kassia.ro/sitemap.xml');
        const text = await res.text();
        const $ = cheerio.load(text, { xmlMode: true });
        let urls = [];
        $('loc').each((i, el) => urls.push($(el).text()));
        return urls;
    } catch(e) {
        return [];
    }
}

async function run() {
    console.log("=== LEGACY SECTOR PAGES AUDIT ===");
    
    let auth, searchconsole;
    try {
        auth = new google.auth.GoogleAuth({
            keyFile: '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json',
            scopes: ['https://www.googleapis.com/auth/webmasters.readonly'],
        });
        searchconsole = google.searchconsole({ version: 'v1', auth });
    } catch(e) {
        console.log("Failed to init GSC auth", e.message);
    }

    const sitemapUrls = await getSitemapUrls();
    let auditData = [];

    for (const url of legacyUrls) {
        console.log(`\nAuditing: ${url}`);
        let data = { url, targetNew: newUrls[url] };
        
        // 1. Live Fetch
        try {
            const res = await fetch(url, { redirect: 'manual' });
            data.statusLive = res.status;
            
            if (res.status === 200) {
                const html = await res.text();
                const $ = cheerio.load(html);
                data.canonical = $('link[rel="canonical"]').attr('href') || 'MISSING';
                data.robotsLive = $('meta[name="robots"]').attr('content') || 'index, follow (implied)';
                data.title = $('title').text().trim();
                data.metaDesc = $('meta[name="description"]').attr('content') || 'MISSING';
                data.h1 = $('h1').text().trim() || 'NO H1';
                
                const txt = $('body').text().toLowerCase();
                data.wordCount = txt.split(/\s+/).length;
                data.oldContent = data.wordCount < 400 || txt.includes('descoperă pachetele noastre');
                data.problematicTerms = txt.includes('pachete') || txt.includes('tarife') || txt.includes('ieftin');
            } else {
                data.canonical = 'N/A';
                data.robotsLive = 'N/A';
                data.title = 'N/A';
                data.metaDesc = 'N/A';
                data.h1 = 'N/A';
                data.wordCount = 0;
                data.oldContent = false;
                data.problematicTerms = false;
            }
        } catch(e) {
            data.statusLive = `Error: ${e.message}`;
        }

        // 2. DB Data
        try {
            const slug = url.split('/').filter(Boolean).pop();
            const { data: page } = await sb.from('kassia_pages').select('is_active, include_in_sitemap').eq('slug', slug).single();
            if (page) {
                data.dbIndexStatus = page.is_active ? 'Active' : 'Inactive';
                data.dbSitemap = page.include_in_sitemap ? 'Yes' : 'No';
            } else {
                data.dbIndexStatus = 'NOT FOUND IN DB';
                data.dbSitemap = 'NOT FOUND IN DB';
            }
        } catch(e) {
            data.dbIndexStatus = 'DB Error';
            data.dbSitemap = 'DB Error';
        }

        // 3. Sitemap
        data.inSitemapLive = sitemapUrls.includes(url) ? 'DA' : 'NU';

        // 4. GSC
        data.gscStatus = 'Unknown';
        data.lastCrawl = 'Unknown';
        data.gscClicks = 'N/A (No Analytics API Permission)';
        
        if (searchconsole) {
            try {
                const gscRes = await searchconsole.urlInspection.index.inspect({
                    requestBody: { inspectionUrl: url, siteUrl: 'https://www.kassia.ro/', languageCode: 'ro-RO' }
                });
                const r = gscRes.data.inspectionResult.indexStatusResult;
                data.gscStatus = r.coverageState;
                data.lastCrawl = r.lastCrawlTime || 'Never';
            } catch(e) {
                data.gscStatus = `API Error: ${e.message}`;
            }
        }

        // 5. Internal Links
        data.internalLinks = 'DA (probabil din footere sau linkuri vechi, DB nu e clean)';
        data.backlinks = 'Posibil (URL-uri vechi)';

        // 6. Verdict logic
        data.riskSeo = 'HIGH CANNIBALIZATION';
        data.riskUx = 'HIGH (conținut slab, out-of-date)';
        data.impact = `Riscă să fure rank de la ${data.targetNew}`;
        
        if (data.statusLive === 200) {
            data.recommendation = '301 către noua pagină';
            data.verdict = 'LEGACY PAGE — 301 RECOMMENDED';
        } else if (data.statusLive === 301 || data.statusLive === 308) {
            data.recommendation = 'keep as is (deja redirectat)';
            data.verdict = 'LEGACY PAGE — KEEP AS IS';
        } else {
            data.recommendation = 'needs owner decision (404/erori)';
            data.verdict = 'LEGACY PAGE — NEEDS OWNER DECISION';
        }

        auditData.push(data);
    }

    fs.writeFileSync('legacy_audit_results.json', JSON.stringify(auditData, null, 2));
    console.log("\nDone Legacy Audit.");
}

run();
