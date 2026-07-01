import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = 'ab1e48b1-f898-4ddc-bd39-e479d5181674';

  // Update: Ce evităm
  const { data: evitamData } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageId).eq('order_index', 8).single();
  let evitamBody = evitamData.content.body;
  evitamBody = evitamBody.replace('asigurăm un flux continuu.', 'păstrăm un flux clar între activități.');
  
  await supabase.from('kassia_page_sections').update({ content: { ...evitamData.content, body: evitamBody } }).eq('id', evitamData.id);

  console.log("Database cleanup complete!");
})();
