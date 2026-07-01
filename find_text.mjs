import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: secs } = await supabase.from('kassia_page_sections').select('id, page_id, heading, content').ilike('content->>body', '%Pentru variantele de program%');
  for (const s of secs) {
      console.log(`Found in section: ${s.id} | Page ID: ${s.page_id}`);
  }
})();
