import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const specificDescriptions = JSON.parse(fs.readFileSync('specific_descriptions.json', 'utf8'));
const rawData = JSON.parse(fs.readFileSync('cards_dump2.json', 'utf8'));
const cards = rawData.cards;

async function sync() {
  const processedCards = cards.map(c => {
      const desc = specificDescriptions[c.title] || `Personaj spectaculos potrivit pentru momente vesele și jocuri de grup la petrecerea ta.`;
      
      let evidence = ["costum complet cu detalii premium", "accesorii specifice personajului"];
      if (c.title.includes("Batman")) evidence = ["costum negru cu mușchi textilați", "pelerină", "mască cu urechi ascuțite"];
      else if (c.title.includes("Elsa")) evidence = ["rochie albastră strălucitoare", "capă transparentă de gheață", "păr blond împletit"];
      else if (c.title.includes("Unicorn")) evidence = ["costum în culori pastelate", "corn auriu", "coamă colorată"];
      else if (c.title.includes("Mickey")) evidence = ["costum mascotă cu urechi rotunde", "pantaloni roșii", "mănuși albe gigantice"];
      else if (c.title.includes("Creeper")) evidence = ["costum masiv verde", "textură pixelată printată pe material", "cap în formă de cub"];
      else if (c.title.includes("Spiderman")) evidence = ["costum roșu-albastru", "mască cu lentile albe mari", "imprimeu de pânză de păianjen"];
      else if (c.title.includes("Chase")) evidence = ["costum cu vestă albastră de polițist", "șapcă cu insignă", "rucsac funcțional"];
      else if (c.title.includes("Catboy")) evidence = ["costum albastru mulat", "mască cu detalii feline", "simbol pe piept"];
      else if (c.title.includes("Belle")) evidence = ["rochie galbenă cu falduri generoase", "mănuși lungi", "trandafir (accesoriu)"];
      
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
