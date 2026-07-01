import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data, error } = await supabase.from('kassia_page_sections').select('*');
  if (error) { console.log(error); return; }
  let found = false;
  data.forEach(row => {
    if (JSON.stringify(row).includes('lei')) {
      console.log('Found lei in section: ', row.id);
      found = true;
    }
  });
  if (!found) console.log("NO HARDCODED PRICES IN SECTIONS");
})();
