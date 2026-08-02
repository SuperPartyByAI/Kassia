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
  console.log('Fixing sections...');
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content');
  for (const s of sections) {
    if (!s.content) continue;
    let modified = false;
    let str = JSON.stringify(s.content);
    for (const [oldUrl, newUrl] of redirects) {
      if (str.includes(oldUrl)) {
        str = str.replaceAll(oldUrl, newUrl);
        modified = true;
      }
    }
    if (modified) {
      await supabase.from('kassia_page_sections').update({ content: JSON.parse(str) }).eq('id', s.id);
      console.log('Updated section', s.id);
    }
  }
  console.log('Done sections.');
}
run();
