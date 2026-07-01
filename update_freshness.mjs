import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { error } = await supabase.from('kassia_pricing_programs').update({ internal_note: 'TEST_FRESHNESS_v2' }).eq('is_test', true);
  if (error) console.error("Error updating:", error.message);
  else console.log("Updated to v2 successfully!");
})();
