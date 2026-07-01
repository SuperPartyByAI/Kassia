import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const targetSlug = 'animatori-petreceri-copii-sector-1';

async function run() {
    const { data: page } = await sb.from('kassia_pages').select('id').eq('slug', targetSlug).single();
    const { data: faqs } = await sb.from('kassia_faqs').select('*').eq('page_id', page.id);
    
    for (const faq of faqs) {
        if (faq.answer.includes('<p>')) {
            console.log(`Fixing <p> in FAQ: ${faq.question}`);
            const newAnswer = faq.answer.replace(/<p>/g, '').replace(/<\/p>/g, '').trim();
            await sb.from('kassia_faqs').update({ answer: newAnswer }).eq('id', faq.id);
        }
    }
}
run();
