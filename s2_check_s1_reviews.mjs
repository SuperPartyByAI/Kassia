import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const S1_PAGE_ID = '33f0d4ca-9c60-4b2a-8fc5-c5cf7eb904f4'; // Sector 1
const VOL_SLUG = 'animatori-petreceri-copii-voluntari';
const PAGE_ID = 'f1e7d23a-c1a7-4c92-b4ff-5716df63309a';

async function run() {
    const { data: s1Page } = await supabase.from('kassia_pages').select('show_reviews').eq('id', S1_PAGE_ID).single();
    const { data: volPage } = await supabase.from('kassia_pages').select('show_reviews').eq('slug', VOL_SLUG).single();
    const { data: s2Page } = await supabase.from('kassia_pages').select('show_reviews').eq('id', PAGE_ID).single();
    console.log(`Sector 1 show_reviews value: ${s1Page.show_reviews}`);
    console.log(`Voluntari show_reviews value: ${volPage.show_reviews}`);
    console.log(`Sector 2 show_reviews current: ${s2Page.show_reviews}`);
}
run().catch(console.error);
