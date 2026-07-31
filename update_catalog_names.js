import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://jrfhprnuxxfwkwjwdsez.supabase.co',
  'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx'
);

const names13to32 = [
  { index: 13, title: "Prințesa Cenușăreasa", desc: "O prințesă clasică și elegantă, perfectă pentru o petrecere de vis." },
  { index: 14, title: "Zoue (K-Pop Demon Hunters)", desc: "Personaj energic din faimoasa trupă K-Pop, gata de dans și distracție." },
  { index: 15, title: "Prințesa Elena din Avalor", desc: "Prințesa curajoasă, aducând magie și aventură la petrecerea ta." },
  { index: 16, title: "Prințesa Elsa", desc: "Regina gheturilor, cel mai iubit personaj pentru o petrecere magică." },
  { index: 17, title: "Minnie Mouse", desc: "Un personaj clasic, adorabil, îmbrăcat în rochița roșie cu buline." },
  { index: 18, title: "Șopi (Eroi în Pijama)", desc: "Eroul agil și puternic, pregătit pentru super misiuni." },
  { index: 19, title: "Hello Kitty", desc: "O pisicuță simpatică și dulce, ideală pentru petreceri vesele." },
  { index: 20, title: "Kristoff", desc: "Prietenul de nădejde al Elsei și Annei, gata de o nouă aventură." },
  { index: 21, title: "Buburuza", desc: "Supereroina Miraculoasă care salvează mereu situația și aduce zâmbete." },
  { index: 22, title: "Pilot Fulger McQueen", desc: "Animator tematic de curse auto, plin de adrenalină și viteză." },
  { index: 23, title: "Mascote Mickey și Minnie", desc: "Cei mai iubiți șoricei aduc bucurie dublă la tăierea tortului." },
  { index: 24, title: "Luigi", desc: "Fratele lui Mario, pregătit de jocuri și distracție în echipă." },
  { index: 25, title: "Mascotă Luigi", desc: "Mascota uriașă din cel mai faimos joc video." },
  { index: 26, title: "Mira (K-Pop Demon Hunters)", desc: "Personaj principal din K-Pop Demon Hunters, cu o ținută rebelă." },
  { index: 27, title: "Mascotă Mario", desc: "Mascota îndrăgitului instalator, o surpriză perfectă." },
  { index: 28, title: "Marshall (Patrula Cățelușilor)", desc: "Cățelușul pompier, gata mereu să intervină cu bucurie." },
  { index: 29, title: "Mascotă Masha", desc: "Fetița poznașă și jucăușă din desenele animate." },
  { index: 30, title: "Prințesa Merida", desc: "O prințesă neînfricată, perfectă pentru fetițe curajoase." },
  { index: 31, title: "Mascotă Jerry", desc: "Șoricelul haios și plin de surprize, gata de poze." },
  { index: 32, title: "Minion", desc: "Un personaj galben, zăpăcit și extrem de amuzant." }
];

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'catalog-costume').single();
  if (!page) { console.log('Page not found'); return; }

  const { data: section } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('section_type', 'costume_catalog').single();
  
  if (!section) { console.log('Section not found'); return; }

  const cards = section.content.cards;
  
  // Update the cards 13-32
  for (let item of names13to32) {
    const cardIndex = item.index - 1; // 0-based
    if (cards[cardIndex]) {
      cards[cardIndex].title = item.title;
      cards[cardIndex].short_description = item.desc;
      cards[cardIndex].alt_text = item.title;
    }
  }

  await supabase.from('kassia_page_sections').update({ content: { cards } }).eq('id', section.id);
  console.log('Updated cards 13-32 in DB.');
}

run();
