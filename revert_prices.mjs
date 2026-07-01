import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  // Revert 1 personaj
  await supabase.from('kassia_pricing_programs')
    .update({ price_amount: 490, price_suffix: '/ 2 ore', duration_label: '2 ore' })
    .eq('title', '1 personaj animator');

  // Revert 2 personaje
  await supabase.from('kassia_pricing_programs')
    .update({ price_amount: 790, price_suffix: '/ 2 ore', duration_label: '2-3 ore' })
    .eq('title', '2 personaje animatoare');

  // Revert picioroange
  await supabase.from('kassia_pricing_programs')
    .update({ price_amount: 350, price_suffix: '/ 1 oră', duration_label: '1-2 ore' })
    .eq('title', 'Animatori pe picioroange');

  console.log("Prices successfully REVERTED to the accepted values.");
})();
