import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import { google } from 'googleapis';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const targetSlug = 'home';
const targetUrl = 'https://www.kassia.ro/?bust=' + Date.now(); // cache-busted

async function run() {
    console.log("=== TASK 1 & 3: LIVE DOM VALIDATION & REVIEWS ===");
    const res = await fetch(targetUrl);
    const html = await res.text();
    const $ = cheerio.load(html);

    const h1Els = $('h1').map((i, el) => $(el).text().trim().replace(/\s+/g, ' ')).get();
    console.log(`HTTP Status: ${res.status}`);
    console.log(`Title: ${$('title').text().trim()}`);
    console.log(`Canonical: ${$('link[rel="canonical"]').attr('href')}`);
    console.log(`H1 Count: ${h1Els.length}`);
    console.log(`H1 Texts:`, h1Els);

    const oldH1 = "Animatori Petreceri Copii și Decoruri cu Baloane în București și Ilfov";
    const hasOldH1 = html.includes(oldH1);
    console.log(`Old H1 exists anywhere?: ${hasOldH1}`);

    // Check reviews duplication
    const reviewCards = $('.review-card, [itemprop="review"]').length;
    console.log(`Review components count: ${reviewCards}`);
    if (reviewCards > 10) { // arbitrary threshold for duplication
        console.log("REVIEWS DUPLICATION: Possible clone or fallback detected.");
    }

    console.log("\n=== TASK 2 & 5: DB CONTENT TERM AUDIT ===");
    // Fetch DB sections for home
    const { data: page } = await sb.from('kassia_pages').select('id').eq('slug', targetSlug).single();
    if(page) {
        const { data: sections } = await sb.from('kassia_page_sections').select('*').eq('page_id', page.id);
        const { data: faqs } = await sb.from('kassia_faqs').select('*').eq('page_id', page.id);

        const terms = ["câteva săptămâni", "ofertă", "spectaculoase", "excelentă", "sigure", "premium", "calitate", "perfect", "profesional", "garantat", "pachete", "prețuri", "tarife", "lei"];
        
        let foundIssues = [];
        sections.forEach(sec => {
            const txt = (sec.title + " " + sec.subtitle + " " + sec.content + " " + sec.raw_html).toLowerCase();
            terms.forEach(t => {
                if(txt.includes(t.toLowerCase())) {
                    foundIssues.push({ location: `Section: ${sec.section_type}`, term: t, original: sec.content || sec.title });
                }
            });
        });
        
        faqs.forEach(faq => {
            const txt = (faq.question + " " + faq.answer).toLowerCase();
            terms.forEach(t => {
                if(txt.includes(t.toLowerCase())) {
                    foundIssues.push({ location: `FAQ`, term: t, original: faq.answer });
                }
            });
        });
        
        console.log("Found fluff terms:");
        console.log(JSON.stringify(foundIssues, null, 2));
    }

    console.log("\n=== TASK 4: GSC PROOF ===");
    const auth = new google.auth.GoogleAuth({
        keyFile: '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json',
        scopes: ['https://www.googleapis.com/auth/webmasters.readonly'],
    });
    const searchconsole = google.searchconsole({ version: 'v1', auth });
    try {
        const gscRes = await searchconsole.urlInspection.index.inspect({
            requestBody: { inspectionUrl: 'https://www.kassia.ro/', siteUrl: 'https://www.kassia.ro/', languageCode: 'en-US' }
        });
        const r = gscRes.data.inspectionResult.indexStatusResult;
        console.log(`Status: ${r.coverageState}`);
        console.log(`Last Crawl: ${r.lastCrawlTime}`);
        console.log(`Google Canonical: ${r.googleCanonical}`);
        console.log(`User Canonical: ${r.userCanonical}`);
    } catch(e) {
        console.log("GSC Error:", e.message);
    }
}
run();
