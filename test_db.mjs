import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function test() {
  const { data: p, error: pe } = await supabase.from('kassia_pages').select('id, path').limit(10);
  console.log('Pages:', p?.length, pe?.message);
  
  const { data: ps, error: pse } = await supabase.from('kassia_page_sections').select('id').limit(10);
  console.log('Sections:', ps?.length, pse?.message);
}
test();
