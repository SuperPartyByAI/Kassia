import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, title, heading, body').eq('page_id', page.id);
  
  sections.forEach(s => {
      const content = JSON.stringify(s).toLowerCase();
      const toxics = ['perfect', 'premium', 'magie', 'pachete'].filter(t => content.includes(t));
      if (toxics.length > 0) {
          console.log(`Toxic [${toxics.join(', ')}] in section ${s.id} (type: ${s.section_type}) - Heading: ${s.heading}`);
      }
  });
})();
