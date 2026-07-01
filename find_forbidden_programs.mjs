import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: programs } = await supabase.from('kassia_pricing_programs').select('*');
    for (const prog of programs) {
        const text = JSON.stringify(prog).toLowerCase();
        if (text.includes('perfect') || text.includes('premium')) {
            console.log(`\nFound in program: ${prog.title} (ID: ${prog.id})`);
            console.log(prog);
        }
    }
}
run();
