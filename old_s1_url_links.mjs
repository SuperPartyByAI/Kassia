import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: sections } = await supabase.from('kassia_page_sections').select('page_id, content');
    const { data: faqs } = await supabase.from('kassia_faqs').select('page_id, answer');
    
    let found = [];
    sections.forEach(s => {
        const text = JSON.stringify(s.content);
        if (text.includes('/animatori-copii-sector-1/')) {
            found.push({ type: 'section', page_id: s.page_id });
        }
    });
    faqs.forEach(f => {
        if (f.answer && f.answer.includes('/animatori-copii-sector-1/')) {
            found.push({ type: 'faq', page_id: f.page_id });
        }
    });
    
    console.log("internal links către old URL:", found.length === 0 ? "0 links found" : JSON.stringify(found, null, 2));
}
run().catch(console.error);
