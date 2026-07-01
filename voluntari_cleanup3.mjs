import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = 'ab1e48b1-f898-4ddc-bd39-e479d5181674';
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageId).in('order_index', [7, 8, 9, 45]);
  
  let found = false;
  for (const s of sections) {
    if (s.content && s.content.body && /asigur/i.test(s.content.body)) {
      console.log(`Found 'asigur' in section order_index ${s.order_index}:`, s.heading);
      let newBody = s.content.body.replace(/asigurăm un flux continuu/g, 'păstrăm un flux clar între activități');
      newBody = newBody.replace(/asigura/ig, 'oferi');
      newBody = newBody.replace(/asigurat/ig, 'oferit');
      newBody = newBody.replace(/siguranță/ig, 'atenție sporită');
      
      await supabase.from('kassia_page_sections').update({ content: { ...s.content, body: newBody } }).eq('id', s.id);
      found = true;
      console.log("Updated.");
    }
  }
  if (!found) console.log("No 'asigur' words found in DB.");
})();
