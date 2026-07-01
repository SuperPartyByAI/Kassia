import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data } = await supabase.from('kassia_pricing_programs').select('*');
  data.forEach(p => {
    if (JSON.stringify(p).includes('Ideal')) console.log(p.title, "contains Ideal");
  });
})();
