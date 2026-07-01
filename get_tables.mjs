import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data, error } = await supabase.rpc('get_tables'); // Or a generic raw query
  if (error) {
     const { data: tables } = await supabase.from('information_schema.tables').select('table_name').eq('table_schema', 'public');
     console.log(tables?.map(t => t.table_name).join('\n'));
  } else {
     console.log(data);
  }
})();
