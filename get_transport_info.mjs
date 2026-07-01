import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const { data: faqs } = await supabase.from('kassia_faqs').select('question, answer').or('question.ilike.%transport%,answer.ilike.%transport%,question.ilike.%deplasare%,answer.ilike.%deplasare%,answer.ilike.%km%');
  console.log("FAQs related to transport/deplasare:");
  if (faqs) {
    faqs.forEach(f => console.log(`Q: ${f.question}\nA: ${f.answer}\n`));
  } else {
    console.log("None found.");
  }

  const { data: sections } = await supabase.from('kassia_page_sections').select('content').or('content->>text.ilike.%transport%,content->>text.ilike.%deplasare%,content->>text.ilike.%km%').limit(5);
  console.log("Sections related to transport/deplasare:");
  if (sections) {
    sections.forEach(s => console.log(JSON.stringify(s.content).substring(0, 500)));
  } else {
    console.log("None found.");
  }
})();
