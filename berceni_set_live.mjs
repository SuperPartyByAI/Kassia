import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  // 1. Update New URL to index/sitemap
  const { error: err1 } = await supabase.from('kassia_pages')
    .update({ 
      index_status: 'index, follow', 
      include_in_sitemap: true 
    })
    .eq('slug', 'animatori-petreceri-copii-berceni');
  if (err1) console.error("Error updating new page:", err1);
  else console.log("Updated NEW page indexing status.");

  // 2. Update Old URL to noindex/no-sitemap
  const { error: err2 } = await supabase.from('kassia_pages')
    .update({ 
      index_status: 'noindex', 
      include_in_sitemap: false 
    })
    .eq('slug', 'animatori-copii-berceni');
  if (err2) console.error("Error updating old page:", err2);
  else console.log("Updated OLD page indexing status.");
})();
