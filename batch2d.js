import { createClient } from '@supabase/supabase-js';
import fs from 'fs';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

function extractLocation(path) {
  let match = path.match(/(sector-[1-6]|voluntari|pipera|otopeni|corbeanca|bragadiru|chiajna|popesti-leordeni|mogosoaia|buftea|tunari|balotesti)/i);
  if (match) {
    let loc = match[1].replace('-', ' ');
    return loc.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
  }
  return null;
}

const targetUrls = [
  '/animatori-copii-popesti-leordeni/',
  '/decoratiuni-baloane-sector-6/',
  '/decoratiuni-baloane-voluntari/'
];

(async () => {
  console.log('Fetching TARGET local pages...');
  const { data: pages } = await supabase.from('kassia_pages').select('id, path');
  
  let updatesCount = 0;
  let logData = [];
  
  for (const page of pages) {
    if (!targetUrls.includes(page.path)) continue;
    let loc = extractLocation(page.path);
    if (page.path.includes('popesti')) loc = 'Popesti Leordeni';
    
    // Fix Sections
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', page.id);
    for (const sec of sections) {
      let secUpdated = false;
      let newHeading = sec.heading;
      let newBody = sec.content?.body || '';
      
      if (newHeading) {
        if (newHeading.includes('București') && loc !== 'București') {
          newHeading = newHeading.replace(/București/g, loc);
          secUpdated = true;
        }
      }
      
      if (newBody) {
        if (newBody.includes('București și județul Ilfov')) {
          newBody = newBody.replace(/București și județul Ilfov/g, `${loc} și împrejurimi`);
          secUpdated = true;
        }
        if (newBody.includes('din București')) {
          newBody = newBody.replace(/din București/g, `din ${loc}`);
          secUpdated = true;
        }
        if (newBody.includes('în București')) {
          newBody = newBody.replace(/în București/g, `în ${loc}`);
          secUpdated = true;
        }
      }
      
      if (secUpdated) {
        const payload = { heading: newHeading };
        if (sec.content) {
          sec.content.body = newBody;
          payload.content = sec.content;
        }
        await supabase.from('kassia_page_sections').update(payload).eq('id', sec.id);
        logData.push({ url: page.path, field: 'section', oldHeading: sec.heading, newHeading: newHeading });
        updatesCount++;
      }
    }
    
    // Fix FAQs
    const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, answer').eq('page_id', page.id);
    for (const faq of faqs) {
      if (faq.question && faq.question.match(/decoratiuni baloane/i)) {
        const newQ = faq.question.replace(/decoratiuni baloane [a-zA-Z0-9 -]+/i, `decorațiuni cu baloane în ${loc}`);
        await supabase.from('kassia_faqs').update({ question: newQ }).eq('id', faq.id);
        logData.push({ url: page.path, field: 'faq', old: faq.question, new: newQ });
        updatesCount++;
      }
    }
    
    // Fix Gallery
    const { data: gallery } = await supabase.from('kassia_gallery_items').select('id, alt_text').eq('page_id', page.id);
    for (const item of gallery) {
      if (item.alt_text && item.alt_text.match(/decoratiuni baloane/i)) {
        const newAlt = item.alt_text.replace(/decoratiuni baloane [a-zA-Z0-9 -]+/i, `Decor cu baloane pentru evenimente în ${loc}`);
        await supabase.from('kassia_gallery_items').update({ alt_text: newAlt }).eq('id', item.id);
        logData.push({ url: page.path, field: 'gallery', old: item.alt_text, new: newAlt });
        updatesCount++;
      }
    }
  }
  
  console.log(`Made ${updatesCount} updates in DB. Waiting for cache...`);
  await new Promise(r => setTimeout(r, 2000));
  
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/batch2d_updates.json', JSON.stringify(logData, null, 2));
  console.log('DONE!');
})();
