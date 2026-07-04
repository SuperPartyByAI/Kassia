import { createClient } from '@supabase/supabase-js';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

function extractLocation(str, path) {
  let match = str.match(/animatori copii (otopeni|popesti leordeni|voluntari|pipera|chiajna|bragadiru|corbeanca|mogosoaia|buftea|tunari|balotesti|sector [1-6])/i);
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
    const loc = extractLocation('', page.path);
    
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id);
    if (!sections) continue;
    
    for (const sec of sections) {
      if (sec.content && sec.content.body) {
        let body = sec.content.body;
        let modified = false;
        
        if (body.includes('Animatori Petreceri Copii animatori copii')) {
          const regex = new RegExp(`Animatori Petreceri Copii animatori copii [a-zA-Z0-9 -]+`, 'gi');
          body = body.replace(regex, `Animatori pentru petreceri de copii în ${loc}`);
          modified = true;
        }
        
        if (body.includes('Jocuri Animatori Petreceri Copii animatori copii')) {
          const regex = new RegExp(`Jocuri Animatori Petreceri Copii animatori copii [a-zA-Z0-9 -]+`, 'gi');
          body = body.replace(regex, `Jocuri interactive cu animatori pentru copii în ${loc}`);
          modified = true;
        }
        
        if (modified) {
          sec.content.body = body;
          await supabase.from('kassia_page_sections').update({ content: sec.content }).eq('id', sec.id);
          console.log(`Updated content body for ${page.path}`);
        }
      }
    }
  }
  console.log('DONE');
})();
