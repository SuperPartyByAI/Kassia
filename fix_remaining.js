import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fs from 'fs';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

function extractLocation(str, path) {
  let match = str.match(/animatori copii (otopeni|popesti leordeni|voluntari|pipera|chiajna|bragadiru|corbeanca|mogosoaia|buftea|tunari|balotesti|sector [1-6])/i);
  if (!match) match = str.match(/Decoratiuni Baloane (otopeni|popesti leordeni|voluntari|pipera|chiajna|bragadiru|corbeanca|mogosoaia|buftea|tunari|balotesti|sector [1-6])/i);
  if (!match) match = path.match(/(sector-[1-6]|voluntari|pipera|otopeni|corbeanca|bragadiru|chiajna|popesti-leordeni|mogosoaia|buftea|tunari|balotesti)/i);
  
  if (match) {
    let loc = match[1].replace('-', ' ');
    return loc.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
  }
  return 'București';
}

(async () => {
  const { data: pages } = await supabase.from('kassia_pages').select('id, path');
  
  for (const page of pages) {
    let loc = extractLocation('', page.path);
    
    // Check FAQs again
    const { data: faqs } = await supabase.from('kassia_faqs').select('id, question').eq('page_id', page.id);
    if (faqs) {
      for (const faq of faqs) {
        if (faq.question && faq.question.includes('echipa pentru o petrecere')) {
          const newQ = faq.question.replace('echipa pentru o petrecere', 'animatorii pentru o petrecere');
          await supabase.from('kassia_faqs').update({ question: newQ }).eq('id', faq.id);
        } else if (faq.question && faq.question.includes('Animatori Petreceri Copii animatori copii')) {
          const newQ = `Cu cât timp înainte trebuie să rezerv animatorii pentru o petrecere în ${loc}?`;
          await supabase.from('kassia_faqs').update({ question: newQ }).eq('id', faq.id);
        }
      }
    }
    
    // Check Gallery Alts again
    const { data: gallery } = await supabase.from('kassia_gallery_items').select('id, alt_text').eq('page_id', page.id);
    if (gallery) {
      for (const item of gallery) {
        if (item.alt_text && item.alt_text.includes('Animatori Petreceri Copii animatori copii')) {
          const newAlt = `Jocuri interactive cu animatori pentru copii în ${loc}`;
          await supabase.from('kassia_gallery_items').update({ alt_text: newAlt }).eq('id', item.id);
        }
      }
    }
  }
  
  console.log('Done fixing remaining alts and faqs.');
})();
