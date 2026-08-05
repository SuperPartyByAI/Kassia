import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '/opt/kassia-site/.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content');
  let count = 0;
  for (const s of sections) {
    if (s.content && typeof s.content === 'object') {
      let str = JSON.stringify(s.content);
      if (str.includes('width=\\"400\\" height=\\"400\\"')) {
        str = str.replace(/ width=\\"400\\" height=\\"400\\"/g, '');
        await supabase.from('kassia_page_sections').update({ content: JSON.parse(str) }).eq('id', s.id);
        count++;
      }
    }
  }
  console.log('Reverted global 400x400 in sections:', count);
}
run();
