import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  // Fix 'Ideal pentru...'
  const { error: err1 } = await supabase.from('kassia_pricing_programs')
    .update({ short_description: 'Potrivit pentru grupuri mai mari, spații deschise sau curți mari (peste 15 copii).' })
    .eq('title', '2 personaje animatoare');
  if (err1) console.error("Err1", err1);
  else console.log("Updated description for 2 personaje");

  // Fix 'Balloon Exploder...'
  const { data: p1 } = await supabase.from('kassia_pricing_programs').select('includes_list').eq('title', '1 personaj animator').single();
  if (p1 && p1.includes_list) {
    const updatedList = p1.includes_list.map(item => item.replace('pachetul de', 'programul de'));
    const { error: err2 } = await supabase.from('kassia_pricing_programs')
      .update({ includes_list: updatedList })
      .eq('title', '1 personaj animator');
    if (err2) console.error("Err2", err2);
    else console.log("Updated includes_list for 1 personaj");
  }
})();
