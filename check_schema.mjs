import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const pathsToCompare = [
    '/animatori-petreceri-copii/',
    '/animatori-petreceri-copii-popesti-leordeni/'
  ];

  for (const path of pathsToCompare) {
    console.log(`\n--- PAGE: ${path} ---`);
    const { data: page } = await supabase.from('kassia_pages').select('id, page_type').eq('path', path).single();
    if (!page) {
      console.log('Page not found!');
      continue;
    }
    console.log(`page_type: ${page.page_type}`);

    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
    console.log(`Sections count: ${sections.length}`);
    if (sections.length > 0) {
      console.log(`First section keys: ${Object.keys(sections[0]).join(', ')}`);
      sections.slice(0, 2).forEach((s, idx) => {
         console.log(`  Section ${idx}: sort_order=${s.sort_order}, order_index=${s.order_index}, section_type=${s.section_type}, heading=${s.heading}`);
         console.log(`  content keys: ${s.content ? Object.keys(s.content).join(', ') : 'null'}`);
      });
    }

    const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id);
    console.log(`FAQs count: ${faqs.length}`);
    if (faqs.length > 0) {
       console.log(`First FAQ keys: ${Object.keys(faqs[0]).join(', ')}`);
    }
  }
}

run();
