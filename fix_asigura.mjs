import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: section } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', '3ac893ee-a571-4c60-a340-6da788800f1b').eq('section_type', 'logistics').single();
  
  if (section) {
     section.content.text = section.content.text.replace("Echipa noastră asigură recuzita", "Echipa noastră aduce recuzita");
     const { error } = await supabase.from('kassia_page_sections').update({ content: section.content }).eq('id', section.id);
     if (!error) console.log("Fixed 'asigura' violation.");
  }
})();
