import { createClient } from '@supabase/supabase-js';
import * as cheerio from 'cheerio';
import fs from 'fs';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

function extractLocation(path) {
  const match = path.match(/(sector-[1-6]|voluntari|pipera|otopeni|corbeanca|bragadiru|chiajna|popesti-leordeni|mogosoaia|buftea|tunari|balotesti)/i);
  if (match) {
    let loc = match[1].replace('-', ' ');
    return loc.charAt(0).toUpperCase() + loc.slice(1);
  }
  return 'București';
}

const targetUrls = [
  '/animatori-petreceri-copii-sector-1/',
  '/animatori-petreceri-copii-sector-2/',
  '/animatori-petreceri-copii-sector-3/',
  '/animatori-petreceri-copii-sector-4/',
  '/animatori-petreceri-copii-sector-5/',
  '/animatori-petreceri-copii-sector-6/',
  '/animatori-copii-voluntari/',
  '/animatori-copii-pipera-bucuresti/',
  '/animatori-copii-popesti-leordeni/',
  '/animatori-copii-otopeni/',
  '/decoratiuni-baloane-voluntari/',
  '/decoratiuni-baloane-sector-6/'
];

const oldPatterns = [
  'Alege personajul preferat',
  'De ce să ne alegi pentru',
  'Galerie: Cum arată',
  'Rezervă acum echipa perfectă'
];

(async () => {
  console.log('Fetching ALL local pages...');
  const { data: pages } = await supabase.from('kassia_pages').select('id, path');
  
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
    
  console.log(`Found ${localPages.length} local pages.`);
  
  let updates = [];
  
  for (const page of localPages) {
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading').eq('page_id', page.id);
    
    for (const sec of sections) {
      if (!sec.heading) continue;
      
      let newHeading = sec.heading;
      let modified = false;
      
      const loc = extractLocation(page.path);
      const isBaloane = page.path.includes('baloane');

      if (sec.heading.includes('Alege personajul preferat pentru')) {
        if (isBaloane) newHeading = `Idei de decorațiuni cu baloane pentru evenimentele din ${loc}`;
        else newHeading = `Personaje preferate de copii pentru petrecerile din ${loc}`;
        modified = true;
      }
      else if (sec.heading.includes('De ce să ne alegi pentru')) {
        if (isBaloane) newHeading = `De ce să alegi decorurile Kassia cu baloane în ${loc}?`;
        else newHeading = `De ce să inviți animatorii Kassia la petrecerea ta în ${loc}?`;
        modified = true;
      }
      else if (sec.heading.includes('Galerie: Cum arată')) {
        if (isBaloane) newHeading = `Galerie foto: Decoruri reușite cu baloane în ${loc}`;
        else newHeading = `Galerie foto: Petreceri reușite cu Kassia în ${loc}`;
        modified = true;
      }
      else if (sec.heading.includes('Rezervă acum echipa perfectă pentru')) {
        if (isBaloane) newHeading = `Rezervă acum decorul perfect pentru evenimentul tău din ${loc}!`;
        else newHeading = `Rezervă acum echipa Kassia pentru petrecerea ta din ${loc}!`;
        modified = true;
      }

      if (modified) {
        updates.push({ url: page.path, id: sec.id, old: sec.heading, new: newHeading });
      }
    }
  }
  
  console.log(`Found ${updates.length} mechanical headings to fix.`);
  
  let updatedCount = 0;
  for (const u of updates) {
    await supabase.from('kassia_page_sections').update({ heading: u.new }).eq('id', u.id);
    updatedCount++;
  }
  console.log(`Updated ${updatedCount} headings in DB.`);
  
  // Wait a moment for potential SSR cache refresh
  await new Promise(r => setTimeout(r, 2000));
  
  console.log('\n--- VERIFYING LIVE URLS ---');
  let verifyResults = [];
  
  for (const url of targetUrls) {
    const fullUrl = `https://www.kassia.ro${url}`;
    try {
      const res = await fetch(fullUrl, { headers: { 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' } });
      const html = await res.text();
      const $ = cheerio.load(html);
      
      let oldFound = 0;
      for (const p of oldPatterns) {
        if (html.includes(p)) oldFound++;
      }
      
      let newFound = 0;
      if (html.includes('Personaje preferate de copii') || html.includes('Idei de decorațiuni')) newFound++;
      if (html.includes('De ce să inviți animatorii') || html.includes('De ce să alegi decorurile')) newFound++;
      if (html.includes('Galerie foto:')) newFound++;
      if (html.includes('Rezervă acum echipa Kassia') || html.includes('Rezervă acum decorul')) newFound++;
      
      const title = $('title').text().trim();
      const h1 = $('h1').first().text().trim();
      const canonical = $('link[rel="canonical"]').attr('href') || '';
      const metaRobots = $('meta[name="robots"]').attr('content') || '';
      
      verifyResults.push({
        url,
        httpStatus: res.status,
        oldFound,
        newFound,
        title,
        h1,
        canonical,
        metaRobots
      });
      console.log(`Checked ${url}: Old=${oldFound}, New=${newFound}`);
    } catch(e) {
      console.log(`Failed to check ${url}: ${e.message}`);
    }
  }
  
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/verify_headings.json', JSON.stringify(verifyResults, null, 2));
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/updates_headings.json', JSON.stringify(updates, null, 2));
  
  console.log('DONE!');
})();
