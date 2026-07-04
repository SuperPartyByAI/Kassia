import { createClient } from '@supabase/supabase-js';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

function extractLocation(path) {
  let match = path.match(/(sector-[1-6]|voluntari|pipera|otopeni|corbeanca|bragadiru|chiajna|popesti-leordeni|mogosoaia|buftea|tunari|balotesti)/i);
  if (match) {
    let loc = match[1].replace('-', ' ');
    return loc.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
  }
  return null;
}

(async () => {
  console.log('Fixing inline alts...');
  const { data: pages } = await supabase.from('kassia_pages').select('id, path').ilike('path', '%decoratiuni-baloane%');
  
  let updatesCount = 0;
  
  for (const page of pages) {
    let loc = extractLocation(page.path);
    if (!loc) continue;
    
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', page.id);
    for (const sec of sections) {
      if (sec.content && sec.content.body && sec.content.body.match(/decoratiuni baloane/i)) {
        let newBody = sec.content.body.replace(/decoratiuni baloane [a-zA-Z0-9 -]+/gi, `decorațiuni cu baloane în ${loc}`);
        sec.content.body = newBody;
        await supabase.from('kassia_page_sections').update({ content: sec.content }).eq('id', sec.id);
        updatesCount++;
      }
    }
  }
  
  console.log(`Updated ${updatesCount} inline alts.`);
})();
