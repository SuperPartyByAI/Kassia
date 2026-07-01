import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id, h1, slug').eq('slug', 'preturi-animatori-copii-bucuresti').single();
    if (!page) { console.log('Page not found'); return; }
    
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', page.id);
    console.log(`Page: ${page.slug}`);
    
    for (const sec of sections) {
        const text = JSON.stringify(sec.content).toLowerCase();
        if (text.includes('perfect') || text.includes('premium')) {
            console.log(`\nFound in section: ${sec.heading} (ID: ${sec.id})`);
            console.log('Content:', sec.content.body || sec.content);
        }
    }
}
run();
