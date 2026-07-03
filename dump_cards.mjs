import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function dump() {
  const { data, error } = await supabase.from('kassia_page_sections').select('*').eq('section_type', 'costume_catalog');
  if (error) { console.error(error); return; }
  
  if (data && data.length > 0) {
      let content = data[0].content;
      if (typeof content === 'string') content = JSON.parse(content);
      // Wait, if it's double stringified
      if (typeof content === 'string') content = JSON.parse(content);
      
      const cards = content.cards || [];
      console.log(`Found ${cards.length} cards`);
      fs.writeFileSync('cards_dump.json', JSON.stringify({id: data[0].id, cards}, null, 2));
  }
}
dump();
