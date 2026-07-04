import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function analyze() {
  const { data: pages } = await supabase.from('kassia_pages').select('id, path, index_status, title');
  const { data: sections } = await supabase.from('kassia_page_sections').select('page_id, section_type, content');
  
  const pageStats = pages.map(p => {
    const pageSections = sections.filter(s => s.page_id === p.id);
    let totalLength = 0;
    let textScore = 0;
    
    pageSections.forEach(s => {
      if (s.content && s.content.body) {
        totalLength += s.content.body.length;
        textScore += s.content.body.length;
      }
      if (s.content && s.content.html) {
         totalLength += s.content.html.length;
         textScore += s.content.html.length;
      }
    });

    return {
      path: p.path,
      title: p.title,
      status: p.index_status,
      sectionCount: pageSections.length,
      types: [...new Set(pageSections.map(s => s.section_type))],
      textScore: textScore
    };
  });

  const sorted = pageStats.sort((a, b) => b.textScore - a.textScore);
  
  console.log("=== TOP 5 MOST CONTENT-RICH PAGES ===");
  sorted.slice(0, 5).forEach(p => console.log(`${p.path} | Sections: ${p.sectionCount} | TextScore: ${p.textScore} | Status: ${p.status}`));

  console.log("\n=== BOTTOM 5 (Thin Content) ===");
  const activeThin = sorted.filter(p => p.status === 'published' && p.sectionCount > 0).reverse();
  activeThin.slice(0, 5).forEach(p => console.log(`${p.path} | Sections: ${p.sectionCount} | TextScore: ${p.textScore} | Status: ${p.status}`));
  
  const noindexCount = sorted.filter(p => p.status === 'noindex').length;
  console.log(`\nTotal Pages: ${sorted.length}`);
  console.log(`Noindex Pages: ${noindexCount}`);
  console.log(`Indexable Pages: ${sorted.length - noindexCount}`);
}

analyze();
