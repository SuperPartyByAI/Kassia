import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  // 1. Create Page
  const { data: page, error: pageErr } = await supabase.from('kassia_pages').insert({
    path: '/animatori-petreceri-copii-berceni/',
    slug: 'animatori-petreceri-copii-berceni',
    status: 'published',
    index_status: 'noindex',
    include_in_sitemap: false,
    canonical_url: 'https://www.kassia.ro/animatori-petreceri-copii-berceni/',
    page_type: 'local',
    title: 'Animatori Petreceri Copii Berceni (Sector 4 & Ilfov) | Kassia',
    meta_title: 'Animatori Petreceri Copii Berceni (Sector 4 & Ilfov) | Kassia',
    meta_description: 'Echipă de animatori pentru petreceri de copii în cartierul Berceni (Sector 4) și comuna Berceni (Ilfov). Programe adaptate pentru apartamente, restaurante sau curți.',
    h1: 'Animatori petreceri copii Berceni: Sector 4 și Ilfov',
    sector: '4',
    neighborhood: 'Berceni'
  }).select('id').single();

  if (pageErr) {
    console.error("Error creating page:", pageErr);
    process.exit(1);
  }
  const pageId = page.id;
  console.log("Created QA page:", pageId);

  // 2. Create Sections
  const sections = [
    {
      page_id: pageId,
      section_type: 'hero',
      content: {
        heading: "Bucurie și interacțiune pentru cei mici",
        text: "Organizăm petreceri interactive, adaptate în funcție de spațiu și vârsta copiilor, indiferent dacă evenimentul are loc în București (Sector 4) sau în zona metropolitană.",
        cta_text: "Trimite detaliile petrecerii",
        cta_link: "/contact/",
        image_url: "/images/animatori/animator-petrecere-1.png",
        image_alt: "Animatori interactionand cu copiii la un eveniment in Berceni"
      },
      order_index: 1
    },
    {
      page_id: pageId,
      section_type: 'intro',
      content: {
        heading: "Acoperire pentru Sector 4 și zona Ilfov Sud",
        text: "<p><strong>Cartierul Berceni (Sector 4):</strong> Ne adresăm părinților din zonele Piața Sudului, Constantin Brâncoveanu, Apărătorii Patriei, Metalurgiei și Grand Arena. Programul este calibrat pentru apartamente, grădinițe și restaurante de cartier.</p><p><strong>Comuna Berceni (Ilfov):</strong> Răspundem solicitărilor venite din ansamblurile rezidențiale noi, acoperind petrecerile la case, curți și vile. Aici spațiul exterior este un avantaj pentru jocurile de mișcare și interacțiunea cu mascote mari.</p>",
        image_url: "/images/animatori/animatori-petrecere-2.png",
        image_alt: "Activitati creative la o petrecere organizata intr-un apartament"
      },
      order_index: 2
    },
    {
      page_id: pageId,
      section_type: 'service_details',
      content: {
        heading: "Activități care se pot integra în program",
        text: "<p>În funcție de dinamica fiecărui grup, animatorii noștri pot adăuga în program jocuri de grup, dansuri, mini-disco, concursuri interactive și coregrafii antrenante.</p><p>Pentru momentele mai așezate, folosim modelaj de baloane, activități creative și activități la măsuță. Totul este ajustat la fața locului pentru a menține copiii implicați și bucuroși, fără timpi morți.</p>",
        cta_text: "Contactează-ne pentru detalii",
        cta_link: "/contact/",
        image_url: "/images/locatii/voluntari_interactiune_naturala_1782299099268.png",
        image_alt: "Copii dansand cu animatorii la un restaurant din Sectorul 4"
      },
      order_index: 3
    },
    {
      page_id: pageId,
      section_type: 'logistics',
      content: {
        heading: "Detalii Logistice și Deplasare",
        text: "<p>Echipa noastră asigură recuzita necesară activităților. Pentru comuna Berceni, confirmăm detaliile logistice după ce primim adresa evenimentului. Timpii de organizare sunt calculați astfel încât echipa să ajungă pregătită pentru startul jocurilor.</p>",
        image_url: "/images/locatii/voluntari_joc_aer_liber_1782299069678.png",
        image_alt: "Jocuri in aer liber organizate la o casa in comuna Berceni"
      },
      order_index: 4
    },
    {
      page_id: pageId,
      section_type: 'mascots_cta',
      content: {
        heading: "Personaje și mascote spectaculoase",
        text: "<p>Oferim posibilitatea de a invita personaje din basme sau mascote populare, extrem de potrivite pentru evenimentele din curțile și ansamblurile rezidențiale.</p>",
        cta_text: "Vezi mascotele",
        cta_link: "/mascote/",
        image_url: "/images/animatori/animatori-picioroange.png",
        image_alt: "Animator modeland baloane in curte"
      },
      order_index: 5
    }
  ];

  const { error: secErr } = await supabase.from('kassia_page_sections').insert(sections);
  if (secErr) console.error("Error creating sections:", secErr);
  else console.log("Created sections.");

  // 3. Create FAQs
  const faqs = [
    { page_id: pageId, question: "Acoperiți și zona de case din comuna Berceni (Ilfov)?", answer: "Da. Ne deplasăm frecvent în ansamblurile rezidențiale noi și la casele din zonă. Pentru comuna Berceni, confirmăm detaliile logistice după ce primim adresa evenimentului.", display_order: 1 },
    { page_id: pageId, question: "Ce include programul dacă petrecerea are loc într-un apartament din cartierul Berceni?", answer: "Într-un apartament sau la un restaurant de cartier ne orientăm spre jocuri mai compacte, activități creative, activități la măsuță și modelaj de baloane, respectând spațiul disponibil.", display_order: 2 },
    { page_id: pageId, question: "Puteți organiza activități în curte, în aer liber?", answer: "Desigur. Dacă aveți o curte spațioasă, putem include jocuri de grup mai ample, concursuri de mișcare și mini-disco în aer liber.", display_order: 3 },
    { page_id: pageId, question: "Cum gestionați o petrecere mixtă, cu fete și băieți?", answer: "Animatorii noștri pregătesc jocuri de echipă și concursuri atractive pentru toți copiii, alternând activitățile astfel încât toți invitații să fie implicați.", display_order: 4 },
    { page_id: pageId, question: "Când este bine să trimitem detaliile pentru un eveniment în weekend?", answer: "Este util să trimiteți detaliile din timp, mai ales pentru evenimentele de weekend, ca să putem verifica zona, tipul locației, personajele dorite și structura programului.", display_order: 5 },
    { page_id: pageId, question: "Veniți cu materialele necesare pentru activități?", answer: "Da, echipa aduce toate recuzitele necesare pentru desfășurarea jocurilor, modelajului de baloane și activităților creative planificate.", display_order: 6 },
    { page_id: pageId, question: "Copiii foarte mici pot participa la jocuri?", answer: "Programul este structurat astfel încât să includă momente atractive și pentru copiii mai mici, folosind activități vizuale și la măsuță adaptate lor.", display_order: 7 },
    { page_id: pageId, question: "Aveți și mascote pentru evenimente în curte sau spații generoase?", answer: "Da, avem mascote care se pot integra bine în petrecerile organizate în curți sau spații generoase, în funcție de tematica aleasă și de disponibilitatea pentru data evenimentului.", display_order: 8 }
  ];

  const { error: faqErr } = await supabase.from('kassia_faqs').insert(faqs);
  if (faqErr) console.error("Error creating faqs:", faqErr);
  else console.log("Created faqs.");

})();
