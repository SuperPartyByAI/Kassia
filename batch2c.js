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
  return null;
}

const targetUrls = [
  '/animatori-copii-otopeni/',
  '/animatori-copii-popesti-leordeni/',
  '/animatori-copii-chiajna/',
  '/animatori-copii-bragadiru/',
  '/animatori-copii-corbeanca/',
  '/animatori-petreceri-copii-voluntari/',
  '/animatori-copii-pipera-bucuresti/',
  '/animatori-petreceri-copii-sector-6/',
  '/decoratiuni-baloane-sector-6/',
  '/decoratiuni-baloane-voluntari/',
  '/animatori-petreceri-copii/'
];

(async () => {
  console.log('Fetching ALL local pages...');
  const { data: pages } = await supabase.from('kassia_pages').select('id, path');
  
  let updatesCount = 0;
  let logData = [];
  
  for (const page of pages) {
    let loc = extractLocation(page.path);
    if (!loc) continue; // Skip non-local pages
    if (page.path.includes('pipera')) loc = 'Pipera';
    if (page.path.includes('popesti')) loc = 'Popesti Leordeni';
    
    // Fix Sections
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', page.id);
    for (const sec of sections) {
      let secUpdated = false;
      let newHeading = sec.heading;
      let newBody = sec.content?.body || '';
      
      if (newHeading) {
        if (newHeading.match(/Animatori Petreceri Copii animatori copii/i)) {
          newHeading = `Animatori pentru petreceri de copii în ${loc}`;
          secUpdated = true;
        } else if (newHeading.match(/decoratiuni baloane/i) && !newHeading.includes('Decorațiuni')) {
          newHeading = newHeading.replace(/decoratiuni baloane [a-zA-Z0-9 -]+/i, `decorațiuni cu baloane în ${loc}`);
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
        if (newBody.includes('Animatori Petreceri Copii animatori copii')) {
          newBody = newBody.replace(/Animatori Petreceri Copii animatori copii [a-zA-Z0-9 -]+/gi, `Animatori pentru petreceri de copii în ${loc}`);
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
      if (faq.question && faq.question.match(/Animatori Petreceri Copii animatori copii/i)) {
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
        'Animatori Petreceri Copii animatori copii',
        'Cauți animatori pentru petreceri copii în animatori copii',
        'Jocuri Animatori Petreceri Copii animatori copii',
        'Cu cât timp înainte trebuie să rezerv echipa pentru Animatori Petreceri Copii animatori copii',
        'decoratiuni baloane sector',
        'decoratiuni baloane voluntari',
        'petrecerile din București',
        'petrecerea ta în București'
      ];
      
      let oldFound = 0;
      for (const p of oldPatterns) {
        if (url.includes('bucuresti') && (p.includes('București') || p.includes('bucuresti'))) continue; // skip check for bucuresti if url is bucuresti
        if (url === '/animatori-petreceri-copii/' && p.includes('București')) continue; // skip hub for bucuresti text
        if (html.includes(p)) {
           oldFound++;
           console.log(`[WARN] Old pattern found on ${url}: "${p}"`);
        }
      }
      
      const title = $('title').text().trim().replace(/"/g, '""');
      const h1 = $('h1').first().text().trim().replace(/"/g, '""');
      
      verifyResults.push({
        url,
        httpStatus: res.status,
        oldFound,
        title,
        h1
      });
      console.log(`Checked ${url}: Old=${oldFound}`);
    } catch(e) {
      console.log(`Failed to check ${url}: ${e.message}`);
    }
  }
  
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/batch2c_updates.json', JSON.stringify(logData, null, 2));
  
  let csv = 'URL,HTTP_Status,Old_Found,H1,Title\n';
  for (const r of verifyResults) {
    csv += `"${r.url}","${r.httpStatus}","${r.oldFound}","${r.h1}","${r.title}"\n`;
  }
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/raport_batch2c.csv', csv);
  
  console.log('DONE!');
})();
