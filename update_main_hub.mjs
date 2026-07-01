import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

(async () => {
  const pageId = '160e370f-0540-4501-b50f-62f88b6c8e83'; // animatori-petreceri-copii-bucuresti

  const updates = [
    {
      id: 'fc290a18-d9d3-4f9e-bc43-294a500b95fc', // hero
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
      id: '4c8dcdcb-c8b5-4b08-bc23-ec3a0c5c4e97', // Cum decurge (was service_details)
      order_index: 2,
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
      id: 'bee16c50-8319-403c-9d18-3fcdd9715d76', // Scenarii (was service_details)
      order_index: 3,
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
      id: '7644b9a1-0e4c-4a50-8d93-50466f4c2a97', // Ce evitam (was service_details)
      order_index: 4,
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
      id: '0def1f16-9493-44c1-a6d2-1ee1c10f24cb', // 1 vs 2 (was process_steps)
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
      id: '78229a4a-f32f-45b6-a51c-e7c6afc9772c', // activities_grid
      order_index: 6,
      heading: "Activități care pot fi incluse în program",
      section_type: "activities_grid",
      // keeping original content, just setting order
    },
    {
      id: '5dc0631e-082d-43e2-ae13-e2aaa602ff1e', // cta_final
      order_index: 8,
      heading: "Planifică petrecerea copilului în București și Ilfov",
      section_type: "cta_final",
      content: {
        "body": "Alege varianta de program potrivită și scrie-ne direct pe WhatsApp pentru a verifica disponibilitatea în zona ta.",
        "cta_url": "https://wa.me/40768098268?text=Buna!%20As%20dori%20mai%20multe%20detalii%20despre%20programele%20cu%20animatori.",
        "heading": "Planifică petrecerea copilului în București și Ilfov",
        "cta_text": "Discută cu noi pe WhatsApp",
        "image_alt": "Planifică petrecerea cu Kassia",
        "image_url": "/images/animatori/animatori-copii-bucuresti-cta-final.webp"
      }
    },
    // Sections to draft
    { id: '2ec4a920-11d9-4b12-befd-611745779278', section_type: 'draft', order_index: 9 },
    { id: '7c36af14-c261-4809-adec-a23642ef83ee', section_type: 'draft', order_index: 10 }
  ];

  for (const update of updates) {
    const payload = { order_index: update.order_index, section_type: update.section_type };
    if (update.heading) payload.heading = update.heading;
    if (update.content) payload.content = update.content;
    
    const { error } = await supabase.from('kassia_page_sections').update(payload).eq('id', update.id);
    if (error) console.error("Error updating", update.id, error);
    else console.log("Updated", update.id);
  }

  // Insert NEW sections: Pricing Preview and Zone acoperite
  const newSections = [
    {
      page_id: pageId,
      section_type: 'pricing-programs-preview',
      heading: 'Programe cu animatori potrivite pentru evenimentul tău',
      order_index: 0,
      content: {
        "heading": "Programe cu animatori potrivite pentru evenimentul tău",
        "subtitle": "Costuri transparente și organizare clară"
      }
    },
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
