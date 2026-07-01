import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  // Fetch all 2 personaje cards
  const { data: cards } = await supabase.from('kassia_pricing_programs').select('id, includes_list').eq('title', '2 personaje animatoare');
  
  for (const card of cards) {
    const newList = card.includes_list.map(item => item.replace('pachetul', 'programul'));
    await supabase.from('kassia_pricing_programs').update({ includes_list: newList }).eq('id', card.id);
  }
  
  console.log("Fixed 'pachetul' -> 'programul' in DB.");
})();
