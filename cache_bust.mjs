import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii-popesti-leordeni/').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
  
  for (const sec of sections) {
    if (sec.content && sec.content.image_url && sec.content.image_url.includes('.png')) {
      let url = sec.content.image_url;
      if (!url.includes('?v=2')) {
        url = url + '?v=2';
        sec.content.image_url = url;
        await supabase.from('kassia_page_sections').update({ content: sec.content }).eq('id', sec.id);
        console.log('Updated:', url);
      }
    }
  }
}
run();
