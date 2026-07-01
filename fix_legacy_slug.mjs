import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data, error } = await supabase
    .from('kassia_pages')
    .update({ slug: 'animatori-copii-berceni-ilfov-legacy' })
    .eq('slug', 'animatori-copii-berceni-ilfov');
    
  if (error) {
      console.error("Error updating slug:", error);
  } else {
      console.log("Legacy slug renamed successfully to prevent 200 OK fallback.");
  }
})();
