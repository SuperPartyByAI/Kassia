import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const targetSlug = 'animatori-petreceri-copii-sector-2';

async function run() {
    console.log("=== DB UPDATE PHASE ===");
    const { data: page } = await sb.from('kassia_pages').select('id').eq('slug', targetSlug).single();
    if(!page) throw new Error("Sector 2 not found in DB");

    // Fix 1: FAQ "câteva săptămâni"
    const oldFaq = "Recomandăm să ne scrii cu câteva săptămâni înainte, pentru a verifica disponibilitatea echipei și pentru a stabili detaliile legate de animație și decoruri.";
    const newFaq = "Recomandăm să ne contactezi din timp pentru a verifica disponibilitatea echipei și pentru a stabili detaliile legate de animație și decoruri.";
    
    const { data: faqs } = await sb.from('kassia_faqs').select('*').eq('page_id', page.id);
    for (const faq of faqs) {
        if (faq.answer.includes("câteva săptămâni")) {
            const updatedAnswer = faq.answer.replace(oldFaq, newFaq);
            await sb.from('kassia_faqs').update({ answer: updatedAnswer }).eq('id', faq.id);
            console.log("Updated FAQ");
        }
    }

    // Fix 2: kassia_page_sections "pachete atractive pentru un super eveniment"
    const { data: sections } = await sb.from('kassia_page_sections').select('*').eq('page_id', page.id);
    
    const oldDetails = "Vezi programele de animație și activitățile interactive care pot fi adaptate în funcție de vârsta copiilor, spațiu, tematică și detaliile evenimentului. Alege pachete atractive pentru un super eveniment.";
    const newDetails = "Vezi programele de animație și activitățile interactive care pot fi adaptate în funcție de vârsta copiilor, spațiu, tematică și detaliile evenimentului.";

    for (const sec of sections) {
        if (!sec.content) continue;
        let modified = false;
        let newContent = { ...sec.content };
        
        const contentStr = JSON.stringify(newContent);
        if (contentStr.includes("pachete atractive pentru un super eveniment")) {
            if (newContent.subheading && newContent.subheading.includes("pachete atractive")) {
                newContent.subheading = newContent.subheading.replace(oldDetails, newDetails);
                modified = true;
                console.log("Updated Service Details Subheading");
            }
            if (newContent.body && newContent.body.includes("pachete atractive")) {
                newContent.body = newContent.body.replace(oldDetails, newDetails);
                modified = true;
                console.log("Updated Service Details Body");
            }
        }
        
        if (newContent.cta_text && newContent.cta_text.includes("Vezi pachete")) {
            newContent.cta_text = newContent.cta_text.replace("Vezi pachete", "Vezi programele");
            modified = true;
            console.log("Updated CTA Text");
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
    console.log(`H1 neschimbat: ${$('h1').text().trim().includes('Animatori pentru petreceri de copii în Sector 2')}`);
    console.log(`Title neschimbat: ${$('title').text().trim().includes('Sector 2')}`);
    console.log(`Canonical neschimbat: ${$('link[rel="canonical"]').attr('href') === targetUrl}`);
    
    let hubLinkIntact = false;
    $('a').each((i, el) => {
        if ($(el).attr('href') === '/animatori-petreceri-copii/') hubLinkIntact = true;
    });
    console.log(`Linkuri Hub intacte: ${hubLinkIntact}`);

    const badTerms = ["câteva săptămâni", "pachete", "super eveniment"];
    console.log("\nChecking fluff terms in live DOM:");
    badTerms.forEach(t => {
        console.log(`- ${t}: ${txt.toLowerCase().includes(t.toLowerCase())}`);
    });
}
run();
