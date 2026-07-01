import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
    const { data: sections, error } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', '3a754972-74d7-4632-9dfa-2aa9be7682db');
    if (error) console.error(error);
    if (sections) {
        console.log("All sections for this page:");
        sections.forEach(s => {
            console.log(`- [${s.content?.is_active}] ${s.heading} | ID: ${s.id}`);
            if (s.heading && s.heading.includes("Un personaj")) {
                console.log("    BODY:", s.content.body);
            }
        });
    }
})();
