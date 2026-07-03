import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function dump() {
  const { data, error } = await supabase.from('kassia_page_sections').select('*').eq('section_type', 'costume_catalog');
  if (error) { console.error(error); return; }
  
  if (data && data.length > 1) {
      let content = data[1].content;
      if (typeof content === 'string') content = JSON.parse(content);
      if (typeof content === 'string') content = JSON.parse(content);
      const cards = content.cards || [];
      console.log(`Found ${cards.length} cards in section 2`);
      fs.writeFileSync('cards_dump2.json', JSON.stringify({id: data[1].id, cards}, null, 2));
  }
}
dump();
