import { createClient } from '@supabase/supabase-js';
import fs from 'fs';

const supabase = createClient(
  'https://jrfhprnuxxfwkwjwdsez.supabase.co',
  'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx'
);

const explicitNames = [
  { title: "Mascotă Creeper", desc: "Costum spectaculos Minecraft, ideal pentru fanii jocului și petreceri pline de energie." },
  { title: "Animator Petreceri", desc: "Animator cu experiență, pregătit cu jocuri, concursuri, muzică și modelaj de baloane." },
  { title: "Clăuniță", desc: "Personaj clasic, colorat și plin de umor, garantând o petrecere super amuzantă." },
  { title: "Prințesa Aurora", desc: "Prințesa din Pădurea Adormită, elegantă și grațioasă, ideală pentru petreceri de fetițe." },
  { title: "Batman", desc: "Cavalerul Întunecat, eroul perfect pentru băieții pasionați de acțiune și aventură." },
  { title: "Mascotă Leu", desc: "Un rege al junglei simpatic și pufos, pregătit să aducă zâmbete și distracție copiilor." },
  { title: "Prințesa Belle", desc: "Prințesa din Frumoasa și Bestia, într-o rochie galbenă superbă, aduce magia poveștilor." },
  { title: "Costum Pisicuță", desc: "Un personaj felin drăgălaș și interactiv, gata să ofere îmbrățișări și energie." },
  { title: "Venom", desc: "Simbiotul Marvel, o prezență impunătoare pentru petreceri cu supereroi curajoși." },
  { title: "Catboy (Eroi în Pijama)", desc: "Liderul Eroilor în Pijama, super-rapid și agil, pregătit pentru misiuni speciale." },
  { title: "Chase (Patrula Cățelușilor)", desc: "Cățelușul polițist curajos, gata de acțiune și salvare la petrecerea celor mici." },
  { title: "Mascotă Șoricel", desc: "Un personaj de desene animate haios, perfect pentru amintiri și momente vesele." }
];

function cleanFilename(title) {
  let baseName = title
    .toLowerCase()
    .normalize("NFD").replace(/[\u0300-\u036f]/g, "") 
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '');
  if (!baseName.includes('animator')) baseName += '-animator';
  if (!baseName.includes('copii') && !baseName.includes('copil')) baseName += '-copii';
  if (!baseName.includes('kassia')) baseName += '-kassia';
  return baseName + '.webp';
}

async function run() {
  const dirPath = 'public/images/animatori-costume';
  const files = fs.readdirSync(dirPath)
    .filter(f => f.startsWith('catalog-costume-kassia-'))
    .sort((a, b) => {
      const numA = parseInt(a.replace(/\D/g, ''));
      const numB = parseInt(b.replace(/\D/g, ''));
      return numA - numB;
    });

  const cards = [];
  for (let i = 0; i < files.length; i++) {
    const file = files[i];
    let title, desc, imgName;
    if (i < 12) {
      title = explicitNames[i].title;
      desc = explicitNames[i].desc;
      imgName = cleanFilename(title);
    } else {
      title = `Imagine Necunoscută ${i+1}`;
      desc = "Personaj necesită revizuire și identificare.";
      imgName = file;
    }
    
    cards.push({
      title,
      short_description: desc,
      alt_text: title,
      image_url: `/images/animatori-costume/${imgName}`,
      cta_text: "Verifică disponibilitatea",
      cta_url: "/contact/",
      width: 640,
      height: 640
    });
  }

  await supabase.from('kassia_pages').delete().eq('slug', 'catalog-costume');

  const { data: newPage, error: pageErr } = await supabase.from('kassia_pages').insert({
    path: '/catalog-costume/',
    slug: 'catalog-costume',
    title: 'Catalog costume și mascote pentru petreceri copii | Kassia',
    h1: 'Catalog costume și mascote pentru petreceri copii',
    meta_title: 'Catalog costume și mascote pentru petreceri copii | Kassia',
    meta_description: 'Alege din catalogul vizual Kassia personaje tematice, mascote și costume potrivite pentru aniversări, botezuri și petreceri private. Disponibilitatea se confirmă în funcție de data evenimentului.',
    page_type: 'pillar',
    status: 'published',
    index_status: 'index'
  }).select().single();

  if (pageErr) { console.error(pageErr); return; }

  await supabase.from('kassia_page_sections').insert({
    page_id: newPage.id,
    section_type: 'costume_catalog',
    order_index: 10,
    heading: 'Catalog Complet',
    content: { cards: cards }
  });

  console.log('Database provisioned successfully for /catalog-costume/ with 73 items.');
}
run();
