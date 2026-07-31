import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://jrfhprnuxxfwkwjwdsez.supabase.co',
  'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx'
);

const fixes = [
  { index: 48, title: "Animator Skye (Patrula Cățelușilor)" },
  { index: 49, title: "Animator Prințesă Modernă" },
  { index: 53, title: "Prințesa Peach (Super Mario)" },
  { index: 56, title: "Mascotă Rocky (Patrula Cățelușilor)" },
  { index: 61, title: "Costum Catwoman / Pisica Neagră" }
];

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'catalog-costume').single();
  const { data: section } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('section_type', 'costume_catalog').single();
  
  const cards = section.content.cards;
  
  for (let item of fixes) {
    const cardIndex = item.index - 1;
    if (cards[cardIndex]) {
      cards[cardIndex].title = item.title;
      cards[cardIndex].alt_text = item.title;
    }
  }

  await supabase.from('kassia_page_sections').update({ content: { cards } }).eq('id', section.id);
  console.log('Fixed the 5 incorrect cards in DB.');
}

run();
