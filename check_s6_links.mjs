import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function checkLinks() {
    const slug = 'animatori-petreceri-copii-sector-6';
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', slug).single();
    
    const { data: links } = await supabase.from('kassia_internal_links').select('target_page_id, anchor_text').eq('source_page_id', page.id);
    console.log("Internal Links DB:");
    console.log(links);
}

checkLinks().catch(console.error);
