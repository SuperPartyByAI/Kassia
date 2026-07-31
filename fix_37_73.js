import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://jrfhprnuxxfwkwjwdsez.supabase.co',
  'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx'
);

const names37to73 = [
  { index: 37, title: "Prințesa Mulan" },
  { index: 38, title: "Scorpion (Mortal Kombat)" },
  { index: 39, title: "Prințesa Peach (Super Mario)" },
  { index: 40, title: "Spiderman" },
  { index: 41, title: "Prințesa Elsa" },
  { index: 42, title: "Bumblebee (Transformers)" },
  { index: 43, title: "Animator Mickey Mouse" },
  { index: 44, title: "Mascotă Sonic" },
  { index: 45, title: "Prințesa Aurora (rochie roz)" },
  { index: 46, title: "Peter Pan" },
  { index: 47, title: "Mascotă Pikachu" },
  { index: 48, title: "Stephanie (Orășelul Leneș)" },
  { index: 49, title: "Prințesa Sofia Întâi" },
  { index: 50, title: "Prințesa Aurora" },
  { index: 51, title: "Pirat" },
  { index: 52, title: "Prințesa Jasmine (Aladdin)" },
  { index: 53, title: "Prințesă Tematică" },
  { index: 54, title: "Costum Dovleac (Halloween)" },
  { index: 55, title: "Rubble (Patrula Cățelușilor)" },
  { index: 56, title: "Hulk" },
  { index: 57, title: "Mascotă Scooby-Doo" },
  { index: 58, title: "Albă ca Zăpada" },
  { index: 59, title: "Prințesa Rapunzel" },
  { index: 60, title: "Țestoasa Ninja (Leonardo)" },
  { index: 61, title: "Spiderman" },
  { index: 62, title: "Mascotă Spiderman" },
  { index: 63, title: "Mascotă Stitch" },
  { index: 64, title: "Superman" },
  { index: 65, title: "Clopoțica (Tinkerbell)" },
  { index: 66, title: "Mascotă Tom (Tom și Jerry)" },
  { index: 67, title: "Vampiriță" },
  { index: 68, title: "Animator Unicorn" },
  { index: 69, title: "Animator Unicorn" },
  { index: 70, title: "Animator Unicorn" },
  { index: 71, title: "Wednesday Addams" },
  { index: 72, title: "Mascotă Iepuraș Roz" },
  { index: 73, title: "Animator Sonic Fată" }
];

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'catalog-costume').single();
  const { data: section } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('section_type', 'costume_catalog').single();
  
  const cards = section.content.cards;
  
  for (let item of names37to73) {
    const cardIndex = item.index - 1;
    if (cards[cardIndex]) {
      cards[cardIndex].title = item.title;
      cards[cardIndex].short_description = "Personaj tematic disponibil pentru rezervare la petreceri.";
      cards[cardIndex].alt_text = item.title;
    }
  }

  await supabase.from('kassia_page_sections').update({ content: { cards } }).eq('id', section.id);
  console.log('Updated all cards 37 to 73 in DB.');
}

run();
