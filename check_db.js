import { createClient } from '@supabase/supabase-js';
const supabase = createClient('https://jrfhprnuxxfwkwjwdsez.supabase.co', 'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx');
async function run() {
  const { data } = await supabase.from('kassia_pages').select('id').eq('slug', 'catalog-costume').single();
  const { data: section } = await supabase.from('kassia_page_sections').select('content').eq('page_id', data.id).single();
  console.log(section.content.cards[13].title); // should be Zoue
  console.log(section.content.cards[16].title); // should be Minnie Mouse
}
run();
