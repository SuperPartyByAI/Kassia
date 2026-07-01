import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
async function run() {
    const { data: page, error } = await sb.from('kassia_pages').select('*').eq('slug', 'animatori-petreceri-copii-sector-2');
    if (error) console.log(error);
    if(page && page.length > 0) {
        const p = page[0];
        console.log("DB Title:", p.title);
        const { data: sections } = await sb.from('kassia_page_sections').select('*').eq('page_id', p.id);
        const { data: faqs } = await sb.from('kassia_faqs').select('*').eq('page_id', p.id);
        
        const fluffTerms = ["<p>", "câteva săptămâni", "desigur", "cost", "prețuri", "preturi", "tarife", "lei", "pachete", "sigur", "siguranță", "perfect", "ideal", "excelent", "profesional", "calitate", "garantat", "premium", "spectaculoase", "ofertă", "oferta"];
        
        let foundFluff = [];
        sections.forEach(sec => {
            const txt = JSON.stringify(sec.content || {}).toLowerCase() + (sec.title||'').toLowerCase();
            fluffTerms.forEach(t => {
                if(txt.includes(t)) foundFluff.push(`Section ${sec.section_type}: ${t}`);
            });
        });
        faqs.forEach(faq => {
            const txt = (faq.question + " " + faq.answer).toLowerCase();
            fluffTerms.forEach(t => {
                if(txt.includes(t)) foundFluff.push(`FAQ: ${t}`);
            });
        });
        console.log("Fluff words found in DB:", [...new Set(foundFluff)]);
    }
}
run();
