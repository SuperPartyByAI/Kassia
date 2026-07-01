import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fetch from 'node-fetch';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const targetSlug = 'animatori-petreceri-copii-sector-1';

async function run() {
    console.log("--- FAZA 1: DB MICRO-FIX ---");
    const { data: page } = await sb.from('kassia_pages').select('id').eq('slug', targetSlug).single();
    const { data: faqs } = await sb.from('kassia_faqs').select('*').eq('page_id', page.id);
    
    for (const faq of faqs) {
        if (faq.question.includes('contactați')) {
            console.log(`Updating FAQ 1: ${faq.question}`);
            await sb.from('kassia_faqs').update({
                answer: 'Trimite detaliile evenimentului din timp, ca echipa Kassia să verifice disponibilitatea pentru data aleasă și să pregătească structura programului în funcție de vârsta copiilor, locație și tematică.'
            }).eq('id', faq.id);
        }
        if (faq.question.includes('vârsta copiilor')) {
            console.log(`Updating FAQ 2: ${faq.question}`);
            await sb.from('kassia_faqs').update({
                answer: 'Da. Pentru copiii foarte mici alegem activități blânde și jocuri senzoriale, iar pentru copiii mai mari organizăm jocuri de echipă, ștafete și momente de dans adaptate energiei grupului.'
            }).eq('id', faq.id);
        }
    }
    
    console.log("DB update completed. Waiting for ISR revalidation...");
    // Trigger Astro ISR cache bust if necessary, but Kassia uses Server side rendering or 1 min cache usually. 
    await new Promise(r => setTimeout(r, 2000));
    
    console.log("\n--- FAZA 1: LIVE VALIDATION ---");
    const targetUrl = 'https://www.kassia.ro/animatori-petreceri-copii-sector-1/?v=' + Date.now();
    const res = await fetch(targetUrl, { headers: { 'Cache-Control': 'no-cache' } });
    const html = await res.text();
    const $ = cheerio.load(html);
    
    const h1Count = $('h1').length;
    let fullText = $('body').text().replace(/\s+/g, ' ');
    const hasP = fullText.includes('<p>');
    const hasSaptamani = fullText.includes('câteva săptămâni');
    const hasDesigur = fullText.includes('Desigur');
    
    let schemaFound = false;
    $('script[type="application/ld+json"]').each((_, el) => {
        if ($(el).html().includes('FAQPage')) schemaFound = true;
    });
    
    console.log(JSON.stringify({
        status: res.status,
        h1Count,
        hasP,
        hasSaptamani,
        hasDesigur,
        schemaFound,
    }, null, 2));
}

run();
