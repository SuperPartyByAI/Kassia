import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, page_id, heading, content').ilike('heading', '%sectoare%');
  for (const s of sections) {
    if (s.page_id === '3a754972-74d7-4632-9dfa-2aa9be7682db') {
        console.log(`Found on Main Hub: ${s.heading} (${s.id})`);
    } else {
        console.log(`Found on other page: ${s.heading} (Page ID: ${s.page_id})`);
    }
  }
})();
