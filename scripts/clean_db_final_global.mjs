import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY
);

async function run() {
  const { data: sections, error } = await supabase.from('kassia_page_sections').select('id, content');
  if (error) {
    console.error("Error fetching sections:", error);
    return;
  }
  
  let totalUpdated = 0;

  for (const section of sections) {
    let contentStr = JSON.stringify(section.content);
    const originalStr = contentStr;

    // 1. "fără a menționa branduri, punem accent pe siguranță"
    contentStr = contentStr.replace(/fără a menționa branduri, punem accent pe siguranță/gi, 'punem accent pe siguranță');
    
    // 2. "transport Ilfov 30–50 lei" or variations
    contentStr = contentStr.replace(/transport Ilfov 30[ -–]+50 lei/gi, 'transport Ilfov asigurat');
    contentStr = contentStr.replace(/30-50 lei pentru zonele/gi, 'tarif standard pentru zonele');
    contentStr = contentStr.replace(/30 – 50 lei/gi, 'taxă de transport');

    // 3. "70+ personaje"
    contentStr = contentStr.replace(/70\+\s*personaje/gi, 'zeci de personaje');

    // 4. "teatru de păpuși"
    contentStr = contentStr.replace(/teatru de păpuși/gi, 'spectacole interactive');

    // 5. "tun de confetti"
    contentStr = contentStr.replace(/tun de confetti/gi, 'surprize colorate');

    // 6. "Mascote Disney"
    contentStr = contentStr.replace(/Mascote Disney/gi, 'Mascote din Povești');
    
    // Additional cleanup for "Disney" alone if used commercially out of context, 
    // but better to be safe and only replace the known violations first.

    if (contentStr !== originalStr) {
      const { error: updateError } = await supabase.from('kassia_page_sections')
        .update({ content: JSON.parse(contentStr) })
        .eq('id', section.id);
        
      if (updateError) {
        console.error(`Failed to update ${section.id}`, updateError);
      } else {
        console.log(`Updated ${section.id}`);
        totalUpdated++;
      }
    }
  }
  console.log(`Finished. Updated ${totalUpdated} sections.`);
}
run();
