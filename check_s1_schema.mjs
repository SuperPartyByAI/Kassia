import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii-sector-1/').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
  
  sections.forEach((s, idx) => {
      console.log(`Sec ${idx}: type=${s.section_type}, heading=${s.heading}, order=${s.order_index}`);
  });
}

run();
