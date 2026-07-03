import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const strictDescriptions = JSON.parse(fs.readFileSync('strict_descriptions.json', 'utf8'));
const strictEvidence = JSON.parse(fs.readFileSync('strict_evidence_by_index.json', 'utf8'));
const rawData = JSON.parse(fs.readFileSync('cards_dump2.json', 'utf8'));
const cards = rawData.cards;

async function sync() {
  const processedCards = cards.map((c, index) => {
      // 1. Fetch description by STRICT index
      const desc = strictDescriptions[String(index)];
      if (!desc) {
          throw new Error("Missing manual description for card index " + index + " title: " + c.title);
      }
      
      if (desc.includes("Pachetul spectaculos") || desc.includes("Personaj spectaculos")) {
          throw new Error("Found forbidden template phrase in card index " + index);
      }

      // 2. Fetch specific evidence by index
      const evidence = strictEvidence[String(index)];
      if (!evidence || evidence.length < 3) {
          throw new Error("Missing specific visual evidence for card index: " + index + " title: " + c.title);
      }
      
      let altText = `Costum ${c.title} pentru petreceri copii`;
      if (c.title.toLowerCase().startsWith('costum')) {
          altText = `${c.title} pentru petreceri copii`;
      }
      
      return {
          ...c,
          short_description: desc,
          alt_text: altText,
          cta_url: "", // Ensure this is empty to avoid any fallback usage
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
          throw error;
      } else {
          console.log("Successfully updated section", sid);
      }
  }
}
sync().catch(err => {
    console.error(err);
    process.exit(1);
});
