import { createClient } from '@supabase/supabase-js';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const WHITELIST_EXACT = [
  '/',
  '/animatori-petreceri-copii/',
  '/ursitoare-botez-bucuresti/',
  '/spectacol-magie-copii-bucuresti/',
  '/inchiriere-mascote-disney-bucuresti/',
  '/ateliere-creatie-copii-bucuresti/',
  '/petreceri-corporate-copii/',
  '/kids-corner-nunta-botez/',
  '/pinata-petreceri-copii/',
  '/masina-baloane-sapun-bucuresti/',
  '/decoratiuni-baloane-bucuresti/',
  '/spectacol-stiinta-copii-bucuresti/',
  '/animatori-petreceri-copii-sector-1/',
  '/animatori-petreceri-copii-sector-2/',
  '/animatori-petreceri-copii-sector-3/',
  '/animatori-petreceri-copii-sector-4/',
  '/animatori-petreceri-copii-sector-5/',
  '/animatori-petreceri-copii-sector-6/',
  '/animatori-copii-ilfov/',
  '/blog/',
  '/despre-noi/',
  '/contact/',
  '/portofoliu-evenimente/'
];

const WHITELIST_MATCHES = [
  'voluntari', 'pipera', 'otopeni', 'corbeanca', 'chiajna', 'bragadiru', 'popesti'
];

async function run() {
  const { data: pages } = await supabase.from('kassia_pages').select('id, path');
  
  let noindexCount = 0;
  let indexCount = 0;
  
  for (const page of pages) {
    let shouldIndex = false;
    if (WHITELIST_EXACT.includes(page.path)) {
      shouldIndex = true;
    } else {
      for (const match of WHITELIST_MATCHES) {
        if (page.path.includes(match)) {
          shouldIndex = true;
          break;
        }
      }
    }

    if (shouldIndex) {
      await supabase.from('kassia_pages').update({ index_status: 'index' }).eq('id', page.id);
      indexCount++;
    } else {
      await supabase.from('kassia_pages').update({ index_status: 'noindex' }).eq('id', page.id);
      noindexCount++;
    }
  }
  
  console.log(`Triage complete. Index: ${indexCount}, Noindex: ${noindexCount}`);
}

run();
