import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: sec } = await supabase.from('kassia_page_sections').select('content').eq('id', '830d33f0-91fe-4636-b32a-2dee3fa9575a').single();
  console.log("Section content:", typeof sec.content === 'string' ? sec.content : JSON.stringify(sec.content));
})();
