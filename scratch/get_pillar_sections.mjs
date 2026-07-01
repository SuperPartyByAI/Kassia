import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import ws from 'ws';

dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: ws }
});

const PAGE_ID = '160e370f-0540-4501-b50f-62f88b6c8e83'; // animatori-petreceri-copii-bucuresti

async function run() {
  console.log("=== SECTIONS ===");
  const { data: sections, error: secError } = await supabase
    .from('kassia_page_sections')
    .select('*')
    .eq('page_id', PAGE_ID)
    .order('order_index');

  if (secError) console.error(secError);
  else {
    sections.forEach(s => {
      console.log(`[Order: ${s.order_index}] Type: ${s.section_type} | Heading: ${s.heading}`);
      console.log("Content Snippet:", typeof s.content === 'string' ? s.content.substring(0, 300) : JSON.stringify(s.content).substring(0, 300));
      console.log("-----------------------------------------");
    });
  }

  console.log("\n=== FAQS ===");
  const { data: faqs, error: faqError } = await supabase
    .from('kassia_faqs')
    .select('*')
    .eq('page_id', PAGE_ID)
    .order('order_index');

  if (faqError) console.error(faqError);
  else {
    faqs.forEach(f => {
      console.log(`[Order: ${f.order_index}] Q: ${f.question}`);
      console.log(`A: ${f.answer}`);
      console.log("-----------------------------------------");
    });
  }

  console.log("\n=== GALLERY ITEMS ===");
  const { data: gallery, error: galError } = await supabase
    .from('kassia_gallery_items')
    .select('*')
    .eq('page_id', PAGE_ID)
    .order('order_index');

  if (galError) console.error(galError);
  else {
    console.log(`Found ${gallery.length} gallery items.`);
    gallery.forEach(g => {
      console.log(`- ${g.url} | Alt: ${g.alt_text}`);
    });
  }
}

run();
