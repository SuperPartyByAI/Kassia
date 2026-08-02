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
    let contentObj = section.content;
    let modified = false;

    // We do a recursive replace function to handle all string fields in the JSON object
    function sanitizeStrings(obj) {
      if (typeof obj === 'string') {
        let str = obj;
        const originalStr = str;
        
        // 1. "fără a menționa branduri, punem accent pe siguranță"
        str = str.replace(/\(instrucțiune internă pentru echipă:\s*fără a menționa branduri,\s*punem accent pe siguranță\s*\)/gi, '');
        str = str.replace(/\(?instrucțiune internă.*?:.*?\)?/gi, '');
        str = str.replace(/fără a menționa branduri,\s*punem accent pe siguranță/gi, 'punem accent pe siguranță');
        
        // 2. "transport Ilfov 30–50 lei" or variations
        str = str.replace(/transport Ilfov 30[ -–]+50 lei/gi, 'transport Ilfov asigurat');
        str = str.replace(/30\s*-\s*50 lei pentru zonele limitrofe/gi, 'tarif standard pentru zonele limitrofe');
        str = str.replace(/30\s*[–-]\s*50 lei/gi, 'taxă de transport');
        str = str.replace(/30\s*-\s*50 lei/gi, 'taxă de transport');

        // 3. "70+ personaje"
        str = str.replace(/70\+\s*personaje/gi, 'zeci de personaje');
        str = str.replace(/peste 70 de personaje/gi, 'o multitudine de personaje');

        // 4. "teatru de păpuși"
        str = str.replace(/teatru de p[ăa]pu[șs]i/gi, 'spectacole interactive');

        // 5. "tun de confetti"
        str = str.replace(/tun de confetti/gi, 'surprize colorate');
        str = str.replace(/confetti/gi, 'surprize colorate');

        // 6. "Mascote Disney"
        str = str.replace(/Mascote Disney/gi, 'Mascote din Povești');
        str = str.replace(/Disney/gi, 'din Povești');

        if (str !== originalStr) {
          modified = true;
          return str;
        }
        return obj;
      } else if (Array.isArray(obj)) {
        return obj.map(item => sanitizeStrings(item));
      } else if (obj !== null && typeof obj === 'object') {
        const newObj = {};
        for (const key in obj) {
          newObj[key] = sanitizeStrings(obj[key]);
        }
        return newObj;
      }
      return obj;
    }

    const sanitizedContent = sanitizeStrings(contentObj);

    if (modified) {
      const { error: updateError } = await supabase.from('kassia_page_sections')
        .update({ content: sanitizedContent })
        .eq('id', section.id);
        
      if (updateError) {
        console.error(`Failed to update ${section.id}`, updateError);
      } else {
        console.log(`Updated section ${section.id}`);
        totalUpdated++;
      }
    }
  }
  console.log(`Finished. Updated ${totalUpdated} sections.`);
}
run();
