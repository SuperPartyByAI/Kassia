import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii-voluntari').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, section_type, order_index').eq('page_id', page.id).order('order_index');
  
  console.log(`Page ID: ${page.id}`);
  sections.forEach((s) => console.log(`[${s.order_index}] ${s.section_type} - ${s.heading} (ID: ${s.id})`));
})();
