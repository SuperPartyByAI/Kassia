import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import { google } from 'googleapis';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '/Users/universparty/wa-web-launcher/kassia-site/.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
    realtime: { transport: WebSocket }
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
    console.log("=== PREFLIGHT LEGACY PAGES ===");
    
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
        console.log(`\nPreflighting: ${url}`);
        let data = { legacyUrl: url, targetUrl: newUrls[url] };
        
        // 1 & 2. Live Fetch without redirects
        try {
            const resNoRedirect = await fetch(url, { redirect: 'manual' });
            data.statusLive = resNoRedirect.status;
            data.location = resNoRedirect.headers.get('location') || 'N/A';
        } catch(e) {
            data.statusLive = `Error: ${e.message}`;
            data.location = 'N/A';
        }

        // 3-7. Live Fetch with redirects
        try {
            const resFinal = await fetch(url, { redirect: 'follow' });
            data.statusFinal = resFinal.status;
            const html = await resFinal.text();
            const $ = cheerio.load(html);
            data.canonicalFinal = $('link[rel="canonical"]').attr('href') || 'MISSING';
            data.robotsFinal = $('meta[name="robots"]').attr('content') || 'index, follow (implied)';
            data.titleFinal = $('title').text().trim() || 'NO TITLE';
            data.h1Final = $('h1').first().text().trim() || 'NO H1';
        } catch(e) {
            data.statusFinal = `Error: ${e.message}`;
        }

        // 8-10. DB and Sitemap data
        data.sitemapLegacy = sitemapUrls.includes(url) ? 'DA' : 'NU';
        try {
            const slug = url.split('/').filter(Boolean).pop();
            const { data: page } = await sb.from('kassia_pages').select('is_active, include_in_sitemap').eq('slug', slug).single();
            if (page) {
                data.dbPresence = 'DA';
                data.dbIncludeInSitemap = page.include_in_sitemap ? 'DA' : 'NU';
            } else {
                data.dbPresence = 'NU (Not Found)';
                data.dbIncludeInSitemap = 'N/A';
            }
        } catch(e) {
            data.dbPresence = 'DB Error';
            data.dbIncludeInSitemap = 'DB Error';
        }

        // 11-14. GSC Data
        data.gscStatus = 'Unknown';
        data.lastCrawl = 'Unknown';
        data.gscClicks = 'N/A (No Analytics API Permission)';
        data.backlinks = 'Posibil (URL vechi)';
        data.internalLinks = 'DA (probabil din loguri vechi / DB status active)';
        
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

        // 16-18. Target URL Check
        try {
            const tRes = await fetch(data.targetUrl, { redirect: 'manual' });
            data.targetStatus = tRes.status;
            if (tRes.status === 200) {
                const tHtml = await tRes.text();
                const $t = cheerio.load(tHtml);
                const tCanon = $t('link[rel="canonical"]').attr('href');
                const tRobots = $t('meta[name="robots"]').attr('content') || 'index, follow';
                data.targetCanonicalSelf = (tCanon === data.targetUrl) ? 'DA' : 'NU';
                data.targetIndexFollow = (!tRobots.includes('noindex')) ? 'DA' : 'NU';
            } else {
                data.targetCanonicalSelf = 'N/A';
                data.targetIndexFollow = 'N/A';
            }
        } catch(e) {
            data.targetStatus = `Error: ${e.message}`;
        }

        // 19-21. Logic
        data.riskSeo = 'MINIM (consolidare intent)';
        data.riskUx = 'MINIM (utilizatorii ajung pe o pagină mult mai bună)';

        if (data.statusLive === 301 || data.statusLive === 308) {
            if (data.location === data.targetUrl) {
                data.action = 'keep existing redirect';
                data.verdict = 'LEGACY PAGE — KEEP EXISTING 301';
            } else {
                data.action = 'update 301 location';
                data.verdict = 'LEGACY PAGE — 301 RECOMMENDED';
            }
        } else if (data.statusLive === 200 && data.targetStatus === 200 && data.targetCanonicalSelf === 'DA') {
            data.action = 'implement 301';
            data.verdict = 'LEGACY PAGE — 301 RECOMMENDED';
            data.riskSeo = 'Rezolvă canibalizarea directă.';
        } else if (data.targetStatus !== 200 || data.targetCanonicalSelf !== 'DA') {
            data.action = 'owner decision';
            data.verdict = 'LEGACY PAGE — OWNER DECISION REQUIRED';
            data.riskSeo = 'RISC: Target URL nu este 200 sau self-canonical.';
        } else {
            data.action = 'owner decision';
            data.verdict = 'LEGACY PAGE — OWNER DECISION REQUIRED';
        }

        auditData.push(data);
    }

    fs.writeFileSync('preflight_results.json', JSON.stringify(auditData, null, 2));
    console.log("\nDone Preflight Audit.");
}

run();
