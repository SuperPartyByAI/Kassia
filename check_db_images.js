import { createClient } from '@supabase/supabase-js';
const supabase = createClient('https://jrfhprnuxxfwkwjwdsez.supabase.co', 'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx');
async function run() {
  const { data } = await supabase.from('kassia_pages').select('id').eq('slug', 'catalog-costume').single();
  const { data: section } = await supabase.from('kassia_page_sections').select('content').eq('page_id', data.id).single();
  for (let i = 0; i < 12; i++) {
    console.log(i + 1, section.content.cards[i].title, section.content.cards[i].image_url);
  }
}
run();
