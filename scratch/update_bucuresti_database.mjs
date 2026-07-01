import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: null } // Bypasses WebSocket checks on Node v20
});

const PAGE_ID = '160e370f-0540-4501-b50f-62f88b6c8e83';

async function updateDb() {
  console.log("Starting DB update for page ID:", PAGE_ID);

  // 1. Update kassia_pages metadata
  console.log("Updating kassia_pages metadata...");
  const { error: pageErr } = await supabase
    .from('kassia_pages')
    .update({
      h1: 'Animatori pentru petreceri de copii în București și Ilfov',
      title: 'Animatori petreceri copii București și Ilfov | Jocuri, mascote și activități',
      meta_title: 'Animatori petreceri copii București și Ilfov | Jocuri, mascote și activități',
      meta_description: 'Animatori pentru petreceri de copii în București și Ilfov, cu jocuri interactive, mascote, pictură pe față, modelaj de baloane, mini-disco și activități adaptate vârstei.',
      canonical_url: 'https://www.kassia.ro/animatori-petreceri-copii-bucuresti/',
      updated_at: new Date().toISOString()
    })
    .eq('id', PAGE_ID);

  if (pageErr) {
    console.error("Error updating page metadata:", pageErr);
    process.exit(1);
  }
  console.log("Page metadata updated successfully.");

  // 2. Update kassia_page_sections (9 active sections + 4 drafts)
  console.log("Updating kassia_page_sections...");

  const sectionsToUpdate = [
    {
      id: 'df4b0bbe-34e9-4f62-927f-98567598a83e',
      section_type: 'hero',
      order_index: 0,
      heading: 'Hero Section',
      content: {
        body: 'Organizăm programe de animație premium pentru petreceri de copii în București și Ilfov, cu jocuri interactive, activități captivante, mascote și momente adaptate vârstei copiilor, spațiului și tematicii evenimentului.',
        cta_text: 'Trimite detaliile petrecerii',
        cta_url: '/contact/',
        image_url: '/images/animatori/animatori-copii-bucuresti-hero.webp',
        image_alt: 'Animatori pentru petreceri de copii în București și Ilfov'
      }
    },
    {
      id: 'f3f02f2f-a335-464d-9cf0-9d86552b8b33',
      section_type: 'service_details',
      order_index: 1,
      heading: 'Ce face un animator la petrecerea copilului',
      content: {
        heading: 'Ce face un animator la petrecerea copilului',
        body: 'Animatorul ghidează copiii prin jocuri, dansuri, activități de grup și momente distractive, asigurându-se că petrecerea are ritm și energie. Programul poate include provocări fizice simple, concursuri și momente artistice. Fiecare moment este completat de activități îndrăgite de cei mici, cum ar fi sesiuni de pictură pe față și creații prin modelaj de baloane, oferind o desfășurare variată care îi menține pe toți participanții implicați activ.',
        image_url: '/images/animatori/animatori-copii-bucuresti-program-animatie.webp',
        image_alt: 'Activități interactive cu animatori petreceri copii'
      }
    },
    {
      id: '4cc74718-abdf-4291-b5e0-4eddfc6e0723',
      section_type: 'activities_grid',
      order_index: 2,
      heading: 'Activități care pot fi incluse în program',
      content: {
        cards: [
          {
            title: 'Jocuri interactive',
            body: 'Ștafete, jocuri de echipă și probe distractive adaptate vârstei copiilor și spațiului disponibil.',
            image_url: '/images/animatori/animatori-copii-bucuresti-jocuri-interactive.webp',
            image_alt: 'Jocuri interactive pentru copii'
          },
          {
            title: 'Mascote și personaje',
            body: 'Întâlniri magice cu personaje preferate, aducând bucurie și momente speciale pentru fotografii.',
            image_url: '/images/animatori/animatori-copii-bucuresti-mascota-generica.webp',
            image_alt: 'Mascote petreceri copii'
          },
          {
            title: 'Pictură pe față',
            body: 'Transformări spectaculoase în personajele dorite, cu culori sigure și testate dermatologic.',
            image_url: '/images/animatori/animatori-copii-bucuresti-pictura-pe-fata.webp',
            image_alt: 'Pictură pe față copii'
          },
          {
            title: 'Modelaj din baloane',
            body: 'Figurine colorate (săbii, flori, animăluțe) oferite fiecărui copil ca amintire din partea echipei.',
            image_url: '/images/animatori/animatori-copii-bucuresti-modelaj-baloane.webp',
            image_alt: 'Modelaj din baloane'
          },
          {
            title: 'Dansuri și mini-disco',
            body: 'Coregrafii simple și muzică veselă care antrenează toți copiii în mișcare și dans.',
            image_url: '/images/animatori/animatori-copii-bucuresti-mini-disco.webp',
            image_alt: 'Mini disco cu animatori'
          },
          {
            title: 'Ateliere creative',
            body: 'Crafting și activități practice tematice unde cei mici își pot dezvolta imaginația.',
            image_url: '/images/animatori/animatori-copii-bucuresti-atelier-creativ.webp',
            image_alt: 'Atelier creativ petrecere copii'
          }
        ]
      }
    },
    {
      id: 'bee16c50-8319-403c-9d18-3fcdd9715d76',
      section_type: 'service_details',
      order_index: 3,
      heading: 'Cum adaptăm programul pentru petrecerile din București și Ilfov',
      content: {
        heading: 'Cum adaptăm programul pentru petrecerile din București și Ilfov',
        body: 'Structura fiecărui program este adaptată în funcție de vârsta participanților și dinamica grupului. Pentru preșcolari, prioritizăm activități senzoriale, jocuri muzicale blânde și interacțiune caldă. Pentru școlari și copii mai mari, construim competiții tematice, ștafete și provocări potrivite lor. Această adaptare asigură că toți participanții se simt implicați. Detalii suplimentare despre opțiuni sunt disponibile pe pagina de prezentare pentru <a href="/pachete-animatori-copii-bucuresti/">Programe animatori copii</a>.',
        image_url: '/images/animatori/animatori-copii-bucuresti-varste-copii.webp',
        image_alt: 'Activități adaptate după vârstă'
      }
    },
    {
      id: '2ec4a920-11d9-4b12-befd-611745779278',
      section_type: 'service_details',
      order_index: 4,
      heading: 'Petreceri acasă, la restaurant, grădiniță sau spațiu de joacă',
      content: {
        heading: 'Petreceri acasă, la restaurant, grădiniță sau spațiu de joacă',
        body: 'Echipa Kassia se deplasează la locația aleasă de dumneavoastră în București sau Ilfov. Fie că evenimentul are loc în sufragerie, în curtea casei, într-o sală de clasă la grădiniță sau la un restaurant primitor, adaptăm recuzita și modul de desfășurare a jocurilor pentru siguranța copiilor. Organizăm jocuri potrivite pentru spații restrânse sau activități în aer liber, menținând energia la cote ridicate.',
        image_url: '/images/animatori/animatori-copii-bucuresti-zone-acoperite.webp',
        image_alt: 'Deplasare animatori la locații'
      }
    },
    {
      id: '7644b9a1-0e4c-4a50-8d93-50466f4c2a97',
      section_type: 'service_details',
      order_index: 5,
      heading: 'Pentru ce tipuri de petreceri este potrivit',
      content: {
        heading: 'Pentru ce tipuri de petreceri este potrivit',
        body: 'Programele noastre sunt potrivite pentru aniversări, botezuri, evenimente de familie unde sunt mulți copii invitați sau serbări. Prezența unui animator oferă un echilibru excelent: adulții se pot relaxa și socializa, știind că cei mici sunt supravegheați și implicați în activități creative. Pentru detalii specifice despre servicii locale din anumite sectoare, poți consulta pagina <a href="/animatori-petreceri-copii-sector-1/">Animatori petreceri copii Sector 1</a>.',
        image_url: '/images/animatori/animatori-copii-bucuresti-evenimente.webp',
        image_alt: 'Tipuri de evenimente pentru copii'
      }
    },
    {
      id: '7c36af14-c261-4809-adec-a23642ef83ee',
      section_type: 'service_details',
      order_index: 6,
      heading: 'De ce să alegi Kassia pentru petrecerea copilului',
      content: {
        heading: 'De ce să alegi Kassia pentru petrecerea copilului',
        body: 'Punem accent pe activități potrivite fiecărui context, comunicare blândă și costume îngrijite. Structurăm desfășurarea programului împreună cu dumneavoastră pentru a ne asigura că ritmul este cel dorit. Pentru un plus de culoare, puteți opta și pentru prezența unei <a href="/mascote-petreceri-copii-bucuresti/">Mascote pentru petreceri copii</a>, aducând personajele preferate direct în mijlocul petrecerii.',
        image_url: '/images/animatori/animatori-copii-bucuresti-servicii-complementare.webp',
        image_alt: 'De care să alegi Kassia'
      }
    },
    {
      id: '0def1f16-9493-44c1-a6d2-1ee1c10f24cb',
      section_type: 'process_steps',
      order_index: 7,
      heading: 'Cum stabilim programul',
      content: {
        steps: [
          {
            title: 'Ne contactați cu detaliile petrecerii',
            body: 'Ne transmiteți data, ora și numărul estimat de copii invitați prin formularul nostru de pe site sau direct pe WhatsApp.'
          },
          {
            title: 'Stabilim profilul invitaților și locația',
            body: 'Discutăm despre vârsta copiilor, specificul spațiului unde se desfășoară petrecerea și preferințele sărbătoritului.'
          },
          {
            title: 'Alegem mixul potrivit de activități',
            body: 'Selectăm personajele dorite, dansurile, pictura pe față sau modelajul de baloane.'
          },
          {
            title: 'Pregătim desfășurarea evenimentului',
            body: 'Definim structura programului pas cu pas pentru ca totul să decurgă fluid și potrivit contextului.'
          }
        ],
        image_url: '/images/animatori/animatori-copii-bucuresti-desfasurare-petrecere.webp',
        image_alt: 'Etape planificare program'
      }
    },
    {
      id: '5dc0631e-082d-43e2-ae13-e2aaa602ff1e',
      section_type: 'cta_final',
      order_index: 8,
      heading: 'Planifică petrecerea copilului în București și Ilfov',
      content: {
        heading: 'Planifică petrecerea copilului în București și Ilfov',
        body: 'Ne puteți trimite detaliile evenimentului dumneavoastră, iar echipa noastră vă ajută să stabiliți activitățile potrivite în funcție de vârsta copiilor, locație și tematica petrecerii.',
        cta_text: 'Trimite detaliile petrecerii',
        cta_url: '/contact/',
        image_url: '/images/animatori/animatori-copii-bucuresti-cta-final.webp',
        image_alt: 'Planifică petrecerea cu Kassia'
      }
    },
    // The 4 extra sections are updated to 'draft' status
    {
      id: '247757f4-97d6-48c3-ae13-927504390ec2',
      section_type: 'draft',
      order_index: 9,
      heading: null,
      content: { body: '' }
    },
    {
      id: 'ec37c767-cf2f-4c96-9561-8f4b59bbdb8b',
      section_type: 'draft',
      order_index: 10,
      heading: null,
      content: { body: '' }
    },
    {
      id: '77a299b3-9230-4434-a69d-62f9b48ad6a3',
      section_type: 'draft',
      order_index: 11,
      heading: null,
      content: { body: '' }
    },
    {
      id: 'e1dd2eb4-288b-46b3-98a1-6e7caa7706f6',
      section_type: 'draft',
      order_index: 12,
      heading: null,
      content: { body: '' }
    }
  ];

  for (const s of sectionsToUpdate) {
    console.log(`Updating section ID: ${s.id} (type: ${s.section_type}, order: ${s.order_index})...`);
    const { error: secErr } = await supabase
      .from('kassia_page_sections')
      .update({
        section_type: s.section_type,
        order_index: s.order_index,
        heading: s.heading,
        content: s.content,
        updated_at: new Date().toISOString()
      })
      .eq('id', s.id);

    if (secErr) {
      console.error(`Error updating section ID ${s.id}:`, secErr);
      process.exit(1);
    }
  }
  console.log("All page sections updated successfully.");

  // 3. Update kassia_faqs (8 active + 4 drafts)
  console.log("Updating kassia_faqs...");

  const faqsToUpdate = [
    {
      id: 'd1a8dc29-79f8-4485-94b1-cc0806efde05',
      order_index: 1,
      question: 'Ce activități pot fi incluse la petrecerea copiilor în București?',
      answer: 'Programul de animație poate include jocuri interactive, dansuri mini-disco, mascote, pictură pe față, modelaj din baloane și activități creative adaptate vârstei invitaților.'
    },
    {
      id: '0579c0ba-1c83-4aeb-b729-2032f6e676dd',
      order_index: 2,
      question: 'Când este recomandat să ne contactați pentru un animator?',
      answer: 'Recomandăm să ne contactați cu câteva săptămâni înainte de eveniment pentru a verifica disponibilitatea animatorilor doriți pentru data petrecerii.'
    },
    {
      id: '70c9d0b3-d5b2-40f2-8dfa-6baecfe1849f',
      order_index: 3,
      question: 'Asigurați deplasarea animatorilor în tot județul Ilfov și în București?',
      answer: 'Echipa se poate deplasa în toate cartierele din București și în localitățile limitrofe din județul Ilfov pentru a desfășura activitățile direct la locația aleasă.'
    },
    {
      id: '04acecfe-5d78-47fd-9561-321fba1e2941',
      order_index: 4,
      question: 'Cum selectăm cel mai potrivit program de animație?',
      answer: 'Echipa noastră vă ajută să selectați activitățile în funcție de vârsta medie a copiilor, preferințele sărbătoritului și spațiul unde are loc petrecerea.'
    },
    {
      id: 'a6dd724b-1f60-4dc0-9b53-9a76bc14b799',
      order_index: 5,
      question: 'Programul se adaptează în funcție de vârsta copiilor?',
      answer: 'Desigur. Pentru copiii de vârstă preșcolară alegem activități adaptate și jocuri simple, iar pentru copiii mai mari organizăm competiții pe echipe și dansuri antrenante.'
    },
    {
      id: '9cbe7367-7f43-4a9d-99fd-d5c8fecce8b4',
      order_index: 6,
      question: 'Putem asocia un program de animație cu decorațiuni din baloane?',
      answer: 'Da. Puteți opta pentru decoruri tematice din baloane care completează atmosfera de sărbătoare, adaptate stilului ales pentru eveniment.'
    },
    {
      id: '0b13c5f5-57cd-4daa-98f9-cb34d068159f',
      order_index: 7,
      question: 'Pentru ce tipuri de evenimente sunt potriviți animatorii?',
      answer: 'Animatorii sunt potriviți pentru aniversări, botezuri, evenimente de familie unde sunt mulți copii invitați sau serbări.'
    },
    {
      id: 'd523f709-ff3e-4696-8f1d-64b8f554053a',
      order_index: 8,
      question: 'Ce detalii organizatorice sunt necesare la prima discuție?',
      answer: 'Avem nevoie de data și ora evenimentului, locația, numărul estimat de copii și vârsta aproximativă a acestora pentru a vă propune programul potrivit.'
    },
    // The 4 extra FAQs are updated to 'Draft FAQ - ' prefix
    {
      id: '17d6d32b-b3ff-493e-940b-3ae13c7ef413',
      order_index: 9,
      question: 'Draft FAQ - Se poate adapta programul în funcție de eveniment?',
      answer: 'Placeholder'
    },
    {
      id: '09f8f896-b3a7-40b3-9348-973f396779d7',
      order_index: 10,
      question: 'Draft FAQ - Ce informații trebuie să trimit pentru ofertă?',
      answer: 'Placeholder'
    },
    {
      id: '86509240-f590-4fa5-8216-7239bc996598',
      order_index: 11,
      question: 'Draft FAQ - Se poate adapta programul dacă sunt copii de vârste diferite?',
      answer: 'Placeholder'
    },
    {
      id: '6ec61a46-9716-441a-b3bf-7c75906efdcd',
      order_index: 12,
      question: 'Draft FAQ - Ce se întâmplă dacă spațiul este mic?',
      answer: 'Placeholder'
    }
  ];

  for (const f of faqsToUpdate) {
    console.log(`Updating FAQ ID: ${f.id} (order: ${f.order_index}, question: ${f.question})...`);
    const { error: faqErr } = await supabase
      .from('kassia_faqs')
      .update({
        order_index: f.order_index,
        question: f.question,
        answer: f.answer
      })
      .eq('id', f.id);

    if (faqErr) {
      console.error(`Error updating FAQ ID ${f.id}:`, faqErr);
      process.exit(1);
    }
  }
  console.log("All FAQs updated successfully.");
  console.log("Database update completed successfully.");
}

updateDb().catch(console.error);
