import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: pages } = await supabase.from('kassia_pages').select('id, slug, meta_description');
  const voluntariPages = pages.filter(p => p.slug && p.slug.includes('voluntari'));
  console.log(JSON.stringify(voluntariPages, null, 2));
})();
