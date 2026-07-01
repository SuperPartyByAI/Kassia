import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const SECTION_ID = '69cfe7db-c072-4cdc-94c1-f300100009be';

async function run() {
    console.log("=== DB CHECK ===");
    const { data: section } = await supabase.from('kassia_page_sections').select('*').eq('id', SECTION_ID).single();
    
    if (section) {
        console.log(JSON.stringify({
            id: section.id,
            page_id: section.page_id,
            section_type: section.section_type,
            order_index: section.order_index,
            heading: section.heading,
            subheading: section.content?.subheading,
            hasBody: !!section.content?.body,
            is_active: section.content?.is_active,
            created_at: section.created_at,
            updated_at: section.updated_at
        }, null, 2));
    } else {
        console.log("Section NOT FOUND in DB!");
    }
}
run().catch(console.error);
