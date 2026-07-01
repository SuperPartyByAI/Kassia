import { createClient } from '@supabase/supabase-js';
import fetch from 'node-fetch';
import * as cheerio from 'cheerio';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const targetSlug = 'animatori-petreceri-copii-sector-2';

async function run() {
    const { data: page } = await sb.from('kassia_pages').select('id').eq('slug', targetSlug).single();
    
    // Check FAQs
    const { data: faqs } = await sb.from('kassia_faqs').select('*').eq('page_id', page.id);
    for (const faq of faqs) {
        if (faq.answer.toLowerCase().includes("săptămâni")) {
            console.log("FAQ Answer:", faq.answer);
            // Let's replace it directly again, maybe it was capitalized differently
            const newAnswer = faq.answer.replace(/cu câteva săptămâni înainte/i, "din timp");
            await sb.from('kassia_faqs').update({ answer: newAnswer }).eq('id', faq.id);
            console.log("Forced update FAQ:", newAnswer);
        }
    }

    // Check Sections
    const { data: sections } = await sb.from('kassia_page_sections').select('*').eq('page_id', page.id);
    for (const sec of sections) {
        if (!sec.content) continue;
        const contentStr = JSON.stringify(sec.content).toLowerCase();
        if (contentStr.includes("pachete")) {
            console.log("Section content:", JSON.stringify(sec.content));
            
            // Force replace
            let newContent = { ...sec.content };
            if (newContent.body && newContent.body.includes("pachete")) {
                 newContent.body = newContent.body.replace(/ Alege pachete atractive pentru un super eveniment\./i, "");
            }
            if (newContent.subheading && newContent.subheading.includes("pachete")) {
                 newContent.subheading = newContent.subheading.replace(/ Alege pachete atractive pentru un super eveniment\./i, "");
            }
            if (newContent.cta_text && newContent.cta_text.includes("pachete")) {
                 newContent.cta_text = newContent.cta_text.replace(/Vezi pachete/i, "Vezi programele");
            }
            await sb.from('kassia_page_sections').update({ content: newContent }).eq('id', sec.id);
            console.log("Forced update Section:", JSON.stringify(newContent));
        }
    }
    
    console.log("Waiting 2s...");
    await new Promise(r => setTimeout(r, 2000));
    
    const res = await fetch('https://www.kassia.ro/' + targetSlug + '/?bust=' + Date.now());
    const txt = cheerio.load(await res.text())('body').text().replace(/\s+/g, ' ');
    console.log(`- câteva săptămâni: ${txt.toLowerCase().includes('câteva săptămâni')}`);
    console.log(`- pachete: ${txt.toLowerCase().includes('pachete')}`);
}
run();
