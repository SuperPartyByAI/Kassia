import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id, slug, show_pricing_preview').eq('slug', 'animatori-petreceri-copii-popesti-leordeni').single();
    if (!page) { console.log('Page not found'); return; }
    
    const { data: sections } = await supabase.from('kassia_page_sections').select('order_index').eq('page_id', page.id);
    let maxOrderIndex = 0;
    if (sections && sections.length > 0) {
        maxOrderIndex = Math.max(...sections.map(s => s.order_index));
    }
    
    console.log(JSON.stringify({
        page: page,
        maxOrderIndex: maxOrderIndex
    }, null, 2));
}

run().catch(console.error);
