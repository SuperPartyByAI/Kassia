import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.PUBLIC_SUPABASE_ANON_KEY, { global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data, error } = await supabase.from('kassia_pricing_programs').select('*').eq('is_active', true);
  console.log("Anon fetch result:", data ? data.length : error);
})();
