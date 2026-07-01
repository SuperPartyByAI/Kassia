import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = 'ab1e48b1-f898-4ddc-bd39-e479d5181674';
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageId).in('order_index', [7, 8, 9, 45]);
  console.log(JSON.stringify(sections, null, 2));
})();
