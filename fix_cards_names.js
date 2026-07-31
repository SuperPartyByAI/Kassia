import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://jrfhprnuxxfwkwjwdsez.supabase.co',
  'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx'
);

const explicitNames = [
  { title: "Mascotă Creeper (Minecraft)", desc: "Costum spectaculos pentru fanii jocului Minecraft, perfect pentru petreceri pline de energie." },
  { title: "Animator Petreceri", desc: "Animator cu experiență, pregătit cu jocuri, concursuri, muzică și modelaj de baloane." },
  { title: "Animator Rochiță Minnie", desc: "Personaj îndrăgit, gata să aducă zâmbete și voie bună cu jocuri și dansuri tematice." },
  { title: "Prințesa Aurora", desc: "Prințesa din Pădurea Adormită, elegantă și grațioasă, ideală pentru petreceri de fetițe." },
  { title: "Batman", desc: "Cavalerul Întunecat, eroul perfect pentru băieții pasionați de acțiune și aventură." },
  { title: "Mascotă Cățeluș", desc: "Mascotă simpatică, iubită de cei mai mici invitați, pregătită pentru poze și distracție." },
  { title: "Prințesa Belle", desc: "Prințesa din Frumoasa și Bestia, într-o rochie galbenă superbă, aduce magia poveștilor." },
  { title: "Mascotă Sylvester", desc: "Cunoscutul personaj din desene animate, extrem de haios și iubit de toți copiii." },
  { title: "Venom", desc: "Simbiotul Marvel, o prezență impunătoare pentru petreceri cu supereroi curajoși." },
  { title: "Catboy (Eroi în Pijama)", desc: "Liderul Eroilor în Pijama, super-rapid și agil, pregătit pentru misiuni speciale." },
  { title: "Mascotă Ursul", desc: "Ursul din Masha și Ursul, o prezență uriașă și blândă pentru momente de neuitat." },
  { title: "Mascotă Renul Sven", desc: "Renul din Frozen, un prieten devotat și amuzant, atracția petrecerilor de iarnă." }
];

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id, slug').eq('slug', 'animatori-petreceri-copii').single();
  
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('section_type', 'costume_catalog');
  if (sections && sections.length > 0) {
     for (const section of sections) {
       const content = typeof section.content === 'string' ? JSON.parse(section.content) : section.content;
       
       if (content && content.cards) {
         for (let i = 0; i < 12 && i < content.cards.length; i++) {
           content.cards[i].title = explicitNames[i].title;
           content.cards[i].short_description = explicitNames[i].desc;
         }
         await supabase.from('kassia_page_sections').update({ content }).eq('id', section.id);
         console.log('Updated cards with explicit character names.');
       }
     }
  }
}

run();
