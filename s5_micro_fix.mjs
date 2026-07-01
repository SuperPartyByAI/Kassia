import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const targetSlug = 'animatori-petreceri-copii-sector-5';

async function run() {
    console.log("=== DB UPDATE PHASE ===");
    const { data: page } = await sb.from('kassia_pages').select('id').eq('slug', targetSlug).single();
    
    // Fix FAQ "câteva săptămâni"
    const { data: faqs } = await sb.from('kassia_faqs').select('*').eq('page_id', page.id);
    for (const faq of faqs) {
        if (faq.answer.includes("câteva săptămâni")) {
            console.log("Before FAQ:", faq.answer);
            const newAnswer = "Este recomandat să ne transmiteți detaliile din timp. Astfel, putem verifica disponibilitatea echipei pentru data și ora orientativă a evenimentului.";
            await sb.from('kassia_faqs').update({ answer: newAnswer }).eq('id', faq.id);
            console.log("Updated FAQ:", newAnswer);
        }
    }

    console.log("Waiting 2s for DB propagation...");
    await new Promise(r => setTimeout(r, 2000));

    console.log("\n=== LIVE VALIDATION PHASE ===");
    const targetUrl = 'https://www.kassia.ro/' + targetSlug + '/';
    const res = await fetch(targetUrl + '?bust=' + Date.now());
    const html = await res.text();
    const $ = cheerio.load(html);
    const txt = $('body').text().replace(/\s+/g, ' ').toLowerCase();

    console.log(`HTTP 200: ${res.status === 200}`);
    console.log(`Exactly 1 H1: ${$('h1').length === 1}`);
    console.log(`H1 neschimbat: ${$('h1').text().trim().includes('Sector 5')}`);
    console.log(`Title neschimbat: ${$('title').text().trim().includes('Sector 5')}`);
    console.log(`Canonical neschimbat: ${$('link[rel="canonical"]').attr('href') === targetUrl}`);
    console.log(`Robots index/follow: ${$('meta[name="robots"]').attr('content') || 'index, follow'}`);
    console.log(`FAQ count = 8: ${$('.faq-item, details').length === 8}`);
    console.log(`FAQ Schema: ${html.includes('FAQPage')}`);
    console.log(`Link Hub intact: ${$('a[href="/animatori-petreceri-copii/"]').length > 0}`);

    console.log("\nChecking fluff terms in live DOM:");
    console.log(`- câteva săptămâni: ${txt.includes('câteva săptămâni')}`);
    console.log(`- super eveniment: ${txt.includes('super eveniment')}`);
    console.log(`- vezi pachete: ${txt.includes('vezi pachete')}`);
    
    // Check if 'pachete' exists anywhere outside hrefs.
    let pacheteInText = false;
    $('body *').each(function() {
        if ($(this).children().length === 0) { // leaf nodes
            if ($(this).text().toLowerCase().includes('pachete') && this.tagName !== 'a') {
                pacheteInText = true;
            }
        }
    });
    console.log(`- pachete în text vizibil: ${pacheteInText}`);
}
run();
