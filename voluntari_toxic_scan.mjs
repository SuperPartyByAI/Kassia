import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = 'e6740b2f-da54-4638-b770-496f8c7bf9e0';
  
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', pageId);
  const toxicTerms = ['pachete', 'pictură pe față', 'face painting', 'garantat', 'memorabil', 'de neuitat', 'perfect', 'ideal', 'profesioniști', 'premium', 'cost', 'preț', 'tarif', 'taxă', '2-3 săptămâni', 'câteva săptămâni', 'gratuit'];
  
  if (sections) {
    for (const sec of sections) {
        let contentStr = typeof sec.content === 'string' ? sec.content : JSON.stringify(sec.content);
        let found = [];
        for (const term of toxicTerms) {
            if (contentStr.toLowerCase().includes(term.toLowerCase())) {
                found.push(term);
            }
        }
        if (found.length > 0) {
            console.log(`Section ${sec.id} contains toxic terms: ${found.join(', ')}`);
        }
    }
  }

  const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, answer').eq('page_id', pageId);
  if (faqs) {
    for (const faq of faqs) {
        let contentStr = (faq.question + " " + faq.answer).toLowerCase();
        let found = [];
        for (const term of toxicTerms) {
            if (contentStr.includes(term.toLowerCase())) {
                found.push(term);
            }
        }
        if (found.length > 0) {
             console.log(`FAQ ${faq.id} contains toxic terms: ${found.join(', ')}`);
        }
    }
  }
})();
