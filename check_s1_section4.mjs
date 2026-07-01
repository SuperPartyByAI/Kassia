import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_SLUG = 'animatori-petreceri-copii-sector-1';

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', PAGE_SLUG).single();
    const { data: s } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id).eq('order_index', 4).single();
    
    console.log(JSON.stringify(s, null, 2));
}

run().catch(console.error);
