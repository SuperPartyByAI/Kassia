import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
    global: { fetch: fetch },
    realtime: { transport: WebSocket }
});

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii-sector-6/').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content, section_type, heading').eq('page_id', page.id);
  
  let found = false;
  for (const s of sections) {
      if (s.content) {
          let contentStr = JSON.stringify(s.content);
          if (contentStr.toLowerCase().includes('pictur')) {
              console.log(`Still found in: ${s.heading} (${s.section_type})`);
              found = true;
          }
      }
  }
  if (!found) console.log("DB is completely clean!");
}
run();
