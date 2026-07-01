import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';

  // 1. Fix FAQs
  const { data: faqs, error: faqsErr } = await supabase.from('kassia_faqs').select('id, question, order_index').eq('page_id', pageId);
  if (faqs.length === 8) {
    const { error: insErr } = await supabase.from('kassia_faqs').insert([
      {
        page_id: pageId,
        question: 'Care este diferența dintre Berceni cartier și comuna Berceni pentru organizarea petrecerii?',
        answer: '<p>În cartierul Berceni, programul este gândit de obicei pentru apartamente, restaurante, grădinițe sau spații de joacă. În comuna Berceni, unde apar mai des curți și spații exterioare, putem adapta activitățile pentru mișcare, mini-disco și jocuri de grup în aer liber.</p>',
        order_index: 9
      },
      {
        page_id: pageId,
        question: 'Acoperiți și zona Metalurgiei, Grand Arena și Apărătorii Patriei?',
        answer: '<p>Da. Pentru cartierul Berceni și zona de sud, primim solicitări din Piața Sudului, Constantin Brâncoveanu, Apărătorii Patriei, Metalurgiei și zona Grand Arena. Programul se adaptează după tipul locației și spațiul disponibil.</p>',
        order_index: 10
      }
    ]);
    if (insErr) console.error("FAQ Insert Error:", insErr);
    else console.log("Missing FAQs inserted with order_index successfully.");
  } else {
    console.log("FAQ length is already: " + faqs.length);
  }

  // 2. Fix Sections
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, order_index').eq('page_id', pageId);
  for (let s of sections) {
    if (s.heading === 'Berceni urban sau comuna Berceni: alegem programul după locație') {
      await supabase.from('kassia_page_sections').update({ order_index: 1 }).eq('id', s.id);
      console.log("Updated order_index for Cards to 1.");
    }
    if (s.heading === 'Ce detalii ne ajută înainte de eveniment') {
      await supabase.from('kassia_page_sections').update({ order_index: 5 }).eq('id', s.id);
      console.log("Updated order_index for Detalii Logistice to 5.");
    }
  }
})();
