import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function checkDB() {
    const pageId = '3a754972-74d7-4632-9dfa-2aa9be7682db';
    
    console.log("--- SECTIONS ---");
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, heading, order_index, content').eq('page_id', pageId).order('order_index');
    sections.forEach(s => {
        let snippet = s.content ? JSON.stringify(s.content).substring(0, 50) : 'null';
        console.log(`[${s.order_index}] ${s.section_type} | ${s.heading} | ${snippet}`);
    });
    
    console.log("\n--- FAQS ---");
    const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, order_index').eq('page_id', pageId).order('order_index');
    faqs.forEach(f => {
        console.log(`[${f.order_index}] ${f.question}`);
    });
}

checkDB().catch(console.error);
