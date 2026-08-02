import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

async function run() {
  const { data: sections } = await supabase.from('kassia_page_sections')
    .select('id, content')
    .in('id', ['a6a83db1-6df4-4ad8-8c4e-1811e615ca28', 'ebbc7501-8d58-4131-949c-6d4878009e4c']);

  for (const section of sections) {
    let contentStr = JSON.stringify(section.content);
    if (contentStr.includes('confettilor interzise')) {
      contentStr = contentStr.replace(/folosirea confettilor interzise sau a materialelor care pot murdări permanent podelele/g, 'orice activitate care ar putea afecta suprafețele');
    }
    if (contentStr.includes('Mascote Disney')) {
      contentStr = contentStr.replace(/Mascote Disney/g, 'Mascote din Povești');
    }
    await supabase.from('kassia_page_sections').update({ content: JSON.parse(contentStr) }).eq('id', section.id);
    console.log(`Updated ${section.id}`);
  }
}
run();
