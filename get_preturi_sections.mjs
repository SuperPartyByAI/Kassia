import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'preturi-animatori-copii-bucuresti').single();
  if (!page) { console.log("Page not found"); return; }
  
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, heading').eq('page_id', page.id).order('order_index');
  console.log(sections);
})();
