import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

const newPath = '/animatori-petreceri-copii-voluntari/';

const sections = [
  {
    order_index: 10,
    heading: 'Animatori pentru petreceri de copii în Voluntari și Pipera',
    section_type: 'split_image_left',
    content: {
      subheading: 'La domiciliu, în curte, ansambluri rezidențiale sau restaurante',
      body: '<p>Când vine vorba de organizarea unei petreceri reușite pentru copii în zona de Nord a capitalei, flexibilitatea și experiența echipei de animație sunt esențiale. Intervenim cu succes atât în curțile spațioase ale vilelor din Voluntari, cât și în spațiile exterioare sau terasele din ansamblurile rezidențiale din Pipera. Fie că plănuiți evenimentul acasă, la un restaurant local sau la o grădiniță privată, animatorii noștri vin pregătiți să transforme spațiul într-un tărâm al distracției.</p>',
      image_url: '/images/locatii/voluntari_curte_spatioasa_1782299060724.png?v=1',
      image_alt: 'Animator pentru copii la petrecere în Voluntari',
      is_active: true
    }
  },
  {
    order_index: 20,
    heading: 'Petreceri în curte și în ansambluri rezidențiale',
    section_type: 'split_image_right',
    content: {
      subheading: 'Organizare clară pentru grupuri de copii în aer liber',
      body: '<p>Organizarea unei petreceri în curte oferă avantajul unui spațiu generos, fie că vorbim de gazon, terase sau spații exterioare amenajate. Echipa noastră este special pregătită să coordoneze grupuri de copii în aer liber, captându-le atenția cu activități dinamice care previn dispersarea grupului. De la concursuri energice până la jocuri interactive de echipă, ne adaptăm perfect logisticii fiecărei locații pentru ca cei mici să se bucure în siguranță.</p>',
      image_url: '/images/locatii/voluntari_joc_aer_liber_1782299069678.png?v=1',
      image_alt: 'Activități pentru copii organizate în curte la petrecere',
      is_active: true
    }
  },
  {
    order_index: 30,
    heading: 'Jocuri și activități potrivite pentru grupuri de copii',
    section_type: 'split_image_left',
    content: {
      subheading: 'Distracție adaptată vârstei',
      body: '<p>Programele noastre includ o selecție variată de jocuri dinamice, activități interactive, modelaj de baloane, concursuri, dansuri și activități tematice. Fiecare moment este gândit pentru a încuraja lucrul în echipă, socializarea și bucuria. Animatorul se va asigura că ritmul petrecerii este mereu unul alert, dar echilibrat, cu momente de relaxare și ateliere simple la măsuță, ideale pentru terasele acoperite.</p>',
      image_url: '/images/locatii/voluntari_atelier_terasa_1782299087573.png?v=1',
      image_alt: 'Animator coordonând jocuri pentru copii în aer liber',
      cta_text: 'Detalii pentru programele cu animatori',
      cta_url: '/animatori-petreceri-copii/',
      is_active: true
    }
  },
  {
    order_index: 40,
    heading: 'Personaje și mascote pentru tematici diferite',
    section_type: 'split_image_right',
    content: {
      subheading: 'Adaptare la preferințele copilului',
      body: '<p>O petrecere tematică prinde viață atunci când personajul preferat își face apariția. Oferim o gamă largă de personaje și mascote potrivite atât pentru fetițe, cât și pentru băieței. Fie că este vorba despre eroi curajoși, prințese grațioase sau mascote colorate, personajul va interacționa cu invitații, va conduce jocurile și va participa la momentul mult așteptat al tortului.</p>',
      image_url: '/images/locatii/voluntari_mascota_elegant_1782299078537.png?v=1',
      image_alt: 'Personaj pentru copii la eveniment în Voluntari',
      cta_text: 'Vezi toate personajele',
      cta_url: '/personaje-petreceri-copii-bucuresti/',
      is_active: true
    }
  },
  {
    order_index: 50,
    heading: 'Întrebări frecvente despre organizarea petrecerii în Voluntari și Pipera',
    section_type: 'split_image_left',
    content: {
      subheading: 'Asistență pentru părinți',
      body: '<p>Planificarea unui eveniment la domiciliu sau în spații rezidențiale necesită o organizare atentă. Pentru a vă ajuta să pregătiți fiecare detaliu al vizitei echipei de animație, am răspuns mai jos la cele mai importante întrebări legate de logistică, spații exterioare și program.</p>',
      image_url: '/images/locatii/voluntari_interactiune_naturala_1782299099268.png?v=1',
      image_alt: 'Interacțiune între animator, copii și părinți la petrecere',
      is_active: true
    }
  }
];

const faqs = [
  { order_index: 10, question: 'Vă deplasați la domiciliu în Voluntari și Pipera?', answer: 'Da, echipa noastră se deplasează la domiciliul clienților din Voluntari și Pipera, fie că este vorba de o casă individuală, o vilă cu curte sau un apartament într-un ansamblu rezidențial.' },
  { order_index: 20, question: 'Putem organiza programul într-o curte sau într-un spațiu exterior?', answer: 'Absolut! Spațiile exterioare și curțile generoase sunt excelente pentru activități. Animatorul va adapta jocurile dinamice pentru spațiul pe care îl aveți la dispoziție, menținând atenția grupului.' },
  { order_index: 30, question: 'Ce facem dacă vremea se schimbă și petrecerea era planificată în curte?', answer: 'Este recomandat să aveți mereu un plan de rezervă la interior sau o terasă acoperită. În cazul în care plouă sau vremea devine nefavorabilă, animatorul va muta rapid activitățile la interior, adaptând jocurile pentru noul spațiu.' },
  { order_index: 40, question: 'Ce este util să pregătim înainte de sosirea animatorilor?', answer: 'Nu trebuie să pregătiți echipamente speciale, deoarece animatorul vine cu toate materialele necesare. Este util doar să eliberați o zonă din curte sau din casă pentru jocurile de grup, astfel încât copiii să poată alerga în siguranță.' },
  { order_index: 50, question: 'Este util să existe acces auto sau loc de parcare în apropiere?', answer: 'Deoarece animatorul sosește cu echipamente (boxă audio, accesorii pentru jocuri), un loc de parcare în apropierea locației sau accesul auto în ansamblul rezidențial ne ajută să ajungem și să ne pregătim mai rapid pentru eveniment.' },
  { order_index: 60, question: 'Cum alegem personajul potrivit pentru petrecerea copilului?', answer: 'Vă putem recomanda personajul ideal în funcție de vârsta copilului și tema petrecerii. Fie că doriți o mascotă colorată pentru un eveniment de 1 an sau un erou curajos pentru copiii mai mari, avem o selecție variată din care puteți alege.' },
  { order_index: 70, question: 'Cum adaptați activitățile pentru grupuri diferite de copii?', answer: 'Programul este structurat pe loc în funcție de vârsta participanților și de energia grupului. Alternăm jocurile statice cu cele dinamice pentru a menține implicarea atât a copiilor mici, cât și a celor mai mari.' },
  { order_index: 80, question: 'Cum facem rezervarea pentru programul cu animatori?', answer: 'Ne puteți contacta telefonic sau prin WhatsApp. După ce discutăm detaliile despre locație (Voluntari/Pipera), numărul de copii și preferințele pentru personaj, vom stabili împreună intervalul orar și vom confirma rezervarea.' }
];

async function run() {
  try {
    // 1. Delete existing page to be idempotent
    await supabase.from('kassia_pages').delete().eq('path', newPath);

    // 2. Create the new page
    const { data: newPage, error: errPage } = await supabase.from('kassia_pages').insert({
      path: newPath,
      slug: 'animatori-petreceri-copii-voluntari',
      page_type: 'service_location',
      status: 'published',
      index_status: 'noindex', // KEEP NOINDEX DURING QA
      include_in_sitemap: false, // OUT OF SITEMAP DURING QA
      title: 'Animatori petreceri copii Voluntari și Pipera | Kassia Events',
      h1: 'Animatori petreceri copii în Voluntari și Pipera',
      meta_title: 'Animatori petreceri copii Voluntari și Pipera | Kassia Events',
      meta_description: 'Organizăm petreceri cu animatori și mascote pentru copii la domiciliu, în curte sau ansambluri rezidențiale din Voluntari și Pipera. Detalii și program.',
      canonical_url: 'https://www.kassia.ro' + newPath, // Self referencing
      priority: 0.8
    }).select().single();

    if (errPage) throw errPage;
    console.log('Created new page:', newPage.id);

    // 3. Add sections
    for (const sec of sections) {
      const { error: errSec } = await supabase.from('kassia_page_sections').insert({
        page_id: newPage.id,
        ...sec
      });
      if (errSec) throw errSec;
    }
    console.log('Inserted 5 sections.');

    // 4. Add FAQs
    for (const faq of faqs) {
      const { error: errFaq } = await supabase.from('kassia_faqs').insert({
        page_id: newPage.id,
        ...faq
      });
      if (errFaq) throw errFaq;
    }
    console.log('Inserted 8 FAQs.');

  } catch (err) {
    console.error('Error:', err);
  }
}

run();
