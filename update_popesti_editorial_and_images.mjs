import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const newPath = '/animatori-petreceri-copii-popesti-leordeni/';
  const { data: newPage } = await supabase.from('kassia_pages').select('*').eq('path', newPath).single();
  
  if (!newPage) {
      console.log('Page not found!');
      return;
  }
  
  // Delete existing sections
  await supabase.from('kassia_page_sections').delete().eq('page_id', newPage.id);

  // Clean sections with images
  const sections = [
    {
      page_id: newPage.id,
      order_index: 1,
      section_type: 'hero',
      heading: 'Animatori petreceri copii în Popești-Leordeni',
      content: {
        body: '<p>Bine ai venit la Kassia Events! Organizăm <a href="/animatori-petreceri-copii/">animatori petreceri copii</a> în Popești-Leordeni. Suntem pregătiți să aducem zâmbete și bucurie la evenimentul tău, adaptând activitățile în funcție de locația aleasă pentru desfășurarea petrecerii.</p>',
        image_url: '/images/locatii/popesti_hero_party_1782284922065.png',
        image_alt: 'Animator pentru copii la petrecere în Popești-Leordeni',
        cta_url: '/preturi-animatori-copii-bucuresti/',
        cta_text: 'Vezi prețurile noastre'
      }
    },
    {
      page_id: newPage.id,
      order_index: 2,
      section_type: 'service_details',
      heading: 'Petreceri acasă, la curte sau la restaurant',
      content: {
        heading: 'Petreceri acasă, la curte sau la restaurant',
        body: '<p>Fie că organizezi evenimentul acasă, într-o curte, la un loc de joacă sau la un restaurant din Popești-Leordeni, programul poate fi adaptat spațiului. Consultă pagina de <a href="/preturi-animatori-copii-bucuresti/">detalii pentru programele cu animatori</a> pentru informații despre opțiunile de deplasare.</p>',
        image_url: '/images/locatii/popesti_acasa_curte_1782284939856.png',
        image_alt: 'Activități pentru copii organizate la petrecere în curte'
      }
    },
    {
      page_id: newPage.id,
      order_index: 3,
      section_type: 'service_details',
      heading: 'Personaje și mascote pentru tematici diferite',
      content: {
        heading: 'Personaje și mascote pentru tematici diferite',
        body: '<p>Poți alege dintr-o gamă largă de costume și tematici potrivite petrecerii copilului tău. Răsfoiește catalogul de <a href="/personaje-animatori-copii-bucuresti/">personaje</a> și descoperă secțiunea de <a href="/mascote-petreceri-copii-bucuresti/">mascote</a> pentru a găsi opțiunea potrivită.</p>',
        image_url: '/images/locatii/popesti_personaje_mascote_1782284961269.png',
        image_alt: 'Personaj și mascotă la petrecere pentru copii'
      }
    },
    {
      page_id: newPage.id,
      order_index: 4,
      section_type: 'service_details',
      heading: 'Detalii pentru program și deplasare',
      content: {
        heading: 'Detalii pentru program și deplasare',
        body: '<p>Deplasarea în zona Popești-Leordeni se face conform programului stabilit, astfel încât echipa de animație să fie prezentă la timp pentru a începe activitățile alături de invitați.</p>',
        image_url: '/images/locatii/popesti_detalii_program_1782284979813.png',
        image_alt: 'Animator pregătind activități pentru eveniment'
      }
    },
    {
      page_id: newPage.id,
      order_index: 5,
      section_type: 'service_details',
      heading: 'Asistență pentru părinți',
      content: {
        heading: 'Asistență pentru părinți',
        body: '<p>Găsești mai jos răspunsuri la cele mai frecvente întrebări despre organizarea petrecerilor în zona Ilfov și detaliile de colaborare pentru evenimentul tău.</p>',
        image_url: '/images/locatii/popesti_faq_trust_1782285001823.png',
        image_alt: 'Moment de interacțiune între animator, copii și părinți'
      }
    }
  ];

  for (const s of sections) {
    const { error } = await supabase.from('kassia_page_sections').insert(s);
    if (error) console.log('Section error:', error);
  }
  console.log('Inserted 5 clean sections with images.');
}

run();
