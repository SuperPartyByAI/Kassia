import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

async function run() {
  const { data: pages } = await supabase.from('kassia_pages').select('*');
  for (const p of pages) {
    const fullStr = JSON.stringify(p).toLowerCase();
    if (fullStr.includes('branduri') || fullStr.includes('30 și 50') || fullStr.includes('teatru')) {
      console.log('Found in page:', p.id, p.path);
    }
  }
}
run();
