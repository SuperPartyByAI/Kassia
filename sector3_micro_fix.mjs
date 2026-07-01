import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const targetSlug = 'animatori-petreceri-copii-sector-3';

async function run() {
    console.log("=== DB UPDATE PHASE ===");
    const { data: page } = await sb.from('kassia_pages').select('id').eq('slug', targetSlug).single();
    if(!page) throw new Error("Sector 3 not found in DB");

    // Fix 1: FAQ "câteva săptămâni"
    const { data: faqs } = await sb.from('kassia_faqs').select('*').eq('page_id', page.id);
    for (const faq of faqs) {
        if (faq.answer.includes("câteva săptămâni")) {
            console.log("Before FAQ:", faq.answer);
            const newAnswer = "Este recomandat să ne transmiteți detaliile din timp. Astfel, putem verifica disponibilitatea echipei pentru data și ora orientativă a evenimentului.";
            await sb.from('kassia_faqs').update({ answer: newAnswer }).eq('id', faq.id);
            console.log("Updated FAQ:", newAnswer);
        }
    }

    // Fix 2: kassia_page_sections "pachete atractive pentru un super eveniment"
    const { data: sections } = await sb.from('kassia_page_sections').select('*').eq('page_id', page.id);
    const regexRemove = / Alege pachete atractive pentru un super eveniment\./i;
    
    for (const sec of sections) {
        if (!sec.content) continue;
        let modified = false;
        let newContent = { ...sec.content };
        const contentStr = JSON.stringify(newContent).toLowerCase();
        
        if (contentStr.includes("pachete")) {
            if (newContent.subheading && regexRemove.test(newContent.subheading)) {
                console.log("Before Subheading:", newContent.subheading);
                newContent.subheading = newContent.subheading.replace(regexRemove, "");
                modified = true;
                console.log("Updated Service Details Subheading:", newContent.subheading);
            }
            if (newContent.body && regexRemove.test(newContent.body)) {
                console.log("Before Body:", newContent.body);
                newContent.body = newContent.body.replace(regexRemove, "");
                modified = true;
                console.log("Updated Service Details Body:", newContent.body);
            }
            if (newContent.cta_text && /vezi pachete/i.test(newContent.cta_text)) {
                console.log("Before CTA:", newContent.cta_text);
                newContent.cta_text = newContent.cta_text.replace(/vezi pachete/i, "Vezi programele");
                modified = true;
                console.log("Updated CTA Text:", newContent.cta_text);
            }
        }
        
        if (modified) {
            await sb.from('kassia_page_sections').update({ content: newContent }).eq('id', sec.id);
        }
    }

    console.log("Waiting 2s for DB propagation...");
    await new Promise(r => setTimeout(r, 2000));

    console.log("\n=== LIVE VALIDATION PHASE ===");
    const targetUrl = 'https://www.kassia.ro/' + targetSlug + '/';
    const res = await fetch(targetUrl + '?bust=' + Date.now());
    const html = await res.text();
    const $ = cheerio.load(html);
    const txt = $('body').text().replace(/\s+/g, ' ');

    console.log(`HTTP 200: ${res.status === 200}`);
    console.log(`Exactly 1 H1: ${$('h1').length === 1}`);
    console.log(`H1 neschimbat: ${$('h1').text().trim().includes('Animatori pentru petreceri de copii în Sector 3')}`);
    console.log(`Title neschimbat: ${$('title').text().trim().includes('Sector 3')}`);
    console.log(`Canonical neschimbat: ${$('link[rel="canonical"]').attr('href') === targetUrl}`);
    console.log(`Robots index/follow: ${$('meta[name="robots"]').attr('content') || 'index, follow'}`);
    console.log(`FAQ count = 8: ${$('.faq-item, details').length === 8}`);
    console.log(`FAQ Schema: ${html.includes('FAQPage')}`);
    
    let hubLinkIntact = false;
    $('a').each((i, el) => {
        if ($(el).attr('href') === '/animatori-petreceri-copii/') hubLinkIntact = true;
    });
    console.log(`Linkuri Hub intacte: ${hubLinkIntact}`);

    const badTerms = ["câteva săptămâni", "pachete", "super eveniment"];
    console.log("\nChecking fluff terms in live DOM:");
    badTerms.forEach(t => {
        // "pachete" is allowed in URL slugs, so we only check pure text
        const found = txt.toLowerCase().includes(t.toLowerCase());
        console.log(`- ${t}: ${found}`);
    });
}
run();
