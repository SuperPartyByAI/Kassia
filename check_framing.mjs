import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: prog } = await supabase.from('kassia_pricing_programs').select('includes_list').eq('title', '2 personaje animatoare').single();
  console.log(JSON.stringify(prog.includes_list, null, 2));
})();
