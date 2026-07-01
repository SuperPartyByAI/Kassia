import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
    auth: { persistSession: false },
    global: { fetch: fetch },
    realtime: { transport: WebSocket }
});

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii-sector-6/').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content, section_type, heading').eq('page_id', page.id);
  
  for (const s of sections) {
    if (s.section_type === 'faq' && s.content && Array.isArray(s.content.items)) {
      let updated = false;
      const newItems = s.content.items.map(item => {
        let newItem = { ...item };
        if (newItem.answer) {
          let newAnswer = newItem.answer.replace(/pictură pe față/gi, 'activități creative')
                                        .replace(/pictura pe fata/gi, 'activități creative')
                                        .replace(/face painting/gi, 'momente creative');
          if (newAnswer !== newItem.answer) {
            newItem.answer = newAnswer;
            updated = true;
          }
        }
        return newItem;
      });

      if (updated) {
        console.log(`Updating FAQ section: ${s.heading}`);
        const newContent = { ...s.content, items: newItems };
        await supabase.from('kassia_page_sections').update({ content: newContent }).eq('id', s.id);
      }
    }
  }
  console.log("FAQ pass complete.");
}
run();
