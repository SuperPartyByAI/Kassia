import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

async function run() {
  // 1. Fix pages (meta descriptions)
  console.log('Fixing pages...');
  const { data: pages } = await supabase.from('kassia_pages').select('id, meta_description, title');
  for (const page of pages) {
    if (page.meta_description && page.meta_description.includes('70+ personaje')) {
      const newMeta = page.meta_description.replace('70+ personaje', 'peste 300 de costume');
      await supabase.from('kassia_pages').update({ meta_description: newMeta }).eq('id', page.id);
      console.log(`Updated page ${page.id} meta_description`);
    }
  }

  // 2. Fix sections (unverified claims)
  console.log('Fixing sections...');
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content');
  let updatedCount = 0;
  for (const section of sections) {
    if (!section.content) continue;
    let contentStr = JSON.stringify(section.content);
    let modified = false;

    if (contentStr.includes('(fără a menționa branduri, punem accent pe siguranță)')) {
      contentStr = contentStr.replace(/ \(fără a menționa branduri, punem accent pe siguranță\)/g, '');
      modified = true;
    }
    if (contentStr.includes('fără a menționa branduri, punem accent pe siguranță')) {
      contentStr = contentStr.replace(/fără a menționa branduri, punem accent pe siguranță/g, '');
      modified = true;
    }
    if (contentStr.includes('30 și 50 de lei')) {
      contentStr = contentStr.replace(/între 30 și 50 de lei/g, 'calculată în funcție de distanță');
      modified = true;
    }
    if (contentStr.includes('teatru de păpuși')) {
      contentStr = contentStr.replace(/teatru de păpuși/g, 'ateliere interactive');
      modified = true;
    }
    if (contentStr.includes('tun de confetti')) {
      contentStr = contentStr.replace(/, tun de confetti/g, '');
      modified = true;
    }
    if (contentStr.includes('mascote Disney')) {
      contentStr = contentStr.replace(/mascote Disney/g, 'mascote din povești');
      modified = true;
    }

    if (modified) {
      await supabase.from('kassia_page_sections').update({ content: JSON.parse(contentStr) }).eq('id', section.id);
      updatedCount++;
    }
  }
  console.log(`Updated ${updatedCount} sections.`);

  // 3. Fix faqs (unverified claims)
  console.log('Fixing FAQs...');
  const { data: faqs } = await supabase.from('kassia_faqs').select('id, answer');
  let faqUpdated = 0;
  for (const faq of faqs) {
    let answer = faq.answer;
    let modified = false;
    if (answer.includes('30 și 50 de lei')) {
      answer = answer.replace(/între 30 și 50 de lei/g, 'calculată în funcție de distanță');
      modified = true;
    }
    if (modified) {
      await supabase.from('kassia_faqs').update({ answer }).eq('id', faq.id);
      faqUpdated++;
    }
  }
  console.log(`Updated ${faqUpdated} FAQs.`);
}

run();
