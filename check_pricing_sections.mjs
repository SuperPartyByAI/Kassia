import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data } = await supabase.from('kassia_page_sections').select('*').eq('page_id', '49cf0ab3-2299-4d4f-8230-9f2ef0903813');
  console.log("Found sections:", data ? data.length : 0);
  if (data) {
    const bad = data.filter(s => JSON.stringify(s).toLowerCase().includes('asigur'));
    console.log("Bad sections:", bad);
  }
})();
