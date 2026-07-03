import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function check() {
  const { data, error } = await supabase.from('kassia_page_sections').select('id, page_id, heading').eq('section_type', 'costume_catalog');
  if (error) { console.error(error); return; }
  console.log(JSON.stringify(data, null, 2));
}
check();
