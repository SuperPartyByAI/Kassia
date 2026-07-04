import { createClient } from '@supabase/supabase-js';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

function extractLocation(heading) {
  const match = heading.match(/(Sector [1-6]|Sectorul [1-6]|Voluntari|Pipera|Otopeni|Corbeanca|Bragadiru|Chiajna|Popesti-Leordeni|București|Ilfov)/i);
  return match ? match[0] : '';
}

(async () => {
  console.log('Fetching local pages...');
  const { data: pages } = await supabase.from('kassia_pages')
    .select('id, path')
    .or('path.ilike.%-sector-%,path.ilike.%voluntari%,path.ilike.%pipera%,path.ilike.%otopeni%,path.ilike.%corbeanca%,path.ilike.%bragadiru%,path.ilike.%chiajna%,path.ilike.%popesti-leordeni%');
    
  console.log(`Found ${pages.length} local pages.`);
  
  let updates = [];
  
  for (const page of pages) {
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading').eq('page_id', page.id);
    
    for (const sec of sections) {
      if (!sec.heading) continue;
      
      let newHeading = sec.heading;
      let modified = false;
      
      const loc = extractLocation(sec.heading) || extractLocation(page.path.replace(/-/g, ' ')) || 'București';
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
        console.log(`OLD: ${sec.heading} \nNEW: ${newHeading}\n`);
        updates.push({ id: sec.id, heading: newHeading });
      }
    }
  }
  
  console.log(`Found ${updates.length} mechanical headings to fix on local pages.`);
  
  let count = 0;
  for (const u of updates) {
    await supabase.from('kassia_page_sections').update({ heading: u.heading }).eq('id', u.id);
    count++;
  }
  
  console.log(`Updated ${count} headings in DB.`);
})();
