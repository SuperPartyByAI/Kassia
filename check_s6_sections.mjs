import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch } });

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii-sector-6').single();
    const { data: sections } = await supabase.from('kassia_page_sections').select('heading, content').eq('page_id', page.id);
    for (const s of sections) {
        if (s.heading && s.heading.includes('Variante')) {
            console.log(s.heading);
            console.log(s.content.body);
        }
    }
}
run();
