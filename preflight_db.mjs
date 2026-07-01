import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import { resolve } from 'path';

dotenv.config({ path: resolve(process.cwd(), '.env.local') });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function run() {
  const { data: page, error } = await supabase
    .from('kassia_pages')
    .select('id, slug, path')
    .eq('path', '/animatori-petreceri-copii')
    .single();

  if (error || !page) {
    console.error("Page not found by path. Trying slug...", error);
    const { data: page2, error2 } = await supabase
      .from('kassia_pages')
      .select('id, slug, path')
      .eq('slug', 'animatori-petreceri-copii')
      .single();
    if (error2 || !page2) return console.log("Not found.");
    console.log(`PAGE_ID: ${page2.id}`);
    fetchSections(page2.id);
  } else {
    console.log(`PAGE_ID: ${page.id}`);
    fetchSections(page.id);
  }

  async function fetchSections(pageId) {
    const { data: sections, error: secError } = await supabase
      .from('kassia_page_sections')
      .select('id, section_type, order_index, content')
      .eq('page_id', pageId)
      .order('order_index', { ascending: true });
      
    if (secError) {
       console.error("Sections error", secError);
       return;
    }
    
    for (const s of sections) {
       let contentStr = "";
       if (typeof s.content === 'object') contentStr = JSON.stringify(s.content);
       else contentStr = s.content;
       
       console.log(`\n--- SECTION ${s.id} | TYPE: ${s.section_type} | ORDER: ${s.order_index} ---`);
       const hasPrices = contentStr && (contentStr.match(/\d+\s*(lei|ron|euro)/i) || contentStr.match(/(pret|tarif|preț|prețul|tariful)/i));
       console.log(`Has Pricing Indicators: ${hasPrices ? 'YES' : 'NO'}`);
       console.log(`Snippet: ${contentStr ? contentStr.substring(0, 150).replace(/\n/g, ' ') : ''}...`);
    }
  }
}

run();
