import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import { google } from 'googleapis';
import fs from 'fs';

const keyFile = '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json';
const siteUrl = 'https://www.kassia.ro/';

async function run() {
    console.log("--- LIVE PAGE AUDIT ---");
    const res = await fetch(siteUrl, { headers: { 'Cache-Control': 'no-cache' } });
    const html = await res.text();
    const $ = cheerio.load(html);
    
    const h1 = $('h1').map((i, el) => $(el).text().trim()).get();
    const h2 = $('h2').map((i, el) => $(el).text().trim()).get();
    const title = $('title').text();
    const metaDesc = $('meta[name="description"]').attr('content');
    const wordCount = $('body').text().split(/\s+/).filter(w => w.length > 2).length;
    
    // Check internal links to Hub
    const hubLinks = $('a[href*="/animatori-petreceri-copii"]').map((i, el) => ({
        text: $(el).text().trim(),
        href: $(el).attr('href')
    })).get();

    console.log(JSON.stringify({
        status: res.status,
        title, metaDesc, h1, h2: h2.slice(0, 5) + (h2.length > 5 ? '... ' + (h2.length - 5) + ' more' : ''),
        wordCount,
        hubLinks
    }, null, 2));

    console.log("\n--- GSC CANNIBALIZATION AUDIT ---");
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
                        { dimension: 'page', operator: 'equals', expression: siteUrl },
                        { dimension: 'query', operator: 'contains', expression: 'animatori' }
                    ]
                }],
                rowLimit: 10
            }
        });
        console.log(JSON.stringify(gscRes.data, null, 2));
    } catch(e) {
        console.log("GSC Error:", e.message);
    }
}
run();
