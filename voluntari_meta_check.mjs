import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('slug, meta_description').eq('slug', 'animatori-petreceri-copii-voluntari').single();
  console.log("kassia_pages meta_description:", page.meta_description);

  const { data: hero } = await supabase.from('kassia_page_sections').select('content').eq('page_id', 'e6740b2f-da54-4638-b770-496f8c7bf9e0').eq('section_type', 'hero').single();
  console.log("Hero section content:", hero?.content);
})();
