import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: sec } = await supabase.from('kassia_page_sections').select('content').eq('id', 'f38cc1a3-fbaf-40dd-95e9-d94054ebfc61').single();
  console.log(sec.content.body);
})();
