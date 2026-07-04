import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const { data: pages } = await supabase.from('kassia_pages').select('id, path, index_status');
  const { data: sections } = await supabase.from('kassia_page_sections').select('page_id');
  
  const pageStats = pages.map(p => {
    const pageSections = sections.filter(s => s.page_id === p.id);
    return {
      id: p.id,
      path: p.path,
      status: p.index_status,
      sectionCount: pageSections.length
    };
  });

  const thinPages = pageStats.filter(p => (p.status === 'published' || p.status === 'index') && p.sectionCount === 0);
  console.log(`Found ${thinPages.length} indexable pages with 0 sections. Hiding them...`);
  
  for (const p of thinPages) {
    console.log(`Setting noindex for: ${p.path}`);
    await supabase.from('kassia_pages').update({ index_status: 'noindex' }).eq('id', p.id);
  }
  console.log('Done hiding thin pages.');
}

run();
