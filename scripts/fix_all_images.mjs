import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import { fileURLToPath } from 'url';
import { dirname, resolve } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
dotenv.config({ path: resolve(__dirname, '../.env.local') });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function fix() {
  const { data: sections } = await supabase.from('kassia_page_sections').select('*');
  let count = 0;
  for (const s of sections) {
    if (s.content && s.content.body && typeof s.content.body === 'string') {
      let changed = false;
      let newBody = s.content.body.replace(/<img(?![^>]*\bwidth=)[^>]+>/gi, match => {
        changed = true;
        return match.replace('<img', '<img width="400" height="400"');
      });
      if (changed) {
        await supabase.from('kassia_page_sections').update({ content: { ...s.content, body: newBody } }).eq('id', s.id);
        count++;
      }
    }
  }
  console.log(`Updated images in ${count} sections.`);
}
fix();
