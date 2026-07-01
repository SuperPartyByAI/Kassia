import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3a754972-74d7-4632-9dfa-2aa9be7682db'; // animatori-petreceri-copii
  const { data: sections, error } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageId).order('order_index');
  
  if (error) { console.error("Backup Error:", error); return; }

  fs.writeFileSync('main_hub_real_backup.json', JSON.stringify(sections, null, 2));
  console.log(`Successfully backed up ${sections.length} sections to main_hub_real_backup.json`);
})();
