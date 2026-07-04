import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
    
    // disable the old block
    await supabase.from('kassia_page_sections').update({
        content: { is_active: false }
    }).eq('page_id', page.id).eq('heading', 'De ce ne aleg mii de părinți?');

    console.log("Disabled old trust block");
}
run();
