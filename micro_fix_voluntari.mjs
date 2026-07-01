import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

const newPath = '/animatori-petreceri-copii-voluntari/';

async function run() {
  try {
    const { data: page, error: errPage } = await supabase.from('kassia_pages').select('id').eq('path', newPath).single();
    if (errPage) throw errPage;

    const pageId = page.id;

    // Fix Sections
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', pageId);
    
    for (const sec of sections) {
      let contentStr = JSON.stringify(sec.content);
      // Replacements
      contentStr = contentStr.replace(/Intervenim cu succes/g, 'Venim la evenimente organizate');
      contentStr = contentStr.replace(/tărâm al distracției/g, 'spațiu potrivit pentru activități cu copiii');
      contentStr = contentStr.replace(/ne adaptăm perfect logisticii/g, 'adaptăm activitățile la spațiul disponibil');
      contentStr = contentStr.replace(/în siguranță/g, 'într-un spațiu bine organizat');
      contentStr = contentStr.replace(/Animatorul se va asigura că/g, 'Animatorul menține ritmul programului și');
      contentStr = contentStr.replace(/ideale pentru terasele acoperite/g, 'potrivite pentru terase acoperite');
      
      const newContent = JSON.parse(contentStr);
      await supabase.from('kassia_page_sections').update({ content: newContent }).eq('id', sec.id);
    }
    console.log('Sections updated.');

    // Fix FAQs
    const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, answer').eq('page_id', pageId);
    
    for (const faq of faqs) {
      let q = faq.question;
      let a = faq.answer;
      
      a = a.replace(/Absolut!/g, 'Da.');
      a = a.replace(/personajul ideal/g, 'personajul potrivit');
      a = a.replace(/în siguranță/g, 'într-un spațiu bine organizat'); // Just in case
      
      await supabase.from('kassia_faqs').update({ answer: a, question: q }).eq('id', faq.id);
    }
    console.log('FAQs updated.');
    
  } catch (err) {
    console.error('Error:', err);
  }
}

run();
