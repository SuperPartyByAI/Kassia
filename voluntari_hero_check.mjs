import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii-voluntari').single();
  const { data: hero } = await supabase.from('kassia_page_sections').select('content').eq('page_id', page.id).eq('section_type', 'hero').single();
  if (hero) {
    let c = typeof hero.content === 'string' ? JSON.parse(hero.content) : hero.content;
    console.log("Hero Image URL:", c.image_url);
  } else {
    console.log("No hero section found");
  }
})();
