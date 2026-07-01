import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data } = await supabase.from('kassia_pricing_programs').select('id, title, duration_label, price_amount, show_on_local_preview, show_price_on_local_preview').in('title', ['1 personaj animator', '2 personaje animatoare']).order('order_index');
  console.log(data);
})();
