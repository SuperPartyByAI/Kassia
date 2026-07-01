import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function check() {
  const { data: page } = await supabase.from('kassia_pages').select('id, page_type').eq('path', '/animatori-petreceri-copii-popesti-leordeni/').single();
  console.log('Page:', page);

  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
  console.log('Sections count:', sections.length);
  sections.forEach(s => {
      console.log(`- ${s.section_type} / ${s.heading} / image: ${s.content?.image_url}`);
  });
}
check();
