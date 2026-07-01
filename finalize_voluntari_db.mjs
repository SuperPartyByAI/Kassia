import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
async function run() {
  const { data, error } = await supabase
    .from('kassia_pages')
    .update({ index_status: 'index', include_in_sitemap: true })
    .eq('path', '/animatori-petreceri-copii-voluntari/');
  if (error) console.error(error);
  else console.log('DB updated to index and sitemap true.');
}
run();
