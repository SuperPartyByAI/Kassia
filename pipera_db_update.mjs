import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const slug = 'animatori-copii-pipera-bucuresti';
  
  // Update the row
  const { data: updated, error } = await supabase
    .from('kassia_pages')
    .update({
        status: 'draft',
        index_status: 'noindex',
        include_in_sitemap: false
    })
    .eq('slug', slug)
    .select('slug, status, index_status, include_in_sitemap, meta_description, title')
    .single();

  if (error) {
    console.error("Error updating:", error);
    process.exit(1);
  }
  
  console.log("DB Update successful:");
  console.log(JSON.stringify(updated, null, 2));
})();
