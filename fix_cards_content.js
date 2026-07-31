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
    title: "Mascotă din jocuri video",
    desc: "O apariție spectaculoasă pentru fanii jocurilor, perfectă pentru fotografii și momentul tortului."
  },
  {
    originalImage: 'catalog-costume-kassia-02.webp',
    title: "Animator pentru petreceri copii",
    desc: "Pregătită cu energie pozitivă, jocuri interactive, concursuri pe echipe și modelaj de baloane."
  },
  {
    originalImage: 'catalog-costume-kassia-03.webp',
    title: "Personaj vesel și colorat",
    desc: "Aduce zâmbete și multă bucurie prin activități dinamice, muzică și dansuri adaptate vârstei."
  },
  {
    originalImage: 'catalog-costume-kassia-04.webp',
    title: "Prințesă tematică pentru fetițe",
    desc: "Costum elegant pentru petreceri de neuitat, cu povești, jocuri liniștite și momentul tortului."
  },
  {
    originalImage: 'catalog-costume-kassia-05.webp',
    title: "Erou de acțiune curajos",
    desc: "Ideal pentru copiii pasionați de aventură, aducând un plus de dinamism prin jocuri de perspicacitate."
  },
  {
    originalImage: 'catalog-costume-kassia-06.webp',
    title: "Mascotă pufoasă",
    desc: "Atracția principală pentru cei mai mici invitați, o prezență caldă perfectă pentru amintiri foto."
  },
  {
    originalImage: 'catalog-costume-kassia-07.webp',
    title: "Prințesă de poveste",
    desc: "O apariție magică, într-o rochie spectaculoasă, pregătită să aducă farmecul basmelor la petrecere."
  },
  {
    originalImage: 'catalog-costume-kassia-08.webp',
    title: "Mascotă pisoi jucăuș",
    desc: "Un personaj extrem de simpatic, gata să ofere îmbrățișări și să se distreze alături de cei mici."
  },
  {
    originalImage: 'catalog-costume-kassia-09.webp',
    title: "Supererou pentru jocuri dinamice",
    desc: "Personaj potrivit pentru activități energice, antrenamente de eroi și jocuri de echipă cu copiii."
  },
  {
    originalImage: 'catalog-costume-kassia-10.webp',
    title: "Erou în pijama",
    desc: "Echipat pentru misiuni speciale, aduce super-puteri și jocuri de acțiune pentru toți micii invitați."
  },
  {
    originalImage: 'catalog-costume-kassia-11.webp',
    title: "Mascotă ursuleț simpatic",
    desc: "O prezență uriașă dar blândă, perfectă pentru surprize la momentul tortului și fotografii de neuitat."
  },
  {
    originalImage: 'catalog-costume-kassia-12.webp',
    title: "Mascotă ren prietenos",
    desc: "Aduce bucurie și magie la orice eveniment, fiind atracția principală pentru toți copiii prezenți."
  }
];

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id, slug').eq('slug', 'animatori-petreceri-copii').single();
  if (!page) { console.log('Page not found'); return; }

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
         console.log('Database updated for catalog cards.');
       }
     }
  }
}

run();
