import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://jrfhprnuxxfwkwjwdsez.supabase.co',
  'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx'
);

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('content').eq('page_id', page.id).eq('section_type', 'costume_catalog');
  
  if (sections && sections.length > 0) {
     const content = typeof sections[0].content === 'string' ? JSON.parse(sections[0].content) : sections[0].content;
     console.log(JSON.stringify(content.cards.slice(0, 12), null, 2));
  }
}
run();
