import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function sync() {
  const finalCards = JSON.parse(fs.readFileSync('kassia_73_final.json', 'utf8'));
  
  // Update both catalog instances
  const sectionIds = ["3587eb56-01cf-48eb-85a6-8c00380e99e4", "9620244a-92dc-492a-8625-1b0a4bb0b39f"];
  
  for (const sid of sectionIds) {
      const { data: sectionData } = await supabase.from('kassia_page_sections').select('content').eq('id', sid).single();
      let content = sectionData.content;
      if (typeof content === 'string') content = JSON.parse(content);
      if (typeof content === 'string') content = JSON.parse(content);
      
      content.cards = finalCards;
      
      // Save it properly stringified (if it was double stringified we should match the pattern, but supabase expects jsonb. Let's just pass the object)
      const { error } = await supabase.from('kassia_page_sections').update({ content: content }).eq('id', sid);
      if (error) {
          console.error("Error updating", sid, error);
      } else {
          console.log("Successfully updated section", sid);
      }
  }
}
sync();
