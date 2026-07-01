import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const targetSlug = 'animatori-petreceri-copii-sector-2';

async function run() {
    const { data: page } = await sb.from('kassia_pages').select('id').eq('slug', targetSlug).single();
    const { data: faqs } = await sb.from('kassia_faqs').select('*').eq('page_id', page.id);
    for (const faq of faqs) {
        if (faq.answer.includes("din timp de petrecere")) {
            const newAnswer = faq.answer.replace("din timp de petrecere", "din timp");
            await sb.from('kassia_faqs').update({ answer: newAnswer }).eq('id', faq.id);
            console.log("Grammar fixed:", newAnswer);
        }
    }
}
run();
