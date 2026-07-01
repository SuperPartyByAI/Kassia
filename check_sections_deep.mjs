import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data, error } = await supabase.from('kassia_page_sections').select('*');
  let found = false;
  data.forEach(row => {
    const s = JSON.stringify(row);
    if (s.includes('490') || s.includes('790') || s.includes('350') || s.includes('de la') || s.includes('pachetul de 2 ore') || s.includes('Ideal pentru') || s.includes('TEST_FRESHNESS')) {
      console.log('Found toxic string in section: ', row.id);
      found = true;
    }
  });
  if (!found) console.log("NO TOXIC STRINGS IN SECTIONS");
})();
