import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { error } = await supabase.from('kassia_pages').update({ updated_at: new Date().toISOString() }).eq('id', '3a754972-74d7-4632-9dfa-2aa9be7682db');
  if (error) console.error(error);
  else console.log("Updated kassia_pages updated_at to trigger potential webhooks.");
})();
