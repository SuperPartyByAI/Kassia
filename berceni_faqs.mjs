import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const oldPageId = 'cbe2706b-498d-4c3f-bcb4-d7cfa5033224';
  const newPageId = '3ac893ee-a571-4c60-a340-6da788800f1b';

  // Find FAQs on the new page
  const { data: newFaqs } = await supabase.from('kassia_faqs').select('id, question').eq('page_id', newPageId);
  console.log("New page FAQs:", newFaqs.length);

  // Find FAQs on the old page
  const { data: oldFaqs } = await supabase.from('kassia_faqs').select('id, question, answer, display_order').eq('page_id', oldPageId);
  console.log("Old page FAQs:", oldFaqs.length);
  
  if (newFaqs.length === 0 && oldFaqs.length > 0) {
    console.log("Migrating FAQs to new page...");
    // We should copy them, but wait... the user said "fără FAQ vechi de pe URL-ul toxic".
    // That means we need FRESH non-toxic FAQs for Berceni! Or maybe just assign the ones that are NOT toxic?
    // Let's print the old FAQs to see if they are toxic.
    console.log(JSON.stringify(oldFaqs, null, 2));
  }
})();
