import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fs from 'fs';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

function extractLocation(path) {
  let match = path.match(/(sector-[1-6]|voluntari|pipera|otopeni|corbeanca|bragadiru|chiajna|popesti-leordeni|mogosoaia|buftea|tunari|balotesti)/i);
  if (match) {
    let loc = match[1].replace('-', ' ');
    return loc.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
  }
  return 'București';
}

const targetUrls = [
  '/animatori-copii-otopeni/',
  '/animatori-copii-popesti-leordeni/',
  '/animatori-petreceri-copii-sector-6/',
  '/animatori-petreceri-copii-sector-4/',
  '/animatori-copii-chiajna/',
  '/animatori-copii-bragadiru/',
  '/animatori-copii-corbeanca/',
  '/animatori-petreceri-copii-voluntari/',
  '/animatori-copii-pipera-bucuresti/',
  '/decoratiuni-baloane-sector-6/',
  '/decoratiuni-baloane-voluntari/',
  '/animatori-petreceri-copii/'
];

(async () => {
  console.log('Fetching ALL local pages...');
  const { data: pages } = await supabase.from('kassia_pages').select('id, path, h1, title, meta_description');
  
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
  
  let updatesCount = 0;
  let logData = [];
  
  for (const page of localPages) {
    let loc = extractLocation(page.path);
    if (page.path.includes('pipera')) loc = 'Pipera';
    if (page.path.includes('popesti')) loc = 'Popesti Leordeni';
    
    // Fix Fallbacks in page H1/Title/Meta
    let pageUpdated = false;
    let newP = { h1: page.h1, title: page.title, meta_description: page.meta_description };
    
    if (newP.h1 && newP.h1.includes('București') && loc !== 'București') {
      newP.h1 = newP.h1.replace(/București/g, loc);
      pageUpdated = true;
    }
    if (newP.title && newP.title.includes('București') && loc !== 'București' && !page.path.includes('pipera-bucuresti')) {
      newP.title = newP.title.replace(/București/g, loc);
      pageUpdated = true;
    }
    if (newP.meta_description && newP.meta_description.includes('în București') && loc !== 'București') {
      // Be careful not to replace 'în București și Ilfov' if it's the general text
      if (!newP.meta_description.includes('București și Ilfov')) {
        newP.meta_description = newP.meta_description.replace(/în București/g, `în ${loc}`);
        pageUpdated = true;
      }
    }
    
    if (pageUpdated) {
      await supabase.from('kassia_pages').update(newP).eq('id', page.id);
      logData.push({ url: page.path, field: 'page_meta', old: page.h1, new: newP.h1 });
      updatesCount++;
    }
    
    // Fix Sections
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', page.id);
    for (const sec of sections) {
      let secUpdated = false;
      let newHeading = sec.heading;
      let newBody = sec.content?.body || '';
      
      if (newHeading) {
        if (newHeading.includes('Alege personajul preferat pentru')) {
          newHeading = `Personaje preferate de copii pentru petrecerile din ${loc}`;
          secUpdated = true;
        } else if (newHeading.includes('De ce să ne alegi pentru')) {
          newHeading = `De ce să inviți animatorii Kassia la petrecerea ta în ${loc}?`;
          secUpdated = true;
        } else if (newHeading.includes('Rezervă acum echipa perfectă pentru')) {
          newHeading = `Rezervă echipa Kassia pentru petrecerea ta din ${loc}`;
          secUpdated = true;
        } else if (newHeading.includes('Galerie: Cum arată')) {
          newHeading = `Galerie foto: Petreceri reușite cu Kassia în ${loc}`;
          secUpdated = true;
        } else if (newHeading.includes('București') && loc !== 'București') {
          newHeading = newHeading.replace(/București/g, loc);
          secUpdated = true;
        }
      }
      
      if (newBody && newBody.includes('București') && loc !== 'București') {
        newBody = newBody.replace(/petrecerile din București/gi, `petrecerile din ${loc}`);
        newBody = newBody.replace(/petrecerea ta în București/gi, `petrecerea ta în ${loc}`);
        secUpdated = true;
      }
      
      if (secUpdated) {
        const payload = { heading: newHeading };
        if (sec.content) {
          sec.content.body = newBody;
          payload.content = sec.content;
        }
        await supabase.from('kassia_page_sections').update(payload).eq('id', sec.id);
        logData.push({ url: page.path, field: 'section', old: sec.heading, new: newHeading });
        updatesCount++;
      }
    }
    
    // Fix FAQs
    const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, answer').eq('page_id', page.id);
    for (const faq of faqs) {
      if (faq.question && faq.question.includes('Cu cât timp înainte trebuie să rezerv echipa pentru')) {
        const newQ = `Cu cât timp înainte trebuie să rezerv animatorii pentru o petrecere în ${loc}?`;
        await supabase.from('kassia_faqs').update({ question: newQ }).eq('id', faq.id);
        logData.push({ url: page.path, field: 'faq', old: faq.question, new: newQ });
        updatesCount++;
      }
    }
  }
  
  console.log(`Made ${updatesCount} updates in DB. Waiting for cache...`);
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
        'Alege personajul preferat pentru',
        'De ce să ne alegi pentru',
        'Rezervă acum echipa perfectă pentru',
        'Galerie: Cum arată',
        'Cu cât timp înainte trebuie să rezerv echipa pentru Animatori',
        'Animatori Petreceri Copii animatori copii',
        'Jocuri Animatori Petreceri Copii animatori copii'
      ];
      
      let oldFound = 0;
      for (const p of oldPatterns) {
        if (html.includes(p)) oldFound++;
      }
      
      const newPatterns = [
        'Personaje preferate de copii pentru petrecerile din',
        'De ce să inviți animatorii Kassia',
        'Rezervă echipa Kassia pentru petrecerea ta din',
        'Galerie foto: Petreceri reușite cu Kassia în'
      ];
      
      let newFound = 0;
      for (const p of newPatterns) {
        if (html.includes(p)) newFound++;
      }
      
      const title = $('title').text().trim().replace(/"/g, '""');
      const h1 = $('h1').first().text().trim().replace(/"/g, '""');
      const meta = ($('meta[name="description"]').attr('content') || '').replace(/"/g, '""');
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
  
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/batch2b_updates.json', JSON.stringify(logData, null, 2));
  
  let csv = 'URL,HTTP_Status,Old_Found,New_Found,H1,Title,Meta,Canonical,Meta_Robots\n';
  for (const r of verifyResults) {
    csv += `"${r.url}","${r.httpStatus}","${r.oldFound}","${r.newFound}","${r.h1}","${r.title}","${r.meta}","${r.canonical}","${r.metaRobots}"\n`;
  }
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/raport_batch2b.csv', csv);
  
  console.log('DONE!');
})();
