import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
  
  if (!page) {
    console.log("Page not found");
    return;
  }

  // 1. Activate Draft Sections
  const sectionsToActivate = [
    'Animatori la domiciliu, la curte, restaurant sau grădiniță în București și Ilfov',
    'Ce program alegi în funcție de vârsta copiilor?',
    'Un personaj animator sau două personaje animatoare?'
  ];

  for (const heading of sectionsToActivate) {
    const { data: sec } = await supabase.from('kassia_page_sections').select('id, section_type').eq('page_id', page.id).eq('heading', heading).single();
    if (sec && sec.section_type === 'draft') {
      await supabase.from('kassia_page_sections').update({ section_type: 'service_details' }).eq('id', sec.id);
      console.log(`Activated: ${heading}`);
    } else {
        console.log(`Already active or not found: ${heading}`);
    }
  }

  // 2. Insert Trust Badges (feature_card)
  const trustBadges = [
    {
      heading: "10+ ani de experiență",
      body: "Peste un deceniu de zâmbete aduse pe fețele copiilor din București și Ilfov. Știm exact cum să transformăm orice petrecere într-un succes garantat, indiferent de vârsta invitaților.",
      icon: "https://www.kassia.ro/images/icons/experience.svg", // Fallback if image not rendered
      cta: ""
    },
    {
      heading: "Recenzii 100% Reale",
      body: "Avem sute de părinți mulțumiți care ne recomandă. Toate testimonialele noastre sunt de la clienți veritabili care au colaborat cu noi pentru botezuri, aniversări sau serbări.",
      icon: "https://www.kassia.ro/images/icons/stars.svg",
      cta: ""
    },
    {
      heading: "Fără Taxe Ascunse",
      body: "Transparență totală. Asigurăm deplasare gratuită în toate sectoarele din București, iar prețurile comunicate includ toate materialele, boxa, muzica și vopselele pentru pictură.",
      icon: "https://www.kassia.ro/images/icons/shield.svg",
      cta: ""
    }
  ];

  // Check if badges already exist to avoid duplicates
  const { data: existingBadges } = await supabase.from('kassia_page_sections').select('id').eq('page_id', page.id).eq('section_type', 'feature_card');
  
  if (!existingBadges || existingBadges.length === 0) {
      for (const badge of trustBadges) {
          await supabase.from('kassia_page_sections').insert({
              page_id: page.id,
              section_type: 'feature_card',
              heading: badge.heading,
              content: {
                  body: badge.body,
                  // We'll use a CSS class or emoji in the title if images aren't present
              },
              order_index: 2 // Right after hero
          });
      }
      console.log("Inserted 3 Trust Badges");
  } else {
      console.log("Trust badges already exist.");
  }
}

run().then(() => console.log('Level 4 updates complete.'));
