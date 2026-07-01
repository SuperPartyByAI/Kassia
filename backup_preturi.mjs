import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import fs from 'fs';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'preturi-animatori-copii-bucuresti').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id).order('order_index');
  
  fs.writeFileSync('preturi_backup.json', JSON.stringify(sections, null, 2));
  console.log("Backup saved to preturi_backup.json. Total sections:", sections.length);
})();
