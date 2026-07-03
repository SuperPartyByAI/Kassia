import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';
config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const path = '/animatori-petreceri-copii/';
  const { data: page } = await supabase.from('kassia_pages').select('*').eq('path', path).single();
  
  if (!page) {
      console.log("NOT FOUND PAGE");
      return;
  }
  
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id).order('order_index');
  const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id).order('order_index');
  const { data: links } = await supabase.from('kassia_internal_links').select('*').eq('source_page_id', page.id);
  
  fs.writeFileSync('kassia_pillar_db_data.json', JSON.stringify({ page, sections, faqs, links }, null, 2));
  console.log("FETCHED");
}
run();
