import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch } });
(async () => {
  const { data } = await supabase.from('kassia_pages').select('path').ilike('path', '%sector-4%').or('path.ilike.%berceni%');
  console.log("Pages found:", data);
})();
