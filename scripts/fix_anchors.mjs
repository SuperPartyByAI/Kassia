import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import { fileURLToPath } from 'url';
import { dirname, resolve } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
dotenv.config({ path: resolve(__dirname, '../.env.local') });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function fix() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii/').single();
  if (!page) throw new Error("Page not found");
  
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
  
  let changes = 0;
  for (const s of sections) {
    if (s.content && s.content.body && typeof s.content.body === 'string') {
      let body = s.content.body;
      let newBody = body
        .replace(/href="\/pachete-animatori(?:-copii-bucuresti)?\/"/g, 'href="/preturi-animatori-copii-bucuresti/"')
        .replace(/href="\/personaje-petreceri(?:-copii)?\/"/g, 'href="/personaje-animatori-copii-bucuresti/"')
        .replace(/href="\/animatori-cu-mascote(?:-copii-bucuresti)?\/"/g, 'href="/mascote-petreceri-copii-bucuresti/"')
        .replace(/href="https:\/\/www\.kassia\.ro\/pachete-animatori\/"/g, 'href="https://www.kassia.ro/preturi-animatori-copii-bucuresti/"')
        .replace(/href="https:\/\/www\.kassia\.ro\/personaje-petreceri\/"/g, 'href="https://www.kassia.ro/personaje-animatori-copii-bucuresti/"')
        .replace(/href="https:\/\/www\.kassia\.ro\/animatori-cu-mascote\/"/g, 'href="https://www.kassia.ro/mascote-petreceri-copii-bucuresti/"');
        
      if (body !== newBody) {
        await supabase.from('kassia_page_sections').update({ content: { ...s.content, body: newBody } }).eq('id', s.id);
        changes++;
      }
    }
  }
  console.log(`Updated ${changes} sections with anchor fixes.`);
}
fix();
