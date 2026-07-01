import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = 'ab1e48b1-f898-4ddc-bd39-e479d5181674';

  // 1. Update: Ce evităm
  const { data: evitamData } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageId).eq('order_index', 8).single();
  let evitamBody = evitamData.content.body;
  evitamBody = evitamBody.replace('Pentru a asigura o petrecere reușită în curți mari sau vile, evităm cu atenție următoarele situații:', 'Pentru o desfășurare clară a activităților în curți mari sau vile, evităm următoarele situații:');
  
  await supabase.from('kassia_page_sections').update({ content: { ...evitamData.content, body: evitamBody } }).eq('id', evitamData.id);

  // 2. Update: Cum decurge programul pas cu pas
  const { data: pasData } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageId).eq('order_index', 9).single();
  let pasBody = pasData.content.body;
  pasBody = pasBody.replace('pentru siguranță și focus.', 'pentru orientare clară și atenție mai bună.');
  pasBody = pasBody.replace('modelaj baloane, pictură pe față sau surprize tematice.', 'modelaj de baloane, jocuri tematice sau momente interactive.');

  await supabase.from('kassia_page_sections').update({ content: { ...pasData.content, body: pasBody } }).eq('id', pasData.id);

  console.log("Database cleanup complete!");
})();
