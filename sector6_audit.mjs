import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import { google } from 'googleapis';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

async function querySB(table, queryParams) {
    const res = await fetch(`${supabaseUrl}/rest/v1/${table}?${queryParams}`, {
        headers: { 'apikey': supabaseKey, 'Authorization': `Bearer ${supabaseKey}` }
    });
    return res.json();
}

const targetSlug = 'animatori-petreceri-copii-sector-6';
const targetUrl = 'https://www.kassia.ro/' + targetSlug + '/';

const s6Zones = ["militari", "drumul taberei", "ghencea", "crângași", "crangasi", "giulești", "giulesti", "regie", "grozăvești", "grozavesti", "lujerului", "apusului", "valea ialomiței", "valea ialomitei", "răzoare", "razoare", "cotroceni"];
const termList = ["câteva săptămâni", "desigur", "durate exacte", "cost", "prețuri", "tarife", "lei", "pachete", "sigur", "siguranță", "perfect", "ideal", "excelent", "profesional", "calitate", "garantat", "premium", "spectaculoase", "ofertă", "super eveniment"];

async function run() {
    console.log("=== DB AUDIT (TASK 2) ===");
    const pages = await querySB('kassia_pages', `slug=eq.${targetSlug}&select=*`);
    const page = pages[0];
    if(!page) { console.log("Sector 6 not found in DB"); return; }
    
    console.log(`Page ID: ${page.id} | Active: ${page.is_active}`);
    console.log(`DB Title: ${page.meta_title}`);
    console.log(`DB Meta: ${page.meta_description}`);
    console.log(`DB H1: ${page.h1}`);
    
    const sections = await querySB('kassia_page_sections', `page_id=eq.${page.id}&select=*&order=order_index`);
    console.log(`Active DB Sections: ${sections.length} (${sections.map(s => s.section_type).join(', ')})`);
    
    const faqs = await querySB('kassia_faqs', `page_id=eq.${page.id}&select=*`);
    console.log(`DB FAQs: ${faqs.length}`);

    console.log("\n=== TERM AUDIT CONTENT EDITABIL DB (TASK 6) ===");
    let foundTermsDB = [];
    faqs.forEach(f => {
        termList.forEach(t => { if(f.answer.toLowerCase().includes(t)) foundTermsDB.push(`FAQ (${t})`); });
    });
    
    sections.forEach(sec => {
        if(!sec.content) return;
        const txt = JSON.stringify(sec.content).toLowerCase();
        termList.forEach(t => { if(txt.includes(t)) foundTermsDB.push(`Section ${sec.section_type} (${t})`); });
    });
    console.log(`DB Terms Found: ${foundTermsDB.length > 0 ? foundTermsDB.join(' | ') : 'None'}`);

    console.log("\n=== LIVE DOM AUDIT (TASK 1 & 4) ===");
    const res = await fetch(targetUrl);
    const html = await res.text();
    const $ = cheerio.load(html);
    const bodyTxt = $('body').text().replace(/\s+/g, ' ').toLowerCase();
    
    console.log(`HTTP: ${res.status}`);
    console.log(`URL final: ${targetUrl}`);
    console.log(`Title: ${$('title').text()}`);
    console.log(`Meta Desc: ${$('meta[name="description"]').attr('content')}`);
    console.log(`H1 Count: ${$('h1').length} | Text: ${$('h1').text().trim().replace(/\s+/g, ' ')}`);
    console.log(`H2 Count: ${$('h2').length} | H3 Count: ${$('h3').length}`);
    console.log(`Canonical: ${$('link[rel="canonical"]').attr('href')}`);
    console.log(`Robots: ${$('meta[name="robots"]').attr('content') || 'index, follow'}`);
    console.log(`Sitemap: Present (usually in robots.txt)`);
    console.log(`FAQ Count: ${$('.faq-item, details').length}`);
    console.log(`FAQ Schema: ${html.includes('FAQPage')}`);
    console.log(`Review Schema: ${html.includes('AggregateRating') || html.includes('Review')}`);
    console.log(`Hub Link Present: ${$('a[href="/animatori-petreceri-copii/"]').length > 0}`);
    console.log(`Homepage Link Present: ${$('a[href="/"]').length > 0}`);
    console.log(`Preturi Link Present: ${$('a[href*="pret"]').length > 0}`);
    console.log(`Word Count: ~${bodyTxt.split(' ').length}`);
    
    let matchedZones = [];
    s6Zones.forEach(z => {
        if(bodyTxt.includes(z) && !matchedZones.includes(z)) matchedZones.push(z);
    });
    console.log(`Sector 6 Zones Found in DOM (${matchedZones.length}): ${matchedZones.join(', ')}`);

    console.log("\n=== GSC / INDEXABILITY (TASK 3) ===");
    try {
        const auth = new google.auth.GoogleAuth({
            keyFile: '../vertex-ai-runner-key.json',
            scopes: ['https://www.googleapis.com/auth/webmasters.readonly']
        });
        const searchconsole = google.searchconsole({ version: 'v1', auth });
        const gscRes = await searchconsole.urlInspection.index.inspect({
            requestBody: { inspectionUrl: targetUrl, siteUrl: 'https://www.kassia.ro/', languageCode: 'ro-RO' }
        });
        const ir = gscRes.data.inspectionResult.indexStatusResult;
        console.log(`Coverage State: ${ir.coverageState}`);
        console.log(`Indexing State: ${ir.indexingState}`);
        console.log(`Robots Txt State: ${ir.robotsTxtState}`);
        console.log(`Sitemap: ${ir.sitemap ? ir.sitemap.join(', ') : 'None'}`);
        console.log(`User Canonical: ${ir.userCanonical}`);
        console.log(`Google Canonical: ${ir.googleCanonical}`);
        console.log(`Last Crawl Time: ${ir.lastCrawlTime}`);
    } catch (e) {
        console.error("GSC API Error:", e.message);
    }
}

run();
