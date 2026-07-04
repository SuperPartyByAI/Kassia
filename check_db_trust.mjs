import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase
        .from('kassia_pages')
        .select('id')
        .eq('slug', 'animatori-petreceri-copii')
        .single();
    
    const { data: sections } = await supabase
        .from('kassia_page_sections')
        .select('id, heading, order_index, content')
        .eq('page_id', page.id)
        .order('order_index');

    console.log(sections.map(s => ({ heading: s.heading, order_index: s.order_index, active: s.content?.is_active })));
}
run();
