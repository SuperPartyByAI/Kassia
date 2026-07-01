import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import { resolve } from 'path';

dotenv.config({ path: resolve(process.cwd(), '.env.local') });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function run() {
  const { data: page, error } = await supabase
    .from('pages')
    .select('id, slug')
    .eq('slug', 'animatori-petreceri-copii')
    .single();

  if (error || !page) {
    console.error("Page not found", error);
    return;
  }
  
  console.log(`PAGE_ID: ${page.id}`);

  const { data: sections, error: secError } = await supabase
    .from('sections')
    .select('id, section_type, section_order, content')
    .eq('page_id', page.id)
    .order('section_order', { ascending: true });
    
  if (secError) {
     console.error("Sections error", secError);
     return;
  }
  
  for (const s of sections) {
     let contentStr = "";
     if (typeof s.content === 'object') contentStr = JSON.stringify(s.content);
     else contentStr = s.content;
     
     console.log(`\n--- SECTION ${s.id} | TYPE: ${s.section_type} | ORDER: ${s.section_order} ---`);
     const hasPrices = contentStr.match(/\\d+\\s*(lei|ron|euro)/i) || contentStr.match(/(pret|tarif|preț|prețul|tariful)/i);
     console.log(`Has Pricing Indicators: ${hasPrices ? 'YES' : 'NO'}`);
     console.log(`Snippet: ${contentStr.substring(0, 150).replace(/\n/g, ' ')}...`);
  }
}

run();
