import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

async function run() {
  const { data: pages } = await supabase.from('kassia_pages').select('*').limit(1);
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').limit(1);
  console.log('Pages keys:', pages && pages.length ? Object.keys(pages[0]) : 'None');
  console.log('Sections keys:', sections && sections.length ? Object.keys(sections[0]) : 'None');
}
run();
