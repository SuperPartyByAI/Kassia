import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: pages } = await supabase.from('kassia_pages').select('id, slug').in('slug', ['animatori-petreceri-copii-voluntari', 'preturi-animatori-copii-bucuresti']);
  const pageIds = pages.map(p => p.id);
  
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').in('page_id', pageIds);
  sections.forEach(sec => {
    console.log(`Page: ${pages.find(p => p.id === sec.page_id).slug}, Section Order: ${sec.order_index}, Component: ${sec.component_type}`);
    if (sec.content) {
      const str = JSON.stringify(sec.content);
      if (str.includes('490') || str.includes('790') || str.includes('350') || str.includes('Ideal') || str.includes('TEST_FRESHNESS')) {
        console.log(` ---> HAS DIRTY CONTENT!`);
      }
    }
  });
})();
