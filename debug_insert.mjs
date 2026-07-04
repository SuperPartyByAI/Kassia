import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
    const { error } = await supabase.from('kassia_page_sections').insert({
        page_id: page.id,
        section_type: 'custom_html',
        heading: 'Test',
        content: { is_active: true, body: 'test' },
        order_index: 3.5
    });
    console.log("Error:", error);
}
run();
