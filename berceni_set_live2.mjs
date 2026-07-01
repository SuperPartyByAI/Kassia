import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { error: err1 } = await supabase.from('kassia_pages')
    .update({ 
      index_status: 'index', 
      include_in_sitemap: true 
    })
    .eq('slug', 'animatori-petreceri-copii-berceni');
  if (err1) console.error("Error updating new page:", err1);
  else console.log("Updated NEW page indexing status.");
})();
