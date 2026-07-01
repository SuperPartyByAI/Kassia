import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3ac893ee-a571-4c60-a340-6da788800f1b';

  // Delete old sections
  await supabase.from('kassia_page_sections').delete().eq('page_id', pageId);

  // New Sections
  const sections = [
    {
      page_id: pageId,
      section_type: 'hero',
      order_index: 1,
      content: {
        heading: "Bucurie și interacțiune pentru cei mici",
        text: "Organizăm petreceri interactive, adaptate în funcție de spațiu și vârsta copiilor. Venim cu energia și recuzita potrivite indiferent dacă evenimentul are loc în mediul urban sau în zona metropolitană.",
        cta_text: "Contactează-ne pentru detalii",
        cta_link: "/contact/",
        image_url: "/images/animatori/animator-petrecere-1.png",
        image_alt: "Animatori interactionand cu copiii la o petrecere"
      }
    },
    {
      page_id: pageId,
      section_type: 'intro',
      order_index: 2,
      content: {
        heading: "Animatori pentru petreceri în cartierul Berceni și zona de sud",
        text: "<p>Cartierul Berceni este una dintre cele mai dinamice zone din Sectorul 4. Ne adresăm familiilor din Piața Sudului, Constantin Brâncoveanu, Apărătorii Patriei, zona Metalurgiei sau Grand Arena. Pentru aceste zone, organizăm frecvent evenimente în apartamente, restaurante, grădinițe și spații de joacă indoor, adaptând jocurile pentru a se potrivi mediului restrâns sau animat al orașului.</p>",
        image_url: "/images/animatori/animatori-petrecere-2.png",
        image_alt: "Activitati creative la o petrecere organizata intr-un apartament sau restaurant in cartierul Berceni"
      }
    },
    {
      page_id: pageId,
      section_type: 'service_details',
      order_index: 3,
      content: {
        heading: "Petreceri în comuna Berceni, curți și ansambluri rezidențiale",
        text: "<p>Pe lângă zona urbană, răspundem cu promptitudine solicitărilor venite din ansamblurile rezidențiale noi din Ilfov. Dacă organizați o petrecere la casă, într-o curte spațioasă, o vilă sau pentru un eveniment amplu în aer liber, animatorii noștri pot desfășura jocuri de mișcare și întreceri captivante care valorifică spațiul exterior.</p><p>Pentru comuna Berceni, confirmăm detaliile logistice după ce primim adresa evenimentului.</p>",
        image_url: "/images/locatii/voluntari_joc_aer_liber_1782299069678.png",
        image_alt: "Jocuri in aer liber si activitati dinamice organizate la o casa in comuna Berceni"
      }
    },
    {
      page_id: pageId,
      section_type: 'custom',
      order_index: 4,
      content: {
        heading: "Activități care se pot integra în program",
        text: "<p>Programul este versatil și creat pentru a menține toți copiii implicați. Printre activitățile noastre se numără jocuri de grup, dansuri, mini-disco, concursuri, coregrafii și modelaj de baloane. Pentru momentele de relaxare, adăugăm activități creative și activități la măsuță.</p><p>De asemenea, prezența personajelor și a mascotelor poate fi integrată ușor, respectând întotdeauna principiul unei adaptări naturale după vârstă și spațiu.</p>",
        image_url: "/images/locatii/voluntari_interactiune_naturala_1782299099268.png",
        image_alt: "Grup de copii la un eveniment intr-un spatiu generos"
      }
    },
    {
      page_id: pageId,
      section_type: 'mascots_cta',
      order_index: 5,
      content: {
        heading: "Cum alegem programul în funcție de spațiu",
        text: "<p>Pentru o petrecere într-un apartament, un restaurant sau o grădiniță, ne concentrăm pe jocuri de echipă statice, ateliere creative și interacțiune directă cu personajele îndrăgite. În contrast, pentru o curte sau un spațiu exterior generos, aducem jocuri dinamice, ștafete, și chiar animatori pe picioroange sau mascote voluminoase, care se pot integra natural în aer liber.</p>",
        cta_text: "Trimite detaliile petrecerii",
        cta_link: "/contact/",
        image_url: "/images/animatori/animatori-picioroange.png",
        image_alt: "Animatori pe picioroange potriviti pentru evenimente ample in aer liber"
      }
    }
  ];

  const { error: secErr } = await supabase.from('kassia_page_sections').insert(sections);
  if (secErr) console.error("Error creating sections:", secErr);
  else console.log("Updated sections successfully.");

})();
