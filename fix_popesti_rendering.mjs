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
  console.log(`Working on page ID: ${newPage.id}`);

  // Delete existing
  await supabase.from('kassia_page_sections').delete().eq('page_id', newPage.id);
  await supabase.from('kassia_faqs').delete().eq('page_id', newPage.id);

  // Re-insert sections correctly
  const sections = [
    {
      page_id: newPage.id,
      order_index: 1,
      section_type: 'service_details',
      heading: 'Servicii de animație pentru petreceri în Popești-Leordeni',
      content: {
        heading: 'Servicii de animație pentru petreceri în Popești-Leordeni',
        body: '<p>Bine ai venit la Kassia Events! Organizăm <a href="/animatori-petreceri-copii/">animatori petreceri copii</a> de neuitat în Popești-Leordeni. Echipa noastră de profesioniști este pregătită să aducă zâmbete și bucurie la evenimentul tău, adaptându-ne perfect nevoilor tale, indiferent de spațiul ales pentru desfășurarea petrecerii.</p>'
      }
    },
    {
      page_id: newPage.id,
      order_index: 2,
      section_type: 'service_details',
      heading: 'Petreceri acasă, la curte sau la restaurant',
      content: {
        heading: 'Petreceri acasă, la curte sau la restaurant',
        body: '<p>Fie că organizezi evenimentul în confortul propriei case, într-o curte spațioasă, la un loc de joacă sau la un restaurant din Popești-Leordeni, noi avem soluția ideală. Consultă pagina noastră pentru <a href="/preturi-animatori-copii-bucuresti/">detalii pentru programele cu animatori</a> pentru a afla mai multe despre opțiunile de deplasare și structura programelor oferite.</p>'
      }
    },
    {
      page_id: newPage.id,
      order_index: 3,
      section_type: 'service_details',
      heading: 'Personaje și mascote pentru tematici diferite',
      content: {
        heading: 'Personaje și mascote pentru tematici diferite',
        body: '<p>Alege dintr-o gamă largă de costume și tematici, special create pentru a aduce magia la petrecerea micuțului tău. Răsfoiește catalogul nostru de <a href="/personaje-animatori-copii-bucuresti/">personaje</a> și descoperă cele mai îndrăgite <a href="/mascote-petreceri-copii-bucuresti/">mascote</a>, potrivite pentru a face din orice aniversare un moment memorabil pentru cei mici.</p>'
      }
    },
    {
      page_id: newPage.id,
      order_index: 4,
      section_type: 'service_details',
      heading: 'Detalii pentru program și deplasare',
      content: {
        heading: 'Detalii pentru program și deplasare',
        body: '<p>Ne asigurăm că fiecare moment este bine organizat și că buna dispoziție este la cote maxime. Deplasarea în zona Popești-Leordeni se face eficient și prompt, respectând programul prestabilit, astfel încât echipa de animație să fie prezentă exact la momentul potrivit pentru a începe activitățile interactive alături de invitați.</p>'
      }
    }
  ];

  for (const s of sections) {
    const { error } = await supabase.from('kassia_page_sections').insert(s);
    if (error) console.log('Section error:', error);
  }
  console.log('Inserted 4 service_details sections.');

  // Re-insert FAQS
  const faqs = [
    { question: 'Veniți la petreceri acasă sau la curte în Popești-Leordeni?', answer: 'Da, ne deplasăm la domiciliu în Popești-Leordeni, fie că petrecerea are loc în apartament, la casă, în curte sau într-un spațiu de evenimente. Activitățile se adaptează în funcție de spațiul disponibil și de vârsta copiilor.' },
    { question: 'Cum se stabilește deplasarea pentru Popești-Leordeni?', answer: 'Popești-Leordeni intră în zona Ilfov, iar detaliile de deplasare sunt explicate pe pagina dedicată detaliilor pentru animatori. Pe pagina locală păstrăm informația practică, iar detaliile comerciale rămân centralizate acolo.' },
    { question: 'Când este bine să vă contactăm pentru o petrecere în Popești-Leordeni?', answer: 'Este recomandat să ne contactați din timp, mai ales pentru evenimentele de weekend sau pentru personajele foarte solicitate. Disponibilitatea se confirmă în funcție de dată, interval și personajul ales.' },
    { question: 'Care este diferența dintre un animator și o mascotă la petrecere?', answer: 'Animatorul coordonează copiii, explică jocurile și conduce activitățile. Mascota este un costum voluminos, potrivit pentru poze, întâmpinare, dans, momentul tortului și interacțiune vizuală.' },
    { question: 'Putem chema animatori și la un botez în Popești-Leordeni?', answer: 'Da, animatorii pot fi integrați și la botezuri, nunți sau evenimente de familie unde sunt prezenți copii. Programul se adaptează spațiului, vârstei copiilor și momentelor importante din eveniment.' },
    { question: 'Ce se întâmplă dacă petrecerea este în aer liber și vremea se schimbă?', answer: 'Programul poate fi adaptat la interior, pe terasă acoperită sau într-o zonă protejată, dacă locația permite. Este util să existe o variantă de rezervă pentru petrecerile organizate în curte.' },
    { question: 'Cum alegem personajul pentru o petrecere în Popești-Leordeni?', answer: 'Personajul se alege în funcție de tema petrecerii, vârsta copiilor și disponibilitatea pentru data evenimentului. Pentru idei, părinții pot consulta catalogul de personaje Kassia.' },
    { question: 'Organizați activități și la grădinițe sau after-school-uri din Popești-Leordeni?', answer: 'Da, putem participa și la evenimente organizate în grădinițe, after-school-uri sau spații educaționale din Popești-Leordeni. Activitățile se stabilesc în funcție de spațiu, numărul de copii și formatul evenimentului.' }
  ];

  let order = 1;
  for (const f of faqs) {
    const { error } = await supabase.from('kassia_faqs').insert({
        page_id: newPage.id,
        question: f.question,
        answer: f.answer,
        order_index: order++
    });
    if (error) console.log('FAQ error:', error);
  }
  console.log('Inserted 8 FAQs.');

  // Also ensure page_type is correct
  await supabase.from('kassia_pages').update({ page_type: 'service_location' }).eq('id', newPage.id);

}

run();
