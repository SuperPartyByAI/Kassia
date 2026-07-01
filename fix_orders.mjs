import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';

  const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, order_index').eq('page_id', pageId);
  // Re-order them sequentially
  let newOrder = [
    { heading: 'Bucurie și interacțiune pentru cei mici', idx: 1 },
    { heading: 'Berceni urban sau comuna Berceni: alegem programul după locație', idx: 2 },
    { heading: 'Animatori pentru petreceri în cartierul Berceni și zona de sud', idx: 3 },
    { heading: 'Activități care se pot integra în program', idx: 4 },
    { heading: 'Petreceri în comuna Berceni, curți și ansambluri rezidențiale', idx: 5 },
    { heading: 'Cum alegem programul în funcție de spațiu', idx: 6 },
    { heading: 'Ce detalii ne ajută înainte de eveniment', idx: 7 }
  ];
  for (let orderItem of newOrder) {
     let sec = sections.find(s => s.heading === orderItem.heading);
     if (sec) {
         await supabase.from('kassia_page_sections').update({ order_index: orderItem.idx }).eq('id', sec.id);
     }
  }
  console.log("Ordered perfectly.");
})();
