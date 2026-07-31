import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';

const supabase = createClient(
  'https://jrfhprnuxxfwkwjwdsez.supabase.co',
  'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx'
);

const PUBLIC_DIR = '/Users/universparty/wa-web-launcher/kassia-site/public';

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

const correctedCardsData = [
  {
    originalImage: 'catalog-costume-kassia-01.webp',
    title: "Mascotă Creeper",
    desc: "Costum spectaculos Minecraft, ideal pentru fanii jocului și petreceri pline de energie."
  },
  {
    originalImage: 'catalog-costume-kassia-02.webp',
    title: "Animator Petreceri",
    desc: "Animator cu experiență, pregătit cu jocuri, concursuri, muzică și modelaj de baloane."
  },
  {
    originalImage: 'catalog-costume-kassia-03.webp',
    title: "Clăuniță",
    desc: "Personaj clasic, colorat și plin de umor, garantând o petrecere super amuzantă."
  },
  {
    originalImage: 'catalog-costume-kassia-04.webp',
    title: "Prințesa Aurora",
    desc: "Prințesa din Pădurea Adormită, elegantă și grațioasă, ideală pentru petreceri de fetițe."
  },
  {
    originalImage: 'catalog-costume-kassia-05.webp',
    title: "Batman",
    desc: "Cavalerul Întunecat, eroul perfect pentru băieții pasionați de acțiune și aventură."
  },
  {
    originalImage: 'catalog-costume-kassia-06.webp',
    title: "Mascotă Leu",
    desc: "Un rege al junglei simpatic și pufos, pregătit să aducă zâmbete și distracție copiilor."
  },
  {
    originalImage: 'catalog-costume-kassia-07.webp',
    title: "Prințesa Belle",
    desc: "Prințesa din Frumoasa și Bestia, într-o rochie galbenă superbă, aduce magia poveștilor."
  },
  {
    originalImage: 'catalog-costume-kassia-08.webp',
    title: "Costum Pisicuță",
    desc: "Un personaj felin drăgălaș și interactiv, gata să ofere îmbrățișări și energie."
  },
  {
    originalImage: 'catalog-costume-kassia-09.webp',
    title: "Venom",
    desc: "Simbiotul Marvel, o prezență impunătoare pentru petreceri cu supereroi curajoși."
  },
  {
    originalImage: 'catalog-costume-kassia-10.webp',
    title: "Catboy (Eroi în Pijama)",
    desc: "Liderul Eroilor în Pijama, super-rapid și agil, pregătit pentru misiuni speciale."
  },
  {
    originalImage: 'catalog-costume-kassia-11.webp',
    title: "Chase (Patrula Cățelușilor)",
    desc: "Cățelușul polițist curajos, gata de acțiune și salvare la petrecerea celor mici."
  },
  {
    originalImage: 'catalog-costume-kassia-12.webp',
    title: "Mascotă Șoricel",
    desc: "Un personaj de desene animate haios, perfect pentru amintiri și momente vesele."
  }
];

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id, slug').eq('slug', 'animatori-petreceri-copii').single();
  
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('section_type', 'costume_catalog');
  if (sections && sections.length > 0) {
     for (const section of sections) {
       const content = typeof section.content === 'string' ? JSON.parse(section.content) : section.content;
       
       if (content && content.cards) {
         for (let i = 0; i < 12 && i < content.cards.length; i++) {
           const cardInfo = correctedCardsData[i];
           const newFilename = cleanFilename(cardInfo.title);
           const newSrc = `/images/animatori-costume/${newFilename}`;
           
           // Copy file
           const oldPath = path.join(PUBLIC_DIR, `images/animatori-costume/${cardInfo.originalImage}`);
           const newPath = path.join(PUBLIC_DIR, `images/animatori-costume/${newFilename}`);
           
           if (fs.existsSync(oldPath)) {
             fs.copyFileSync(oldPath, newPath);
             console.log(`Copied ${cardInfo.originalImage} to ${newFilename}`);
           } else {
             console.warn(`Missing original image: ${oldPath}`);
           }
           
           // Update card content
           content.cards[i].title = cardInfo.title;
           content.cards[i].short_description = cardInfo.desc;
           content.cards[i].alt_text = `Costum animator petreceri copii: ${cardInfo.title}`;
           content.cards[i].alt = `Costum animator petreceri copii: ${cardInfo.title}`;
           if (content.cards[i].image_url) content.cards[i].image_url = newSrc;
           if (content.cards[i].image) content.cards[i].image = newSrc;
         }
         
         await supabase.from('kassia_page_sections').update({ content }).eq('id', section.id);
         console.log('Database updated for catalog cards with absolutely correct identities.');
       }
     }
  }
}

run();
