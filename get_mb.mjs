import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: mbRow, error } = await supabase.from('kassia_page_sections').select('*').eq('id', '6b8917fc-2774-45eb-ac96-e668dbfd965b');
    console.log(JSON.stringify(mbRow, null, 2));
}
run().catch(console.error);
