import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  // Update 1 personaj
  await supabase.from('kassia_pricing_programs')
    .update({ price_amount: 280, price_suffix: '/ 1 oră', duration_label: '1-3 ore' })
    .eq('title', '1 personaj animator');

  // Update 2 personaje
  await supabase.from('kassia_pricing_programs')
    .update({ price_amount: 490, price_suffix: '/ 1 oră', duration_label: '1-3 ore' })
    .eq('title', '2 personaje animatoare');

  // Update picioroange
  await supabase.from('kassia_pricing_programs')
    .update({ price_amount: 1450, price_suffix: '/ 1 oră' })
    .eq('title', 'Animatori pe picioroange');

  console.log("Prices successfully updated to match the history.");
})();
