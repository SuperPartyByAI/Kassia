import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: s } = await supabase.from('kassia_page_sections').select('content').eq('heading', 'Zone acoperite în București și Ilfov').eq('page_id', '3a754972-74d7-4632-9dfa-2aa9be7682db').single();
  console.log(s.content.body);
})();
