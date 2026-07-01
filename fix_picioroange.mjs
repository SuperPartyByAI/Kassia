import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: p } = await supabase.from('kassia_pricing_programs').select('includes_list').eq('title', 'Animatori pe picioroange').single();
  if (p && p.includes_list) {
    const updatedList = p.includes_list.map(item => item.replace('Ideal pentru', 'Potrivit pentru'));
    const { error } = await supabase.from('kassia_pricing_programs').update({ includes_list: updatedList }).eq('title', 'Animatori pe picioroange');
    if (error) console.error("Error", error);
    else console.log("Updated Picioroange");
  }
})();
