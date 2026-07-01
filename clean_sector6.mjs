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
  
  if (!page) {
    console.error("Page not found");
    return;
  }

  const { data: sections, error: fetchErr } = await supabase.from('kassia_page_sections').select('id, content, section_type, heading').eq('page_id', page.id);
  
  if (fetchErr) {
    console.error(fetchErr);
    return;
  }

  for (const s of sections) {
    if (s.content && typeof s.content === 'object' && s.content.body) {
      let oldBody = s.content.body;
      let newBody = oldBody.replace(/pictură pe față/gi, 'activități creative')
                           .replace(/pictura pe fata/gi, 'activități creative')
                           .replace(/face painting/gi, 'momente creative');

      if (oldBody !== newBody) {
        console.log(`Updating section: ${s.heading} (${s.section_type})`);
        const newContent = { ...s.content, body: newBody };
        const { error } = await supabase.from('kassia_page_sections').update({ content: newContent }).eq('id', s.id);
        if (error) console.error("Error updating:", error);
      }
    }

    if (s.content && typeof s.content === 'object' && Array.isArray(s.content.items)) {
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
        const { error } = await supabase.from('kassia_page_sections').update({ content: newContent }).eq('id', s.id);
        if (error) console.error("Error updating FAQ:", error);
      }
    }
  }
  console.log("Sector 6 cleanup complete.");
}
run();
