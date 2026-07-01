import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import { google } from 'googleapis';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const keyFile = '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json';
const targetSlug = 'animatori-petreceri-copii-sector-1';
const targetUrl = 'https://www.kassia.ro/' + targetSlug + '/';
const siteUrl = 'https://www.kassia.ro/';

async function run() {
    console.log("--- LIVE PAGE AUDIT ---");
    const res = await fetch(targetUrl, { headers: { 'Cache-Control': 'no-cache' } });
    if (!res.ok) {
        console.log(`HTTP Status: ${res.status} for ${targetUrl}`);
        if (res.status === 404) {
            console.log("Page not found. Need to find exact URL.");
            return;
        }
    }
    
    const html = await res.text();
    const $ = cheerio.load(html);
    
    const title = $('title').text();
    const metaDesc = $('meta[name="description"]').attr('content');
    const h1 = $('h1').map((i, el) => $(el).text().trim()).get();
    const h2 = $('h2').map((i, el) => $(el).text().trim()).get();
    const wordCount = $('body').text().split(/\s+/).filter(w => w.length > 2).length;
    
    const hubLinks = $('a[href*="/animatori-petreceri-copii/"]').length;
    let schemaFound = false;
    $('script[type="application/ld+json"]').each((_, el) => {
        if ($(el).html().includes('FAQPage') || $(el).html().includes('AggregateRating')) {
            schemaFound = true;
        }
    });

    console.log(JSON.stringify({
        status: res.status,
        url: targetUrl,
        title, metaDesc, h1, h2: h2.slice(0, 4) + (h2.length > 4 ? ` (+${h2.length - 4})` : ''),
        wordCount, hubLinks, schemaFound
    }, null, 2));

    console.log("\n--- DB VS DOM ---");
    const { data: page } = await sb.from('kassia_pages').select('id, slug, is_active, title, h1').eq('slug', targetSlug).single();
    if (page) {
        const { data: sections } = await sb.from('kassia_page_sections').select('heading, content').eq('page_id', page.id);
        console.log("DB Page Found:", { id: page.id, active: page.is_active, h1: page.h1 });
        console.log(`DB Sections Count: ${sections ? sections.length : 0}`);
    } else {
        console.log("Page not found in DB.");
    }

    console.log("\n--- GSC PERFORMANCE ---");
    const auth = new google.auth.GoogleAuth({
        keyFile: keyFile,
        scopes: ['https://www.googleapis.com/auth/webmasters.readonly'],
    });
    const searchconsole = google.searchconsole({ version: 'v1', auth });

    try {
        const gscRes = await searchconsole.searchanalytics.query({
            siteUrl: siteUrl,
            requestBody: {
                startDate: '2026-05-25',
                endDate: '2026-06-22',
                dimensions: ['query', 'page'],
                dimensionFilterGroups: [{
                    filters: [
                        { dimension: 'page', operator: 'equals', expression: targetUrl }
                    ]
                }],
                rowLimit: 20
            }
        });
        console.log(JSON.stringify(gscRes.data, null, 2));
    } catch(e) {
        console.log("GSC Error:", e.message);
    }
}
run();
