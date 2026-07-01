import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '160e370f-0540-4501-b50f-62f88b6c8e83'; // animatori-petreceri-copii-bucuresti
  const { data: sections, error } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageId).order('order_index');
  
  if (error) { console.error("Backup Error:", error); return; }

  fs.writeFileSync('main_hub_sections_backup_v1.json', JSON.stringify(sections, null, 2));
  console.log(`Successfully backed up ${sections.length} sections to main_hub_sections_backup_v1.json`);
})();
