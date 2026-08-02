import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

async function run() {
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', '3a754972-74d7-4632-9dfa-2aa9be7682db');
  console.log(JSON.stringify(sections, null, 2));
}
run();
