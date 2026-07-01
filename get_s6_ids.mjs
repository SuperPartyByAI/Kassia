import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id, slug, show_pricing_preview').eq('slug', 'animatori-petreceri-copii-sector-6').single();
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, section_type, order_index, content').eq('page_id', page.id);
    
    const hardcodedSection = sections.find(s => s.heading === 'Variante de program pentru petreceri în Sector 6');
    
    console.log(JSON.stringify({
        page: page,
        hardcodedSection: hardcodedSection
    }, null, 2));
}

run().catch(console.error);
