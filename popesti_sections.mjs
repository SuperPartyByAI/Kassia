import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_ID = '7bd530f1-2f5b-4c2a-b591-aae69f2ab473';

async function run() {
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, order_index, heading').eq('page_id', PAGE_ID).order('order_index', { ascending: true });
    console.log(JSON.stringify(sections, null, 2));
}
run().catch(console.error);
