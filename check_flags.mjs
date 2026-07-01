import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: pages } = await supabase.from('kassia_pages').select('slug, show_pricing_preview').in('slug', [
        'animatori-petreceri-copii',
        'preturi-animatori-copii-bucuresti',
        'animatori-petreceri-copii-voluntari',
        'animatori-petreceri-copii-sector-6'
    ]);
    console.log(pages);
}
run();
