import sharp from 'sharp';
import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '/opt/kassia-site/.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const imageUrl = 'https://jrfhprnuxxfwkwjwdsez.supabase.co/storage/v1/object/public/storefront_media/kassia/ai/hub/hub_hero_cinderella_1783424359806.jpg';
  
  // 1. Download
  const res = await fetch(imageUrl);
  const buffer = Buffer.from(await res.arrayBuffer());
  
  // 2. Resize and convert to webp (under 250KB - quality 75 is usually enough)
  const outputPath = '/opt/kassia-site/public/hub_hero_cinderella.webp';
  await sharp(buffer)
    .resize(1200, 800, { fit: 'cover' })
    .webp({ quality: 70 })
    .toFile(outputPath);
    
  const stat = fs.statSync(outputPath);
  console.log('Optimized Hero size:', Math.round(stat.size / 1024), 'KB');

  // 3. Update DB
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', '/animatori-petreceri-copii/').single();
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id).eq('section_type', 'hero').single();
  
  await supabase.from('kassia_page_sections').update({
    content: {
      ...sections.content,
      image_url: '/hub_hero_cinderella.webp'
    }
  }).eq('id', sections.id);
  
  console.log('Hero image updated in DB.');
}
run();
