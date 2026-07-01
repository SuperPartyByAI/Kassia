import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
    const { data: sections, error } = await supabase.from('kassia_page_sections').select('id, content').eq('heading', 'Un personaj animator sau două personaje animatoare?').eq('page_id', '3a754972-74d7-4632-9dfa-2aa9be7682db');
    if (error) console.error(error);
    if (sections) {
        console.log(`Found ${sections.length} sections for that heading.`);
        sections.forEach(s => {
            console.log(`\nID: ${s.id} | is_active: ${s.content?.is_active}`);
            console.log("Body:", s.content.body);
        });
    }
})();
