import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const badIds = ['7f1eff59-f4e0-477b-83f4-37d10edd37e9', '4151cfcf-e93b-480d-bb00-2a28301ed708', '60442f3f-d226-47d9-8236-3d7bc02a1613'];
  const { data } = await supabase.from('kassia_page_sections').select('id, page_id, section_type, title, body').in('id', badIds);
  console.log(data);
})();
