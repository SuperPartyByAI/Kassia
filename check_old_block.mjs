import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
    const { data: sec } = await supabase.from('kassia_page_sections').select('section_type, content, heading').eq('page_id', page.id).eq('heading', 'De ce ne aleg mii de părinți?').single();
    console.log(sec);
}
run();
