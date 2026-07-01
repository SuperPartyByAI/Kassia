import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: rows } = await supabase.from('kassia_pricing_programs').select('id, short_description').in('id', ['86cba5be-9118-4fd6-b4b0-ae7c091fae3e', '4bcfcd7d-aaf5-4260-85ed-0d27a5e7916b']);
    console.log(JSON.stringify(rows, null, 2));
}

run().catch(console.error);
