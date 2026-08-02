import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

async function run() {
  const ids = [
    'b4a9a834-8340-4145-9889-5ea257a18bbe',
    '49271a4b-4ef3-4562-88d1-9d58f3785a09',
    'ffbe74a2-6efb-4255-a7c5-d8640b0c5d6e',
    'a73a75dd-3154-46d5-a5db-b6e36d227160'
  ];
  
  for (const id of ids) {
    const { error } = await supabase.from('kassia_page_sections').update({ section_type: 'draft' }).eq('id', id);
    if (!error) console.log(`Drafted ${id}`);
    else console.error(error);
  }
}
run();
