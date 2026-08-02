import fs from 'fs';
import path from 'path';
import sharp from 'sharp';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

const publicDir = path.join(process.cwd(), 'public');

async function processDir(dir) {
  const files = fs.readdirSync(dir);
  for (const file of files) {
    const fullPath = path.join(dir, file);
    const stat = fs.statSync(fullPath);
    if (stat.isDirectory()) {
      await processDir(fullPath);
    } else if (fullPath.endsWith('.png') && stat.size > 1024 * 1024) {
      console.log(`Optimizing ${fullPath} (${stat.size} bytes)`);
      const webpPath = fullPath.replace('.png', '.webp');
      await sharp(fullPath).webp({ quality: 80 }).toFile(webpPath);
      fs.unlinkSync(fullPath);

      // Replace in DB
      const relativePng = fullPath.replace(publicDir, '').replace(/\\/g, '/');
      const relativeWebp = webpPath.replace(publicDir, '').replace(/\\/g, '/');
      
      const { data: sections } = await supabase.from('kassia_page_sections').select('id, content');
      for (const s of sections) {
        if (!s.content) continue;
        const str = JSON.stringify(s.content);
        if (str.includes(relativePng)) {
          const newStr = str.replaceAll(relativePng, relativeWebp);
          await supabase.from('kassia_page_sections').update({ content: JSON.parse(newStr) }).eq('id', s.id);
          console.log(`Updated section ${s.id} for image ${relativePng}`);
        }
      }
    }
  }
}

async function run() {
  await processDir(path.join(publicDir, 'images'));
  console.log('Done optimizing images.');
}
run();
