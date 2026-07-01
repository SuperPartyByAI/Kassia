import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii-popesti-leordeni/').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
  
  const updates = {
    'Personaje și mascote pentru tematici diferite': '/images/locatii/popesti_personaje_mascote_v2_1782287764055.png?v=3',
    'Detalii pentru program și deplasare': '/images/locatii/popesti_detalii_program_v2_1782287775863.png?v=3',
    'Asistență pentru părinți': '/images/locatii/popesti_faq_trust_v2_1782287786567.png?v=3'
  };

  for (const sec of sections) {
    if (updates[sec.heading]) {
      let content = sec.content;
      if (typeof content === 'string') content = JSON.parse(content);
      content.image_url = updates[sec.heading];
      await supabase.from('kassia_page_sections').update({ content }).eq('id', sec.id);
      console.log(`Updated ${sec.heading} -> ${content.image_url}`);
    }
  }
}

run();
