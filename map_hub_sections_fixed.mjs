import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('id, slug').eq('slug', 'animatori-petreceri-copii-bucuresti').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, title, heading, body, order_index').eq('page_id', page.id).order('order_index');
  
  sections.forEach(s => {
      const isProtected = s.section_type === 'reviews' || s.section_type === 'testimonials';
      const content = JSON.stringify(s).toLowerCase();
      const toxic = ['perfect', 'premium', 'magie', 'pachete', 'asigur'].filter(t => content.includes(t));
      
      console.log(`[Order: ${s.order_index}] Type: ${s.section_type} | Heading: ${s.heading || s.title}`);
      if (toxic.length > 0) {
          console.log(`   -> Toxic words: ${toxic.join(', ')} (Protected: ${isProtected})`);
      }
  });
})();
