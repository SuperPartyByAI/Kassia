import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

async function run() {
  const { data: sections } = await supabase.from('kassia_page_sections').select('*');
  for (const s of sections) {
    const fullStr = JSON.stringify(s).toLowerCase();
    if (fullStr.includes('branduri') || fullStr.includes('70 de personaje') || fullStr.includes('mascote disney') || fullStr.includes('tun de confetti') || fullStr.includes('teatru de') || fullStr.includes('30 și 50')) {
      console.log('Found in section:', s.id, s.section_type);
    }
  }
}
run();
