import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const specificDescriptions = JSON.parse(fs.readFileSync('specific_descriptions.json', 'utf8'));
const specificEvidence = JSON.parse(fs.readFileSync('specific_evidence.json', 'utf8'));
const rawData = JSON.parse(fs.readFileSync('cards_dump2.json', 'utf8'));
const cards = rawData.cards;

async function sync() {
  const processedCards = cards.map(c => {
      const desc = specificDescriptions[c.title] || `Personaj spectaculos potrivit pentru momente vesele și jocuri de grup la petrecerea ta.`;
      const evidence = specificEvidence[c.title] || ["costum tematic", "accesorii asortate"];
      
      return {
          ...c,
          short_description: desc,
          alt_text: `Costum ${c.title} pentru petreceri copii`,
          cta_url: "",
          visual_evidence: evidence
      };
  });

  const sectionIds = ["3587eb56-01cf-48eb-85a6-8c00380e99e4", "9620244a-92dc-492a-8625-1b0a4bb0b39f"];
  
  for (const sid of sectionIds) {
      const { data: sectionData } = await supabase.from('kassia_page_sections').select('content').eq('id', sid).single();
      let content = sectionData.content;
      if (typeof content === 'string') content = JSON.parse(content);
      if (typeof content === 'string') content = JSON.parse(content);
      
      content.cards = processedCards;
      
      const { error } = await supabase.from('kassia_page_sections').update({ content: content }).eq('id', sid);
      if (error) {
          console.error("Error updating", sid, error);
      } else {
          console.log("Successfully updated section", sid);
      }
  }
}
sync();
