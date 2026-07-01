import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '160e370f-0540-4501-b50f-62f88b6c8e83'; // animatori-petreceri-copii-bucuresti
  
  // Delete all current sections for this page
  await supabase.from('kassia_page_sections').delete().eq('page_id', pageId);
  
  // Read backup
  const backup = JSON.parse(fs.readFileSync('main_hub_sections_backup_v1.json', 'utf8'));
  
  // Insert backup
  const { error } = await supabase.from('kassia_page_sections').insert(backup);
  if (error) console.error("Error reverting:", error);
  else console.log("Successfully reverted orphaned page!");
})();
