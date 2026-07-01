import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data, error } = await supabase.from('kassia_pages').select('slug').limit(1);
  if (error) console.log(error);
  else console.log("Connected to Supabase.");
  
  // A quick way to get tables is to fetch from pg_tables via a generic call, but REST API doesn't expose it.
  // I will check the Kassia pages logic.
})();
