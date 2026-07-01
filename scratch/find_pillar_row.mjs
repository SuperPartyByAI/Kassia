import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import ws from 'ws';

dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: ws }
});

const PAGE_ID = '33f0d4ca-9c60-4b2a-8fc5-c5cf7eb904f4'; // Sector 1 Page ID

async function run() {
  const { data: sections, error } = await supabase
    .from('kassia_page_sections')
    .select('order_index, section_type, heading')
    .eq('page_id', PAGE_ID)
    .order('order_index');

  if (error) {
    console.error(error);
    return;
  }

  console.log(`Sector 1 page has ${sections.length} sections in DB:`);
  sections.forEach(s => {
    console.log(`- Order: ${s.order_index} | Type: ${s.section_type} | Heading: ${s.heading}`);
  });
}

run();
