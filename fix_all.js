import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://jrfhprnuxxfwkwjwdsez.supabase.co',
  'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx'
);

const allNames = [
  { index: 1, title: "Mascotă Creeper (Minecraft)" },
  { index: 2, title: "Personaj K-Pop (Neon / Zoue)" },
  { index: 3, title: "Animator Dansatoare Spaniolă" },
  { index: 4, title: "Clăuniță Veselă" },
  { index: 5, title: "Prințesa Aurora" },
  { index: 6, title: "Batman" },
  { index: 7, title: "Costum Tematic" }, // Was Mascotă Leu
  { index: 8, title: "Prințesa Belle" },
  { index: 9, title: "Personaj Tematic" }, // Was Costum Pisicuță
  { index: 10, title: "Venom" },
  { index: 11, title: "Catboy (Eroi în Pijama)" },
  { index: 12, title: "Chase (Patrula Cățelușilor)" },
  { index: 13, title: "Prințesa Cenușăreasa" },
  { index: 14, title: "Ahri / Zoue (K-Pop)" },
  { index: 15, title: "Prințesa Elena din Avalor" },
  { index: 16, title: "Prințesa Elsa (Frozen)" },
  { index: 17, title: "Animator Minnie Mouse" },
  { index: 18, title: "Șopi (Eroi în Pijama)" },
  { index: 19, title: "Animator Hello Kitty" },
  { index: 20, title: "Kristoff (Frozen)" },
  { index: 21, title: "Supereroină Buburuză" },
  { index: 22, title: "Pilot Fulger McQueen" },
  { index: 23, title: "Mascote Mickey și Minnie" },
  { index: 24, title: "Luigi" },
  { index: 25, title: "Mascotă Luigi" },
  { index: 26, title: "Akali / Mira (K-Pop)" },
  { index: 27, title: "Mascotă Mario" },
  { index: 28, title: "Marshall (Patrula Cățelușilor)" },
  { index: 29, title: "Mascotă Masha" },
  { index: 30, title: "Prințesa Merida" },
  { index: 31, title: "Mascotă Șoricel Jerry" },
  { index: 32, title: "Animator Minion" },
  { index: 33, title: "Rochiță Minnie Mouse" },
  { index: 34, title: "Mascotă Pikachu" },
  { index: 35, title: "Animator Tradițional Românesc" },
  { index: 36, title: "Rumi (K-Pop Demon Hunters)" }
];

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'catalog-costume').single();
  const { data: section } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('section_type', 'costume_catalog').single();
  
  const cards = section.content.cards;
  
  for (let item of allNames) {
    const cardIndex = item.index - 1;
    if (cards[cardIndex]) {
      cards[cardIndex].title = item.title;
      cards[cardIndex].short_description = "Personaj tematic disponibil pentru rezervare la petreceri.";
      cards[cardIndex].alt_text = item.title;
    }
  }

  await supabase.from('kassia_page_sections').update({ content: { cards } }).eq('id', section.id);
  console.log('Updated all cards 1 to 36 in DB.');
}

run();
