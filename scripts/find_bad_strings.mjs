import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

async function run() {
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content');
  let totalFound = 0;
  for (const s of sections) {
    const fullStr = JSON.stringify(s.content).toLowerCase();
    if (fullStr.includes('branduri') || fullStr.includes('ilfov') || fullStr.includes('confetti') || fullStr.includes('disney') || fullStr.includes('70') || fullStr.includes('păpuși') || fullStr.includes('papusi')) {
      console.log(`Found suspicious words in section ${s.id}:`, fullStr.substring(0, 100) + "...");
      totalFound++;
    }
  }
  console.log(`Found in ${totalFound} sections`);
  
  const { data: pages } = await supabase.from('kassia_pages').select('id, title, meta_description');
  let pagesFound = 0;
  for (const p of pages) {
    const fullStr = JSON.stringify(p).toLowerCase();
    if (fullStr.includes('branduri') || fullStr.includes('ilfov') || fullStr.includes('confetti') || fullStr.includes('disney') || fullStr.includes('70') || fullStr.includes('păpuși')) {
      console.log(`Found suspicious words in page ${p.id}:`, p.title);
      pagesFound++;
    }
  }
  console.log(`Found in ${pagesFound} pages`);
}
run();
