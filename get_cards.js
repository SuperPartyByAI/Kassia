import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://jrfhprnuxxfwkwjwdsez.supabase.co',
  'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx'
);

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'catalog-costume').single();
  const { data: section } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('section_type', 'costume_catalog').single();
  
  const cards = section.content.cards;
  console.log(JSON.stringify(cards));
}

run();
