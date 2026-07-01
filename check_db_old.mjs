import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: pages } = await supabase.from('kassia_pages').select('id, path, slug').eq('slug', 'animatori-copii-berceni');
  console.log(JSON.stringify(pages, null, 2));
  
  if (pages && pages.length > 0) {
    const pageId = pages[0].id;
    const { data: sections } = await supabase.from('kassia_page_sections').select('heading, content').eq('page_id', pageId);
    console.log(JSON.stringify(sections, null, 2));
  }
})();
