import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';
  
  // Check CTA
  console.log("--- SECTIONS ---");
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', pageId);
  if (sections) {
    for (const sec of sections) {
        let contentStr = typeof sec.content === 'string' ? sec.content : JSON.stringify(sec.content);
        if (contentStr.includes('Trimite detaliile')) {
            console.log("FOUND OLD CTA in section:", sec.id, contentStr);
        }
        if (contentStr.includes('Scrie-ne pe WhatsApp pentru detalii')) {
            console.log("FOUND NEW CTA in section:", sec.id, contentStr);
        }
    }
  }

  // Check FAQs
  console.log("--- FAQS ---");
  const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, answer').eq('page_id', pageId);
  if (faqs) {
    for (const faq of faqs) {
        if (faq.answer.includes('<p>') || faq.answer.includes('</p>')) {
            console.log("FOUND <p> tags in FAQ:", faq.id, faq.answer);
        }
    }
  }
})();
