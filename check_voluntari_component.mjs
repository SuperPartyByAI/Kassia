import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii-voluntari').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('section_type, order_index, content').eq('page_id', page.id).order('order_index');
  if (sections) {
    sections.forEach(sec => {
      console.log(`Type: ${sec.section_type}, Order: ${sec.order_index}`);
    });
  }
})();
