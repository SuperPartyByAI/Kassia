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
  const { data: sections, error } = await supabase
    .from('kassia_page_sections')
    .select('order_index, section_type, heading')
    .eq('page_id', PAGE_ID)
    .order('order_index');

  if (error) {
    console.error(error);
    return;
  }

  console.log(`Page has ${sections.length} sections in DB:`);
  sections.forEach(s => {
    console.log(`- Order: ${s.order_index} | Type: ${s.section_type} | Heading: ${s.heading}`);
  });
}

run();
