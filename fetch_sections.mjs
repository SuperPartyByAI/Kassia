import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function fetchSections() {
  const { data, error } = await supabase.from('kassia_page_sections').select('*').eq('section_type', 'costume_catalog');
  if (error) console.error(error);
  else console.log("Found sections:", data.length);
  
  if (data && data.length > 0) {
      import('fs').then(fs => fs.writeFileSync('catalog_section_db.json', JSON.stringify(data[0], null, 2)));
  }
}
fetchSections();
