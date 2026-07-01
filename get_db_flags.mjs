import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });
const PAGE_ID = '33f0d4ca-9c60-4b2a-8fc5-c5cf7eb904f4';

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('slug, status, index_status, include_in_sitemap, canonical_url, updated_at').eq('id', PAGE_ID).single();
    console.log(JSON.stringify(page, null, 2));
}
run().catch(console.error);
