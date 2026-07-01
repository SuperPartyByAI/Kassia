import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, title, heading, order_index').eq('page_id', page.id).order('order_index');
  
  sections.forEach(s => {
      console.log(`ID: ${s.id} | Type: ${s.section_type} | Heading: ${s.heading || s.title}`);
  });
})();
