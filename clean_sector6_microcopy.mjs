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

  // 1. Clean kassia_page_sections
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content, section_type, heading').eq('page_id', page.id);
  for (const s of sections) {
      if (s.content) {
          let contentStr = JSON.stringify(s.content);
          let newContentStr = contentStr
              .replace(/activități creative, modelaj de baloane și activități creative/gi, 'activități creative, modelaj de baloane și jocuri statice adaptate spațiului');
          
          if (contentStr !== newContentStr) {
              console.log(`Fixing section microcopy: ${s.heading} (${s.section_type})`);
              const newContent = JSON.parse(newContentStr);
              await supabase.from('kassia_page_sections').update({ content: newContent }).eq('id', s.id);
          }
      }
  }

  // 2. Clean kassia_faqs
  const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, answer').eq('page_id', page.id);
  if (faqs) {
    for (const f of faqs) {
        let newQuestion = f.question.replace(/activități creative, modelaj de baloane și activități creative/gi, 'activități creative, modelaj de baloane și jocuri statice adaptate spațiului');
        let newAnswer = f.answer.replace(/activități creative, modelaj de baloane și activități creative/gi, 'activități creative, modelaj de baloane și jocuri statice adaptate spațiului');
        
        if (f.question !== newQuestion || f.answer !== newAnswer) {
            console.log(`Fixing FAQ microcopy: ${f.question}`);
            await supabase.from('kassia_faqs').update({ question: newQuestion, answer: newAnswer }).eq('id', f.id);
        }
    }
  }

  console.log("Microcopy cleanup complete.");
}
run();
