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
    // capitalize words
    return loc.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
  }
  return 'București';
}

const targetUrls = [
  '/animatori-petreceri-copii-sector-1/',
  '/animatori-petreceri-copii-sector-6/',
  '/animatori-copii-otopeni/',
  '/animatori-copii-popesti-leordeni/',
  '/animatori-petreceri-copii-voluntari/',
  '/animatori-copii-pipera-bucuresti/',
  '/animatori-copii-chiajna/',
  '/animatori-copii-bragadiru/',
  '/animatori-copii-corbeanca/',
  '/decoratiuni-baloane-voluntari/',
  '/decoratiuni-baloane-sector-6/',
  '/animatori-petreceri-copii/'
];

(async () => {
  console.log('Fetching ALL local pages, FAQs, and Gallery items...');
  const { data: pages } = await supabase.from('kassia_pages').select('id, path, h1, title, meta_title, meta_description, status');
  
  const localPages = pages.filter(p => 
    p.path.includes('sector-') || 
    p.path.includes('voluntari') || 
    p.path.includes('pipera') || 
    p.path.includes('otopeni') || 
    p.path.includes('corbeanca') || 
    p.path.includes('bragadiru') || 
    p.path.includes('chiajna') || 
    p.path.includes('popesti') ||
    p.path.includes('mogosoaia') ||
    p.path.includes('buftea') ||
    p.path.includes('tunari') ||
    p.path.includes('balotesti')
  );
  
  let pageUpdates = [];
  let faqUpdates = [];
  let altUpdates = [];
  
  for (const page of localPages) {
    let loc = extractLocation(page.h1 || '', page.path);
    let pUpdate = {};
    let isModified = false;
    
    // Page H1, Title, Meta
    if (page.h1 && page.h1.includes('Animatori Petreceri Copii animatori copii')) {
      pUpdate.h1 = `Animatori pentru petreceri de copii în ${loc}`;
      isModified = true;
    } else if (page.h1 && page.h1.match(/^Decoratiuni Baloane [a-zA-Z0-9 ]+$/i)) {
      pUpdate.h1 = `Decorațiuni cu baloane în ${loc}`;
      isModified = true;
    }
    
    if (page.title && page.title.includes('Animatori Petreceri Copii animatori copii')) {
      pUpdate.title = `Animatori petreceri copii în ${loc} | Kassia`;
      if (!pUpdate.meta_title) pUpdate.meta_title = pUpdate.title;
      isModified = true;
    } else if (page.title && page.title.match(/^Decoratiuni Baloane [a-zA-Z0-9 ]+$/i)) {
      pUpdate.title = `Decorațiuni cu baloane în ${loc} | Kassia`;
      if (!pUpdate.meta_title) pUpdate.meta_title = pUpdate.title;
      isModified = true;
    }
    
    if (page.meta_title && page.meta_title.includes('Animatori Petreceri Copii animatori copii')) {
      pUpdate.meta_title = `Animatori petreceri copii în ${loc} | Kassia`;
      isModified = true;
    } else if (page.meta_title && page.meta_title.match(/^Decoratiuni Baloane [a-zA-Z0-9 -]+$/i)) {
      pUpdate.meta_title = `Decorațiuni cu baloane în ${loc} | Kassia`;
      isModified = true;
    }
    
    if (page.meta_description && page.meta_description.includes('Cauți animatori pentru petreceri copii în animatori copii')) {
      pUpdate.meta_description = `Animatori pentru petreceri de copii în ${loc}, cu personaje, jocuri interactive, pictură pe față și modelaj baloane. Pachete clare pentru evenimente în București și Ilfov.`;
      isModified = true;
    }
    
    if (isModified) {
      pageUpdates.push({ id: page.id, path: page.path, updates: pUpdate, old: { h1: page.h1, title: page.title, meta: page.meta_description } });
    }
    
    // FAQs
    const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, answer').eq('page_id', page.id);
    if (faqs) {
      for (const faq of faqs) {
        if (faq.question && faq.question.includes('Animatori Petreceri Copii animatori copii')) {
          const newQ = faq.question.replace(/Animatori Petreceri Copii animatori copii [a-zA-Z0-9 -]+/i, `o petrecere în ${loc}`);
          faqUpdates.push({ id: faq.id, path: page.path, newQ, oldQ: faq.question });
        }
      }
    }
    
    // Gallery Alts
    const { data: gallery } = await supabase.from('kassia_gallery_items').select('id, alt_text').eq('page_id', page.id);
    if (gallery) {
      for (const item of gallery) {
        if (item.alt_text && item.alt_text.includes('Jocuri Animatori Petreceri Copii animatori copii')) {
          const newAlt = `Jocuri interactive cu animatori pentru copii în ${loc}`;
          altUpdates.push({ id: item.id, path: page.path, newAlt, oldAlt: item.alt_text });
        } else if (item.alt_text && item.alt_text.match(/^Decoratiuni Baloane [a-zA-Z0-9 ]+$/i)) {
          const newAlt = `Decor cu baloane pentru evenimente în ${loc}`;
          altUpdates.push({ id: item.id, path: page.path, newAlt, oldAlt: item.alt_text });
        }
      }
    }
  }
  
  console.log(`Found ${pageUpdates.length} pages, ${faqUpdates.length} FAQs, ${altUpdates.length} Alts to fix.`);
  
  // Apply updates
  for (const p of pageUpdates) {
    await supabase.from('kassia_pages').update(p.updates).eq('id', p.id);
  }
  for (const f of faqUpdates) {
    await supabase.from('kassia_faqs').update({ question: f.newQ }).eq('id', f.id);
  }
  for (const a of altUpdates) {
    await supabase.from('kassia_gallery_items').update({ alt_text: a.newAlt }).eq('id', a.id);
  }
  
  console.log('DB updates complete. Waiting 2s for SSR cache...');
  await new Promise(r => setTimeout(r, 2000));
  
  console.log('\n--- VERIFYING LIVE URLS ---');
  let verifyResults = [];
  
  for (const url of targetUrls) {
    const fullUrl = `https://www.kassia.ro${url}`;
    try {
      const res = await fetch(fullUrl, { headers: { 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' } });
      const html = await res.text();
      const $ = cheerio.load(html);
      
      const oldPatterns = [
        'Animatori Petreceri Copii animatori copii',
        'Cauți animatori pentru petreceri copii în animatori copii',
        'Jocuri Animatori Petreceri Copii animatori copii',
        'Cu cât timp înainte trebuie să rezerv echipa pentru Animatori Petreceri Copii animatori copii'
      ];
      
      let oldFound = 0;
      for (const p of oldPatterns) {
        if (html.includes(p)) oldFound++;
      }
      
      const newPatterns = [
        'Animatori pentru petreceri de copii în',
        'Jocuri interactive cu animatori pentru copii',
        'Cu cât timp înainte trebuie să rezerv animatorii',
        'Decorațiuni cu baloane în'
      ];
      
      let newFound = 0;
      for (const p of newPatterns) {
        if (html.includes(p)) newFound++;
      }
      
      const title = $('title').text().trim();
      const h1 = $('h1').first().text().trim();
      const meta = $('meta[name="description"]').attr('content') || '';
      const canonical = $('link[rel="canonical"]').attr('href') || '';
      const metaRobots = $('meta[name="robots"]').attr('content') || '';
      
      verifyResults.push({
        url,
        httpStatus: res.status,
        oldFound,
        newFound,
        title,
        h1,
        meta,
        canonical,
        metaRobots
      });
      console.log(`Checked ${url}: Old=${oldFound}, New=${newFound}`);
    } catch(e) {
      console.log(`Failed to check ${url}: ${e.message}`);
    }
  }
  
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/batch2_verify.json', JSON.stringify(verifyResults, null, 2));
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/batch2_updates.json', JSON.stringify({pageUpdates, faqUpdates, altUpdates}, null, 2));
  
  let csv = 'URL,HTTP_Status,Old_Found,New_Found,H1,Title,Meta,Canonical,Meta_Robots\n';
  for (const r of verifyResults) {
    csv += `"${r.url}","${r.httpStatus}","${r.oldFound}","${r.newFound}","${r.h1}","${r.title}","${r.meta}","${r.canonical}","${r.metaRobots}"\n`;
  }
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/raport_batch2.csv', csv);
  
  console.log('DONE!');
})();
