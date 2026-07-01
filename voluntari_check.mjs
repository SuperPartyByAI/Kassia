import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii-voluntari').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('heading, content, order_index, section_type').eq('page_id', page.id).order('order_index');
  sections.forEach(s => {
     let c = typeof s.content === 'string' ? JSON.parse(s.content) : s.content;
     console.log(`\n--- [${s.order_index}] ${s.heading} (${s.section_type}) ---`);
     console.log(`Image URL: ${c.image_url}`);
  });
})();
