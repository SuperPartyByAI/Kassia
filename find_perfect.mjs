import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id, slug').eq('slug', 'preturi-animatori-copii-bucuresti').single();
    const { data: sections } = await supabase.from('kassia_page_sections').select('heading, content').eq('page_id', page.id);
    
    for (const sec of sections) {
        const text = JSON.stringify(sec).toLowerCase();
        if (text.includes('perfect')) {
            console.log('Found perfect in page section:', sec.heading);
            console.log(sec.content);
        }
    }
}
run();
