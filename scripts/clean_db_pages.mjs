import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

async function run() {
  const { data: pages, error } = await supabase.from('kassia_pages').select('id, title, meta_description, raw_content');
  if (error) {
    console.error("Error fetching pages:", error);
    return;
  }
  
  let totalUpdated = 0;

  for (const page of pages) {
    let modified = false;
    let newTitle = page.title;
    let newMeta = page.meta_description;
    let newRaw = page.raw_content;

    function cleanString(str) {
      if (!str) return str;
      let s = str;
      s = s.replace(/70\+\s*personaje/gi, 'zeci de personaje');
      s = s.replace(/peste 70 de personaje/gi, 'o multitudine de personaje');
      s = s.replace(/transport Ilfov 30[ -–]+50 lei/gi, 'transport Ilfov asigurat');
      s = s.replace(/30\s*-\s*50 lei pentru zonele limitrofe/gi, 'tarif standard pentru zonele limitrofe');
      s = s.replace(/30\s*[–-]\s*50 lei/gi, 'taxă de transport');
      s = s.replace(/teatru de p[ăa]pu[șs]i/gi, 'spectacole interactive');
      s = s.replace(/tun de confetti/gi, 'surprize colorate');
      s = s.replace(/confetti/gi, 'surprize colorate');
      s = s.replace(/Mascote Disney/gi, 'Mascote din Povești');
      s = s.replace(/Disney/gi, 'din Povești');
      return s;
    }

    const t = cleanString(page.title);
    if (t !== page.title) { newTitle = t; modified = true; }
    
    const m = cleanString(page.meta_description);
    if (m !== page.meta_description) { newMeta = m; modified = true; }

    const r = cleanString(page.raw_content);
    if (r !== page.raw_content) { newRaw = r; modified = true; }

    if (modified) {
      const { error: updateError } = await supabase.from('kassia_pages')
        .update({ title: newTitle, meta_description: newMeta, raw_content: newRaw })
        .eq('id', page.id);
        
      if (updateError) {
        console.error(`Failed to update ${page.id}`, updateError);
      } else {
        console.log(`Updated page ${page.id}`);
        totalUpdated++;
      }
    }
  }
  console.log(`Finished. Updated ${totalUpdated} pages.`);
}
run();
