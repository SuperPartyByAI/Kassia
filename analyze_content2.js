import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function analyze() {
  const { data: pages } = await supabase.from('kassia_pages').select('id, path, index_status, title');
  const { data: sections } = await supabase.from('kassia_page_sections').select('page_id, section_type, content');
  
  const pageStats = pages.map(p => {
    const pageSections = sections.filter(s => s.page_id === p.id);
    let score = 0;
    
    pageSections.forEach(s => {
      if (s.content && typeof s.content.body === 'string') score += s.content.body.length;
      if (s.content && typeof s.content.html === 'string') score += s.content.html.length;
      if (s.content && typeof s.content.text === 'string') score += s.content.text.length;
    });

    return {
      path: p.path,
      title: p.title,
      status: p.index_status,
      sectionCount: pageSections.length,
      score: score
    };
  });

  const sorted = pageStats.sort((a, b) => b.score - a.score);
  
  console.log("=== TOP 5 MOST CONTENT-RICH PAGES ===");
  sorted.slice(0, 5).forEach(p => console.log(`${p.path} | Sections: ${p.sectionCount} | TextScore: ${p.score} | Status: ${p.status}`));

  console.log("\n=== BOTTOM 5 INDEXABLE (Thin Content) ===");
  const activeThin = sorted.filter(p => p.status === 'published' || p.status === 'index').reverse();
  activeThin.slice(0, 5).forEach(p => console.log(`${p.path} | Sections: ${p.sectionCount} | TextScore: ${p.score} | Status: ${p.status}`));
  
  const noindexCount = sorted.filter(p => p.status === 'noindex').length;
  console.log(`\nTotal Pages: ${sorted.length}`);
  console.log(`Noindex Pages: ${noindexCount}`);
  console.log(`Indexable Pages: ${sorted.length - noindexCount}`);
}

analyze();
