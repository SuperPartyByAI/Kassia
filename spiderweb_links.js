import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const mapping = {
  1: ['aviatiei', 'baneasa', 'domenii', 'dorobanti', 'floreasca', 'herastrau', 'primaverii', 'victoriei', 'romana', 'universitate'],
  2: ['colentina', 'iancului', 'mosilor', 'obor', 'pantelimon-bucuresti', 'tei'],
  3: ['dristor', 'muncii', 'nicolae-grigorescu', 'ozana', 'salajan', 'titan', 'unirii', 'vitan'],
  4: ['aparatorii-patriei', 'berceni', 'brancoveanu', 'giurgiului', 'oltenitei', 'piata-sudului', 'tineretului', 'vacaresti'],
  5: ['13-septembrie', 'cotroceni', 'ferentari', 'rahova'],
  6: ['crangasi', 'drumul-taberei', 'ghencea', 'giulesti', 'lujerului', 'militari', 'regie', 'grozavesti', 'chitila']
};

const formatAnchor = (slug) => {
    let name = slug.replace('animatori-copii-', '').split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
    if (name === 'Pantelimon Bucuresti') name = 'Pantelimon';
    return `Animatori copii ${name}`;
}

async function run() {
  const { data: allPages } = await supabase.from('kassia_pages').select('id, slug, title');
  const getPageId = (slug) => allPages.find(p => p.slug === slug)?.id;

  for (const [sector, neighborhoods] of Object.entries(mapping)) {
    const sectorSlug = `animatori-petreceri-copii-sector-${sector}`;
    const sectorPageId = getPageId(sectorSlug);
    
    if (!sectorPageId) {
        console.log(`Missing sector page: ${sectorSlug}`);
        continue;
    }

    for (const nb of neighborhoods) {
      const nbSlug = `animatori-copii-${nb}`;
      const nbPageId = getPageId(nbSlug);
      
      if (!nbPageId) {
          console.log(`Missing nb page: ${nbSlug}`);
          continue;
      }

      // 1. Link FROM Neighborhood TO Sector
      const { data: existing1 } = await supabase.from('kassia_internal_links')
        .select('id').eq('source_page_id', nbPageId).eq('target_page_id', sectorPageId);
      
      if (!existing1 || existing1.length === 0) {
          await supabase.from('kassia_internal_links').insert({
              source_page_id: nbPageId,
              target_page_id: sectorPageId,
              anchor_text: `Animatori petreceri copii Sector ${sector}`
          });
          console.log(`Linked ${nbSlug} -> ${sectorSlug}`);
      }

      // 2. Link FROM Sector TO Neighborhood
      const { data: existing2 } = await supabase.from('kassia_internal_links')
        .select('id').eq('source_page_id', sectorPageId).eq('target_page_id', nbPageId);
      
      if (!existing2 || existing2.length === 0) {
          await supabase.from('kassia_internal_links').insert({
              source_page_id: sectorPageId,
              target_page_id: nbPageId,
              anchor_text: formatAnchor(nbSlug)
          });
          console.log(`Linked ${sectorSlug} -> ${nbSlug}`);
      }
    }
  }
}

run().then(() => console.log('Spiderweb linking complete.'));
