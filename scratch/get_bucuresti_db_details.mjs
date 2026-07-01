import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import ws from 'ws';

dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: ws }
});

const PAGE_ID = '160e370f-0540-4501-b50f-62f88b6c8e83';

async function run() {
  console.log("=== DB PAGE METADATA ===");
  const { data: page, error: pageErr } = await supabase
    .from('kassia_pages')
    .select('id, slug, title, h1, meta_title, meta_description, status, index_status, include_in_sitemap, canonical_url')
    .eq('id', PAGE_ID)
    .single();

  if (pageErr) {
    console.error(pageErr);
  } else {
    console.log(JSON.stringify(page, null, 2));
  }

  console.log("\n=== DB SECTIONS ===");
  const { data: sections, error: secErr } = await supabase
    .from('kassia_page_sections')
    .select('id, section_type, order_index, heading')
    .eq('page_id', PAGE_ID)
    .order('order_index');

  if (secErr) {
    console.error(secErr);
  } else {
    console.log(`Total sections: ${sections.length}`);
    sections.forEach(s => {
      console.log(`- ID: ${s.id} | Type: ${s.section_type} | Order: ${s.order_index} | Heading: ${s.heading}`);
    });
  }

  console.log("\n=== DB FAQS ===");
  const { data: faqs, error: faqErr } = await supabase
    .from('kassia_faqs')
    .select('id, order_index, question')
    .eq('page_id', PAGE_ID)
    .order('order_index');

  if (faqErr) {
    console.error(faqErr);
  } else {
    console.log(`Total FAQs: ${faqs.length}`);
    faqs.forEach(f => {
      console.log(`- ID: ${f.id} | Order: ${f.order_index} | Q: ${f.question}`);
    });
  }
}

run();
