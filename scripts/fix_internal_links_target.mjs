import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

const redirects = new Map([
  ['/blog/petrecere-copii-in-ilfov-ghid/', '/animatori-petreceri-copii/'],
  ['/animatori-copii-berceni-ilfov/', '/animatori-petreceri-copii-berceni/'],
  ['/pachete-animatori-copii-bucuresti/', '/preturi-animatori-copii-bucuresti/'],
  ['/animatori-copii-floreasca/', '/animatori-petreceri-copii-floreasca/'],
  ['/animatori-copii-bucuresti/', '/animatori-petreceri-copii-bucuresti/'],
  ['/animatori-copii-sector-1/', '/animatori-petreceri-copii-sector-1/'],
  ['/animatori-copii-sector-2/', '/animatori-petreceri-copii-sector-2/'],
  ['/animatori-copii-sector-3/', '/animatori-petreceri-copii-sector-3/'],
  ['/animatori-copii-sector-4/', '/animatori-petreceri-copii-sector-4/'],
  ['/animatori-copii-sector-5/', '/animatori-petreceri-copii-sector-5/'],
  ['/animatori-copii-sector-6/', '/animatori-petreceri-copii-sector-6/'],
  ['/personaje-petreceri-copii-bucuresti/', '/personaje-animatori-copii-bucuresti/'],
  ['/animatori-cu-mascote-petreceri-copii-bucuresti/', '/mascote-petreceri-copii-bucuresti/'],
  ['/pachet-animator-si-mascota-bucuresti/', '/preturi-animatori-copii-bucuresti/'],
  ['/animatori-copii-la-evenimente-private-bucuresti/', '/animatori-petreceri-copii/'],
  ['/animatori-pentru-copii-mici-bucuresti/', '/animatori-petreceri-copii/']
]);

async function run() {
  const { data: pages } = await supabase.from('kassia_pages').select('id, path');
  const pathMap = new Map(pages.map(p => [p.path, p.id]));
  const idMap = new Map();
  for (const [oldUrl, newUrl] of redirects) {
    if (pathMap.has(oldUrl) && pathMap.has(newUrl)) {
      idMap.set(pathMap.get(oldUrl), pathMap.get(newUrl));
    }
  }

  const { data: links } = await supabase.from('kassia_internal_links').select('id, target_page_id');
  for (const l of links) {
    if (idMap.has(l.target_page_id)) {
      await supabase.from('kassia_internal_links').update({ target_page_id: idMap.get(l.target_page_id) }).eq('id', l.id);
      console.log('Updated link target', l.id);
    }
  }
}
run();
