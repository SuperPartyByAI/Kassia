import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '3a754972-74d7-4632-9dfa-2aa9be7682db'; // REAL Main Hub

  // Update show_pricing_preview flag
  await supabase.from('kassia_pages').update({ show_pricing_preview: true }).eq('id', pageId);
  console.log("Enabled show_pricing_preview");

  const updates = [
    {
      id: 'e1f8ba36-0568-450f-a38e-09dcba821bc1', // hero
      order_index: 1,
      heading: "Animatori pentru petreceri de copii în București și Ilfov",
      content: {
        "body": "Organizăm programe interactive pentru petreceri de copii acasă, la restaurant, spații de joacă sau grădinițe. Fiecare detaliu al petrecerii este adaptat în funcție de numărul invitaților și locație, pentru o experiență excelentă.",
        "heading": "Animatori pentru petreceri de copii în București și Ilfov",
        "image_alt": "Animatori petreceri copii București",
        "image_url": "/images/animatori/animatori-copii-bucuresti-hero.webp"
      }
    },
    {
      id: 'b2e93f45-2345-5678-9abc-def012345678', // Scenarii (was service_details)
      order_index: 2,
      heading: "Scenarii frecvente pentru petreceri în București și Ilfov",
      section_type: "service_details",
      content: {
        "body": "<strong>La apartament:</strong> Spațiul este adesea restrâns. Prioritizăm jocurile de atenție, atelierele statice, ghicitorile și pictura pe față.<br><br><strong>La curte în Ilfov:</strong> Dacă avem spațiu verde generos, personajele animatoare vor organiza ștafete, competiții cu recuzită mare și jocuri dinamice care consumă energia copiilor.<br><br><strong>La restaurant sau terasă:</strong> Adaptăm activitățile pentru a nu deranja ceilalți clienți și lucrăm într-o zonă bine delimitată, păstrând copiii grupați în jurul animatorilor.",
        "heading": "Scenarii frecvente pentru petreceri în București și Ilfov",
        "image_alt": "Scenarii pentru petreceri in Bucuresti si Ilfov",
        "image_url": "/images/animatori/animatori-copii-bucuresti-varste-copii.webp"
      }
    },
    {
      id: 'c3a04f56-3456-6789-abcd-ef0123456789', // Ce evitam (was service_details)
      order_index: 3,
      heading: "Ce evităm când organizăm activități cu grupuri de copii",
      section_type: "service_details",
      content: {
        "body": "Pentru a păstra un mediu funcțional, evităm planificarea programului în același timp cu servirea mesei (copiii nu se pot concentra la două lucruri simultan). Totodată, nu recomandăm petrecerile în care muzica restaurantului acoperă vocile animatorilor sau unde spațiul de joacă nu este separat de cel al adulților. Organizarea clară este cheia unei petreceri reușite.",
        "heading": "Ce evităm când organizăm activități cu grupuri de copii",
        "image_alt": "Ce evitam in organizarea petrecerilor",
        "image_url": "/images/animatori/animatori-copii-bucuresti-evenimente.webp"
      }
    },
    {
      id: 'f3d5ba42-789a-412d-b0a3-a612dfba98e1', // Cum decurge (was service_details)
      order_index: 4,
      heading: "Cum decurge programul cu animatori pas cu pas",
      section_type: "service_details",
      content: {
        "body": "Activitățile sunt structurate progresiv: începem cu o sesiune scurtă de spargere a gheții pentru a apropia copiii, urmată de jocuri de echipă și concursuri dinamice. Către final, includem momente artistice precum modelajul de baloane și organizarea momentului festiv al tortului.",
        "heading": "Cum decurge programul cu animatori pas cu pas",
        "image_alt": "Cum decurge programul de petrecere",
        "image_url": "/images/animatori/animatori-copii-bucuresti-activitati.webp"
      }
    },
    {
      id: 'd4b15f67-4567-789a-bcde-f0123456789a', // 1 vs 2 (was service_details)
      order_index: 5,
      heading: "Un personaj animator sau două personaje animatoare?",
      section_type: "service_details",
      content: {
        "body": "Regula de bază recomandată de Kassia este un personaj animator pentru maximum 12-15 copii prezenți. Pentru un grup de 16-25 de copii, recomandăm cu tărie două personaje animatoare. Un singur animator la un grup foarte mare riscă să piardă atenția celor mici, iar momentele de face-painting ar dura mult prea mult, tăind din timpul jocurilor. Un spațiu bine delimitat și numărul corect de animatori ajută la o experiență superioară.",
        "heading": "Un personaj animator sau două personaje animatoare?",
        "image_alt": "Numar animatori petrecere",
        "image_url": "/images/animatori/animatori-copii-bucuresti-desfasurare-petrecere.webp"
      }
    },
    {
      id: 'a1d82f34-1234-4567-89ab-cdef01234567', // activities_grid
      order_index: 6,
      section_type: "activities_grid"
    },
    {
      id: '1e34fdcc-8c10-410a-9d9e-108cb92fa31a', // testimonials_section (PROTECTED)
      order_index: 8
    },
    {
      id: 'a7e48fa0-789a-a123-b456-c789d0123456', // cta_final
      order_index: 9,
      content: {
        "body": "Alege varianta de program potrivită și scrie-ne direct pe WhatsApp pentru a verifica disponibilitatea în zona ta.",
        "cta_url": "https://wa.me/40768098268?text=Buna!%20As%20dori%20mai%20multe%20detalii%20despre%20programele%20cu%20animatori.",
        "heading": "Planifică petrecerea copilului în București și Ilfov",
        "cta_text": "Discută cu noi pe WhatsApp",
        "image_alt": "Planifică petrecerea cu Kassia",
        "image_url": "/images/animatori/animatori-copii-bucuresti-cta-final.webp"
      }
    },
    // DRAFTS
    { id: 'e5c26f78-5678-89ab-cdef-0123456789ab', section_type: 'draft', order_index: 10 },
    { id: '2a39f6df-b924-4f0f-8f81-80a57e62a19d', section_type: 'draft', order_index: 11 },
    { id: 'f6d37f89-6789-9abc-def0-123456789abc', section_type: 'draft', order_index: 12 },
    { id: '323680be-7197-4038-9468-cb53b1bf4fcf', section_type: 'draft', order_index: 13 }
  ];

  for (const update of updates) {
    const payload = { order_index: update.order_index };
    if (update.section_type) payload.section_type = update.section_type;
    if (update.heading) payload.heading = update.heading;
    if (update.content) payload.content = update.content;
    
    const { error } = await supabase.from('kassia_page_sections').update(payload).eq('id', update.id);
    if (error) console.error("Error updating", update.id, error);
    else console.log("Updated", update.id);
  }

  // Insert NEW sections: Zone acoperite (Order 7)
  const newSections = [
    {
      page_id: pageId,
      section_type: 'service_details',
      heading: 'Zone acoperite în București și Ilfov',
      order_index: 7,
      content: {
        "heading": "Zone acoperite în București și Ilfov",
        "body": "Ne deplasăm la orice adresă din București și județul Ilfov. Avem programe pregătite și adaptate pentru: <a href=\"/animatori-petreceri-copii-sector-1/\">Sector 1</a>, <a href=\"/animatori-petreceri-copii-sector-2/\">Sector 2</a>, <a href=\"/animatori-petreceri-copii-sector-3/\">Sector 3</a>, <a href=\"/animatori-petreceri-copii-sector-4/\">Sector 4</a>, <a href=\"/animatori-petreceri-copii-sector-5/\">Sector 5</a>, <a href=\"/animatori-petreceri-copii-sector-6/\">Sector 6</a>, precum și pentru localitățile din zona metropolitană: <a href=\"/animatori-petreceri-copii-voluntari/\">Voluntari</a>, <a href=\"/animatori-petreceri-copii-berceni/\">Berceni</a>, <a href=\"/animatori-petreceri-copii-popesti-leordeni/\">Popești-Leordeni</a>. Costurile pot varia marginal doar în funcție de distanța în afara Bucureștiului, conform detaliilor de pe <a href=\"/preturi-animatori-copii-bucuresti/\">pagina de prețuri</a>.",
        "image_alt": "Harta de acoperire Bucuresti si Ilfov",
        "image_url": "/images/animatori/animatori-copii-bucuresti-zone-acoperite.webp"
      }
    }
  ];

  for (const newSec of newSections) {
    const { error } = await supabase.from('kassia_page_sections').insert(newSec);
    if (error) console.error("Error inserting", newSec.heading, error);
    else console.log("Inserted", newSec.heading);
  }
})();
