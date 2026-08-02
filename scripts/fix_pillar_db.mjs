import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import { fileURLToPath } from 'url';
import { dirname, resolve } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
dotenv.config({ path: resolve(__dirname, '../.env.local') });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function fixPillar() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
  if (!page) { console.log("Page not found"); return; }
  
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
  
  for (const s of sections) {
    if (s.id === 'ffbe74a2-6efb-4255-a7c5-d8640b0c5d6e') {
      // Fix the text
      let body = s.content.body;
      body = body.replace('(fără a menționa branduri, punem accent pe siguranță)', '');
      const newContent = { ...s.content, body };
      await supabase.from('kassia_page_sections').update({ content: newContent, section_type: 'content' }).eq('id', s.id);
      console.log('Fixed section 1001');
    }
    if (s.id === 'a73a75dd-3154-46d5-a5db-b6e36d227160' || s.id === 'b4a9a834-8340-4145-9889-5ea257a18bbe') {
      await supabase.from('kassia_page_sections').update({ section_type: 'content' }).eq('id', s.id);
      console.log('Fixed draft type for', s.id);
    }
  }
}

fixPillar();
