import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import { google } from 'googleapis';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const targetSlug = 'animatori-petreceri-copii-sector-2';
const targetUrl = 'https://www.kassia.ro/' + targetSlug + '/';

async function run() {
    console.log("=== TASK 1: LIVE AUDIT ===");
    const res = await fetch(targetUrl + '?bust=' + Date.now());
    const html = await res.text();
    const $ = cheerio.load(html);

    const h1Els = $('h1').map((i, el) => $(el).text().trim().replace(/\s+/g, ' ')).get();
    const h2Els = $('h2').map((i, el) => $(el).text().trim()).get();
    
    console.log(`HTTP Status: ${res.status}`);
    console.log(`Title: ${$('title').text().trim()}`);
    console.log(`Meta Desc: ${$('meta[name="description"]').attr('content')}`);
    console.log(`Canonical: ${$('link[rel="canonical"]').attr('href')}`);
    console.log(`Robots: ${$('meta[name="robots"]').attr('content') || 'Not specified (implies index, follow)'}`);
    console.log(`H1 Count: ${h1Els.length} | Texts:`, h1Els);
    console.log(`H2 Count: ${h2Els.length}`);
    
    const faqs = $('.faq-item, details').length;
    console.log(`FAQ Count (live): ${faqs}`);
    console.log(`FAQPage Schema: ${html.includes('FAQPage')}`);
    console.log(`AggregateRating Schema: ${html.includes('AggregateRating')}`);
    
    let hubLink = false;
    $('a').each((i, el) => { if($(el).attr('href') === '/animatori-petreceri-copii/') hubLink = true; });
    console.log(`Link to Hub exists: ${hubLink}`);

    console.log("\n=== TASK 4: INTENT AUDIT (LOCAL AREAS) ===");
    const bodyTxt = $('body').text().toLowerCase();
    const zones = ["colentina", "tei", "pantelimon", "obor", "iancului", "fundeni", "doamna ghica", "ștefan cel mare", "stefan cel mare", "floreasca", "andronache"];
    zones.forEach(z => {
        console.log(`- ${z}: ${bodyTxt.includes(z)}`);
    });

    console.log("\n=== TASK 2 & 6: DB VS DOM & TERM AUDIT ===");
    const { data: page } = await sb.from('kassia_pages').select('id, title, h1, slug, is_active').eq('slug', targetSlug).single();
    if(page) {
        console.log(`DB Slug: ${page.slug} | Active: ${page.is_active}`);
        console.log(`DB H1: ${page.h1}`);
        console.log(`DB Title: ${page.title}`);
        
        const { data: sections } = await sb.from('kassia_page_sections').select('*').eq('page_id', page.id);
        const { data: dbFaqs } = await sb.from('kassia_faqs').select('*').eq('page_id', page.id);
        console.log(`DB Sections count: ${sections.length}`);
        console.log(`DB FAQs count: ${dbFaqs.length}`);

        const fluffTerms = ["<p>", "câteva săptămâni", "desigur", "cost", "prețuri", "preturi", "tarife", "lei", "pachete", "sigur", "siguranță", "perfect", "ideal", "excelent", "profesional", "calitate", "garantat", "premium", "spectaculoase", "ofertă", "oferta"];
        
        let foundFluff = [];
        sections.forEach(sec => {
            const txt = JSON.stringify(sec.content || {}).toLowerCase() + (sec.title||'').toLowerCase();
            fluffTerms.forEach(t => {
                if(txt.includes(t)) foundFluff.push(`Section ${sec.section_type}: ${t}`);
            });
        });
        dbFaqs.forEach(faq => {
            const txt = (faq.question + " " + faq.answer).toLowerCase();
            fluffTerms.forEach(t => {
                if(txt.includes(t)) foundFluff.push(`FAQ: ${t}`);
            });
        });
        console.log("Fluff words found in DB:");
        console.log([...new Set(foundFluff)]);
    } else {
        console.log("PAGE NOT FOUND IN DB!");
    }

    console.log("\n=== TASK 3: GSC URL INSPECTION ===");
    const auth = new google.auth.GoogleAuth({
        keyFile: '/Users/universparty/wa-web-launcher/vertex-ai-runner-key.json',
        scopes: ['https://www.googleapis.com/auth/webmasters.readonly'],
    });
    const searchconsole = google.searchconsole({ version: 'v1', auth });
    try {
        const gscRes = await searchconsole.urlInspection.index.inspect({
            requestBody: { inspectionUrl: targetUrl, siteUrl: 'https://www.kassia.ro/', languageCode: 'ro-RO' }
        });
        const r = gscRes.data.inspectionResult.indexStatusResult;
        console.log(`Status: ${r.coverageState}`);
        console.log(`Last Crawl: ${r.lastCrawlTime || 'Never'}`);
        console.log(`Google Canonical: ${r.googleCanonical}`);
        console.log(`User Canonical: ${r.userCanonical}`);
    } catch(e) {
        console.log("GSC Error:", e.message);
    }
}
run();
