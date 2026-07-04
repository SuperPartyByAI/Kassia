import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.PUBLIC_SUPABASE_ANON_KEY);

async function check() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii/').single();
  if (!page) { console.log('Page not found'); return; }
  
  const { data: sections } = await supabase.from('kassia_sections').select('id, section_type, order_index, content').eq('page_id', page.id).order('order_index');
  
  console.log(sections.map(s => `${s.id} | ${s.section_type} | ${s.order_index} | ${s.content.substring(0, 50).replace(/\n/g, ' ')}...`).join('\n'));
}

check();
