import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const targetSlug = 'animatori-petreceri-copii-sector-6';
const targetUrl = 'https://www.kassia.ro/' + targetSlug + '/';

async function querySB(table, queryParams, method = 'GET', body = null) {
    const options = {
        method,
        headers: { 'apikey': supabaseKey, 'Authorization': `Bearer ${supabaseKey}`, 'Content-Type': 'application/json', 'Prefer': 'return=representation' }
    };
    if (body) options.body = JSON.stringify(body);
    const res = await fetch(`${supabaseUrl}/rest/v1/${table}?${queryParams}`, options);
    return res.json();
}

async function run() {
    console.log("=== EXECUTING DB MICRO-FIX ===");
    const pages = await querySB('kassia_pages', `slug=eq.${targetSlug}&select=*`);
    const page = pages[0];
    if(!page) { console.log("Sector 6 not found in DB"); return; }
    
    console.log(`Current H1: ${page.h1}`);
    const newH1 = "Animatori pentru petreceri de copii în Sector 6";
    
    const updateRes = await querySB('kassia_pages', `id=eq.${page.id}`, 'PATCH', { h1: newH1 });
    console.log(`Updated H1 in DB: ${updateRes[0].h1}`);
    
    console.log("\n=== VALIDATING LIVE DOM ===");
    const bustUrl = targetUrl + '?nocache=' + Date.now();
    const res = await fetch(bustUrl);
    const html = await res.text();
    const $ = cheerio.load(html);
    
    const h1Count = $('h1').length;
    const h1Text = $('h1').text().trim().replace(/\s+/g, ' ');
    const title = $('title').text();
    const metaDesc = $('meta[name="description"]').attr('content');
    const canonical = $('link[rel="canonical"]').attr('href');
    const robots = $('meta[name="robots"]').attr('content') || 'index, follow';
    const faqCount = $('.faq-item, details').length;
    const faqSchema = html.includes('FAQPage');
    const hubLink = $('a[href="/animatori-petreceri-copii/"]').length > 0;
    
    const bodyTxt = $('body').text().replace(/\s+/g, ' ').toLowerCase();
    const noFluff = !bodyTxt.includes("câteva săptămâni") && !bodyTxt.includes("super eveniment");
    
    // Check if 'pachete' is only in href
    let pacheteInText = false;
    $('p, h1, h2, h3, h4, h5, h6, span, div').each((i, el) => {
        // Exclude links from text check to see if it exists outside href
        const clone = $(el).clone();
        clone.find('a').remove();
        if(clone.text().toLowerCase().includes('pachete')) pacheteInText = true;
    });

    console.log(`HTTP: ${res.status}`);
    console.log(`Exact 1 H1: ${h1Count === 1}`);
    console.log(`H1 Nou: ${h1Text === newH1} (${h1Text})`);
    console.log(`Title Intact: ${title.includes('Animatori pentru petreceri de copii în Sector 6 | Kassia')}`);
    console.log(`Meta Desc Intacta: ${metaDesc.includes('Drumul Taberei')}`);
    console.log(`Canonical Intact: ${canonical === targetUrl}`);
    console.log(`Robots: ${robots}`);
    console.log(`FAQ Count: ${faqCount}`);
    console.log(`FAQPage Schema: ${faqSchema}`);
    console.log(`Fără "câteva săptămâni" / "super eveniment": ${noFluff}`);
    console.log(`Pachete exclusiv în href: ${!pacheteInText}`);
    console.log(`Link către Hub Intact: ${hubLink}`);
}
run();
