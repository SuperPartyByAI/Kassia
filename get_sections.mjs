import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function check() {
  const { data: sections, error } = await supabase.from('kassia_page_sections').select('id, page_id, section_type, content').eq('section_type', 'costume_catalog');
  if (error) { console.error(error); return; }
  
  const { data: pages } = await supabase.from('kassia_pages').select('id, slug, path');
  
  const report = sections.map(s => {
      const page = pages.find(p => p.id === s.page_id);
      let content = s.content;
      if (typeof content === 'string') content = JSON.parse(content);
      if (typeof content === 'string') content = JSON.parse(content);
      return {
          page_slug: page?.slug || '',
          page_path: page?.path || '',
          page_id: s.page_id,
          section_id: s.id,
          section_type: s.section_type,
          cards_count: content.cards?.length || 0,
          is_used_on_live_catalog_costume: page?.path === '/catalog-costume/'
      };
  });
  console.log(JSON.stringify({ catalog_sections_found: report }, null, 2));
}
check();
