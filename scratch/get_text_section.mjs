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
  const { data: section, error } = await supabase
    .from('kassia_page_sections')
    .select('*')
    .eq('page_id', PAGE_ID)
    .eq('section_type', 'text')
    .single();

  if (error) {
    console.error(error);
  } else {
    console.log("Text Section Data:");
    console.log(JSON.stringify(section, null, 2));
  }
}

run();
