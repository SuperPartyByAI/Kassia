import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: sections, error } = await supabase.from('kassia_page_sections').select('id, section_type, heading, order_index, content').eq('page_id', '3a754972-74d7-4632-9dfa-2aa9be7682db').order('order_index');
  
  if (error) { console.error("DB ERROR:", error); return; }

  console.log(`FOUND ${sections.length} SECTIONS`);
  sections.forEach(s => {
      console.log(`[Order: ${s.order_index}] [Type: ${s.section_type}] Heading: "${s.heading || 'N/A'}"`);
  });
})();
