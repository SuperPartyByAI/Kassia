import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
async function run() {
    const { data: page } = await sb.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii-sector-3').single();
    const { data: sections } = await sb.from('kassia_page_sections').select('id, section_type, content').eq('page_id', page.id);
    sections.forEach(s => {
        console.log(`\nSECTION_ID: ${s.id} | TYPE: ${s.section_type}`);
        console.log(JSON.stringify(s.content));
    });
}
run();
