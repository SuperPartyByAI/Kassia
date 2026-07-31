import { createClient } from '@supabase/supabase-js';
const supabase = createClient('https://jrfhprnuxxfwkwjwdsez.supabase.co', 'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx');

const newCopy = [
  {
    title: "Supererou pentru jocuri dinamice",
    short_description: "Personaj potrivit pentru activități energice, concursuri și jocuri de echipă cu copiii."
  },
  {
    title: "Mascotă veselă pentru momentul tortului",
    short_description: "Mascotă prietenoasă pentru apariții-surpriză, poze cu invitații și atmosferă de petrecere."
  },
  {
    title: "Personaj de poveste pentru copii",
    short_description: "Costum tematic potrivit pentru petreceri cu jocuri interactive, dansuri și activități adaptate vârstei."
  },
  {
    title: "Prințesă tematică pentru aniversări",
    short_description: "Costum elegant pentru petreceri de copii, potrivit pentru fotografii, jocuri liniștite și momentul tortului."
  },
  {
    title: "Erou de acțiune curajos",
    short_description: "Ideal pentru copiii pasionați de aventură, aducând un plus de dinamism prin jocuri de perspicacitate."
  },
  {
    title: "Mascotă pufoasă",
    short_description: "Atracția principală pentru cei mai mici invitați, o prezență caldă perfectă pentru amintiri foto."
  },
  {
    title: "Zână magică",
    short_description: "Atmosferă de basm prin pictură pe față, modelaj de baloane și activități creative blânde."
  },
  {
    title: "Personaj din galaxie",
    short_description: "Costum spectaculos potrivit pentru petreceri tematice cu misiuni spațiale și antrenamente de eroi."
  },
  {
    title: "Mascotă de poveste",
    short_description: "Aduce zâmbete la întâmpinarea invitaților și oferă cele mai frumoase îmbrățișări la poze."
  },
  {
    title: "Pirat curajos pentru aventuri",
    short_description: "Perfect pentru vânătoare de comori, jocuri de îndemânare și o petrecere plină de surprize."
  },
  {
    title: "Prințesă a ghețurilor",
    short_description: "Un personaj magic, preferat la petrecerile de fetițe pentru dansuri, povești și karaoke."
  },
  {
    title: "Animator petrecere copii",
    short_description: "Pregătit cu jocuri, muzică, baloane modelabile și energie pozitivă pentru a menține distracția."
  }
];

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii/').single();
  const { data: section } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('section_type', 'costume_catalog').single();
  
  const cards = section.content.cards;
  for (let i = 0; i < cards.length; i++) {
    if (i < newCopy.length) {
      cards[i].title = newCopy[i].title;
      cards[i].short_description = newCopy[i].short_description;
    } else {
      // In case there are more than 12
      cards[i].title = newCopy[i % newCopy.length].title;
      cards[i].short_description = newCopy[i % newCopy.length].short_description;
    }
  }
  
  const newContent = { ...section.content, cards };
  const { error } = await supabase.from('kassia_page_sections').update({ content: newContent }).eq('id', section.id);
  if (error) console.error(error);
  else console.log('Updated catalog copy successfully');
}
run();
