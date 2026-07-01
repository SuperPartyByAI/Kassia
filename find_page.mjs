import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: pages } = await supabase.from('kassia_pages').select('id, slug, title');
  const { data: sections } = await supabase.from('kassia_page_sections').select('page_id');
  
  pages.forEach(p => {
      const count = sections.filter(s => s.page_id === p.id).length;
      if (p.slug.includes('animatori-petreceri-copii') && count > 0) {
          console.log(`Slug: ${p.slug} | ID: ${p.id} | Sections: ${count}`);
      }
  });
})();
