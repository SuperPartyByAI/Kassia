import { createClient } from '@supabase/supabase-js';
import fs from 'fs';

const supabase = createClient(
  'https://jrfhprnuxxfwkwjwdsez.supabase.co',
  'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx'
);

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id, slug').eq('slug', 'animatori-petreceri-copii').single();
  if (!page) { console.log('Page not found'); return; }

  const renameMap = [];

  // 1. Fetch catalog
  const { data: sections } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('section_type', 'costume_catalog');
  if (sections && sections.length > 0) {
     for (const section of sections) {
       const content = typeof section.content === 'string' ? JSON.parse(section.content) : section.content;
       if (content && content.cards) {
         for (let i = 0; i < content.cards.length; i++) {
           const card = content.cards[i];
           const oldSrc = card.image;
           if (oldSrc && oldSrc.includes('catalog-costume-kassia-')) {
             let baseName = card.title
               .toLowerCase()
               .replace(/[^a-z0-9]+/g, '-')
               .replace(/^-+|-+$/g, '');
             
             if (!baseName.includes('animator')) baseName += '-animator';
             if (!baseName.includes('copii')) baseName += '-copii';
             if (!baseName.includes('kassia')) baseName += '-kassia';
             
             const newFilename = `${baseName}.webp`;
             const newSrc = `/images/animatori-costume/${newFilename}`;
             
             renameMap.push({
               type: 'catalog',
               section_id: section.id,
               card_index: i,
               old_src: oldSrc,
               new_src: newSrc,
               old_filename: oldSrc.split('/').pop(),
               new_filename: newFilename,
               alt: card.alt || card.title,
               title: card.title,
               reason: 'Generic numeric filename replaced with descriptive SEO filename'
             });
           }
         }
       }
     }
  }

  // 2. Fetch gallery
  const { data: gallery } = await supabase.from('kassia_gallery_items').select('id, url, alt_text').eq('page_id', page.id);
  if (gallery && gallery.length > 0) {
     for (let i = 0; i < gallery.length; i++) {
       const item = gallery[i];
       const oldSrc = item.url;
       if (oldSrc && (oldSrc.includes('galerie-') || oldSrc.includes('kassia-0'))) {
         let baseName = (item.alt_text || `fotografie-petrecere-copii-${i+1}`)
               .toLowerCase()
               .replace(/[^a-z0-9]+/g, '-')
               .replace(/^-+|-+$/g, '');
               
         if (!baseName.includes('petrecere')) baseName += '-petrecere-copii';
         if (!baseName.includes('kassia')) baseName += '-kassia';
         
         const newFilename = `${baseName}.webp`;
         const newSrc = `/images/animatori-costume/${newFilename}`;
         
         renameMap.push({
           type: 'gallery',
           item_id: item.id,
           old_src: oldSrc,
           new_src: newSrc,
           old_filename: oldSrc.split('/').pop(),
           new_filename: newFilename,
           alt: item.alt_text,
           title: '',
           reason: 'Generic numeric filename replaced with descriptive SEO filename'
         });
       }
     }
  }

  fs.mkdirSync('reports/pillar_image_seo_cleanup', { recursive: true });
  fs.writeFileSync('reports/pillar_image_seo_cleanup/image_rename_map.json', JSON.stringify(renameMap, null, 2));
  console.log('Rename map generated with', renameMap.length, 'items.');
}

run();
