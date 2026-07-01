import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';

  // Check current faqs
  const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, is_active').eq('page_id', pageId);
  console.log("Current FAQs:", faqs.length);

  // If there are only 8, insert the 2 missing ones with is_active: true
  if (faqs.length === 8) {
    const { error } = await supabase.from('kassia_faqs').insert([
      {
        page_id: pageId,
        question: 'Care este diferența dintre Berceni cartier și comuna Berceni pentru organizarea petrecerii?',
        answer: 'În cartierul Berceni, programul este gândit de obicei pentru apartamente, restaurante, grădinițe sau spații de joacă. În comuna Berceni, unde apar mai des curți și spații exterioare, putem adapta activitățile pentru mișcare, mini-disco și jocuri de grup în aer liber.',
        is_active: true,
        display_order: 9
      },
      {
        page_id: pageId,
        question: 'Acoperiți și zona Metalurgiei, Grand Arena și Apărătorii Patriei?',
        answer: 'Da. Pentru cartierul Berceni și zona de sud, primim solicitări din Piața Sudului, Constantin Brâncoveanu, Apărătorii Patriei, Metalurgiei și zona Grand Arena. Programul se adaptează după tipul locației și spațiul disponibil.',
        is_active: true,
        display_order: 10
      }
    ]);
    if (error) console.error("FAQ Insert Error:", error);
    else console.log("Missing FAQs inserted successfully.");
  }
})();
