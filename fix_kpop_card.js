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

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('section_type', 'costume_catalog');
  
  if (sections && sections.length > 0) {
     for (const section of sections) {
       const content = typeof section.content === 'string' ? JSON.parse(section.content) : section.content;
       if (content && content.cards && content.cards.length > 1) {
         const newTitle = "Animator K-pop";
         const newDesc = "Animator cu tematică modernă, ideal pentru petrecerile pasionaților de K-pop, cu dansuri și activități cool.";
         const newFilename = cleanFilename(newTitle);
         const newSrc = `/images/animatori-costume/${newFilename}`;
         
         const oldImageName = content.cards[1].image_url ? content.cards[1].image_url.split('/').pop() : 'animator-petreceri-copii-kassia.webp';
         const oldPath = path.join(PUBLIC_DIR, `images/animatori-costume/${oldImageName}`);
         const newPath = path.join(PUBLIC_DIR, `images/animatori-costume/${newFilename}`);
         
         if (fs.existsSync(oldPath)) {
             fs.copyFileSync(oldPath, newPath);
             console.log(`Copied to ${newFilename}`);
         }
         
         content.cards[1].title = newTitle;
         content.cards[1].short_description = newDesc;
         content.cards[1].alt_text = `Costum animator petreceri copii: ${newTitle}`;
         content.cards[1].alt = `Costum animator petreceri copii: ${newTitle}`;
         if (content.cards[1].image_url) content.cards[1].image_url = newSrc;
         if (content.cards[1].image) content.cards[1].image = newSrc;
         
         await supabase.from('kassia_page_sections').update({ content }).eq('id', section.id);
         console.log('Database updated for card 2 (K-pop).');
       }
     }
  }
}
run();
