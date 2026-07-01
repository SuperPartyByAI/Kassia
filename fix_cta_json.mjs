import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: sec } = await supabase.from('kassia_page_sections').select('id, content').eq('id', '830d33f0-91fe-4636-b32a-2dee3fa9575a').single();
  let c = typeof sec.content === 'string' ? JSON.parse(sec.content) : sec.content;
  
  c.cta_url = 'https://wa.me/40768098268?text=Buna!%20As%20dori%20detalii%20pentru%20animatori%20la%20o%20petrecere%20de%20copii%20in%20Berceni.';
  c.cta_text = 'Scrie-ne pe WhatsApp pentru detalii';
  
  await supabase.from('kassia_page_sections').update({ content: c }).eq('id', sec.id);
  console.log("CTA successfully updated in JSON attributes!");
})();
