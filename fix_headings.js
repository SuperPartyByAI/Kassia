import { createClient } from '@supabase/supabase-js';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

function cleanLocation(keyword) {
  const locs = ['Sector 1', 'Sector 2', 'Sector 3', 'Sector 4', 'Sector 5', 'Sector 6', 'Voluntari', 'Pipera', 'Otopeni', 'Corbeanca', 'Bragadiru', 'Chiajna', 'Popesti-Leordeni', 'Bucuresti'];
  for (const loc of locs) {
    if (keyword.toLowerCase().includes(loc.toLowerCase())) {
      return loc;
    }
  }
  return '';
}

function cleanService(keyword) {
  const kw = keyword.toLowerCase();
  if (kw.includes('animatori')) return 'animatori';
  if (kw.includes('baloane')) return 'baloane';
  if (kw.includes('ursitoare')) return 'ursitoare';
  if (kw.includes('magie') || kw.includes('magician')) return 'magie';
  if (kw.includes('pictura')) return 'pictura';
  if (kw.includes('mascote')) return 'mascote';
  return 'petreceri';
}

(async () => {
  console.log('Fetching mechanical headings...');
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading');
  
  let updates = [];
  
  for (const sec of sections) {
    if (!sec.heading) continue;
    
    let newHeading = sec.heading;
    let modified = false;

    if (sec.heading.includes('Alege personajul preferat pentru')) {
      const raw = sec.heading.replace('Alege personajul preferat pentru', '').trim();
      const loc = cleanLocation(raw) || 'București și Ilfov';
      const srv = cleanService(raw);
      
      if (srv === 'baloane') newHeading = `Idei de decorațiuni cu baloane pentru evenimentele din ${loc}`;
      else newHeading = `Personaje preferate de copii pentru petrecerile din ${loc}`;
      modified = true;
    }
    else if (sec.heading.includes('De ce să ne alegi pentru')) {
      const raw = sec.heading.replace('De ce să ne alegi pentru', '').replace('?', '').trim();
      const loc = cleanLocation(raw);
      const srv = cleanService(raw);
      
      let locStr = loc ? ` în ${loc}` : '';
      
      if (srv === 'baloane') newHeading = `De ce să alegi decorurile Kassia cu baloane${locStr}?`;
      else if (srv === 'animatori') newHeading = `De ce să inviți animatorii Kassia la petrecerea ta${locStr}?`;
      else newHeading = `De ce aleg părinții serviciile Kassia${locStr}?`;
      modified = true;
    }

    if (modified) {
      console.log(`OLD: ${sec.heading} \nNEW: ${newHeading}\n`);
      updates.push({ id: sec.id, heading: newHeading });
    }
  }
  
  console.log(`Found ${updates.length} mechanical headings to fix.`);
  
  // Apply updates sequentially
  let count = 0;
  for (const u of updates) {
    await supabase.from('kassia_page_sections').update({ heading: u.heading }).eq('id', u.id);
    count++;
  }
  
  console.log(`Updated ${count} headings in DB.`);
})();
