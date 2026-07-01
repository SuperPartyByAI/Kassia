require('dotenv').config({ path: '.env.local' });
const fs = require('fs');
const path = require('path');

// DRY_RUN=true implicit
const DRY_RUN = process.env.DRY_RUN !== 'false';

// Security check
if (!process.env.PUBLIC_SUPABASE_URL || !process.env.SUPABASE_SERVICE_ROLE_KEY) {
  console.error("Missing Supabase credentials. Do not expose them in logs.");
  process.exit(1);
}

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

const logFile = path.join(__dirname, 'batch_a_v3_1_run.log');
function log(msg) {
  const line = `[${new Date().toISOString()}] ${msg}\n`;
  fs.appendFileSync(logFile, line);
  console.log(msg);
}

const forbiddenStrings = [
  "Fără plictiseală", "fără plictiseală", "premium", "lux", "top", "lider", 
  "garantat", "garantată", "servicii complete", "sonorizare inclusă", 
  "echipamente audio performante", "50 sau 100 de copii", "badge-uri cu logo", 
  "vată de zahăr", "fotograf", "magie", "Placeholder"
];

function checkForbidden(obj, context) {
  const str = JSON.stringify(obj);
  for (const forbidden of forbiddenStrings) {
    if (str.includes(forbidden)) {
      log(`ERROR: Forbidden string "${forbidden}" found in payload for ${context}.`);
      process.exit(1);
    }
  }
}

const imagesToVerify = [
  'animatori-copii-bucuresti-jocuri-interactive.webp',
  'animatori-copii-bucuresti-modelaj-baloane.webp',
  'animatori-copii-bucuresti-pictura-pe-fata.webp',
  'animatori-copii-bucuresti-pachete-oferta.webp',
  'animatori-copii-bucuresti-evenimente.webp',
  'echipa-animatori-kassia-events.webp',
  'desfasurare-program-animatie-copii.webp',
  'animatori-copii-bucuresti-cta-final.webp'
];

// Check images
for (const img of imagesToVerify) {
  const p = path.join(__dirname, 'public/images/animatori', img);
  if (!fs.existsSync(p)) {
    log(`ERROR: Image missing physically: ${p}`);
    process.exit(1);
  }
}

log(`Images verified. DRY_RUN is ${DRY_RUN}`);

const restaurantData = {
  page_id: 'b7038460-b34d-4b2d-ba76-d448a6e8fd84',
  expected_slug: 'animatori-copii-la-restaurant-bucuresti',
  expected_path: '/animatori-copii-la-restaurant-bucuresti/',
  updates: {
    title: "Animatori copii la restaurant București | Petreceri | Kassia",
    meta_title: "Animatori copii la restaurant București | Petreceri | Kassia",
    meta_description: "Animatori pentru petreceri copii organizate la restaurant în București și Ilfov, cu jocuri interactive, activități compacte și program adaptat spațiului disponibil.",
    h1: "Animatori pentru copii la restaurant în București"
  },
  sections: [
    {
      id: 'a761ca10-0a3a-49ab-8aa2-54865df57f0a',
      heading: "Cum ținem copiii implicați la o petrecere în restaurant",
      content: {
        body: "<p>La o petrecere organizată într-un restaurant, copiii au nevoie de activități clare, ușor de urmărit și potrivite pentru spațiul disponibil. Animatorul coordonează jocuri interactive, momente creative și activități la masă sau într-un colț dedicat, astfel încât cei mici să aibă un program al lor, iar părinții să poată participa mai relaxat la eveniment.</p>",
        image_url: "/images/animatori/animatori-copii-bucuresti-jocuri-interactive.webp",
        image_alt: "Animator coordonând jocuri pentru copii la o petrecere organizată la restaurant în București"
      }
    },
    {
      id: '37bfdbff-c4e3-4172-b954-25b6ed75d8d8',
      heading: "Activități potrivite pentru spații de interior",
      content: {
        body: "<p>Pentru restaurante și locații cu spațiu restrâns, programul poate include jocuri de grup compacte, modelaj de baloane, pictură pe față, activități creative și mini-disco adaptat volumului permis de locație. Structura activităților se stabilește în funcție de vârsta copiilor, numărul invitaților și spațiul disponibil.</p>",
        image_url: "/images/animatori/animatori-copii-bucuresti-modelaj-baloane.webp",
        image_alt: "Activități creative cu animatori pentru copii într-un spațiu interior din București"
      }
    },
    {
      id: '43524001-2cb7-4ec4-a2d1-178e6d671462',
      heading: "Ce facem dacă restaurantul nu are loc de joacă separat",
      content: {
        body: "<p>Nu este obligatoriu ca restaurantul să aibă un loc de joacă dedicat. În multe cazuri, programul se poate desfășura lângă masa copiilor, într-un colț al salonului sau într-o zonă stabilită împreună cu părinții și personalul locației. Alegem activități care nu necesită mult spațiu și evităm momentele care ar putea încurca desfășurarea evenimentului.</p>",
        image_url: "/images/animatori/animatori-copii-bucuresti-pictura-pe-fata.webp",
        image_alt: "Animator pentru copii într-un spațiu interior compact la restaurant"
      }
    },
    {
      id: 'c4c88e12-ba48-4999-855a-755b351b5ed4',
      heading: "Rezervă animatori pentru petrecerea la restaurant în București",
      content: {
        body: "<p>Trimite-ne data evenimentului, zona, numărul aproximativ de copii și tipul restaurantului, iar echipa Kassia îți poate recomanda o variantă de program adaptată locației. Putem discuta din timp ce activități se potrivesc, cât spațiu este disponibil și ce personaj ar fi potrivit pentru grupa de vârstă a invitaților.</p>",
        cta_url: "/contact/",
        cta_text: "Cere Ofertă",
        image_url: "/images/animatori/animatori-copii-bucuresti-pachete-oferta.webp",
        image_alt: "Program cu animatori pentru petrecere de copii la restaurant în București"
      }
    }
  ],
  faqs: [
    { id: 'd053616f-1f22-4595-9d57-063ebbf03054', question: "Animatorul are nevoie de un loc de joacă separat în restaurant?", answer: "<p>Nu neapărat. Programul poate fi adaptat pentru o zonă restrânsă, pentru masa copiilor sau pentru un colț stabilit împreună cu părinții și personalul restaurantului.</p>" },
    { id: '7b0f12f7-85cf-44c3-ba6f-ddd05f1541b4', question: "Ce activități se potrivesc într-un restaurant?", answer: "<p>De obicei alegem jocuri compacte, modelaj de baloane, pictură pe față, activități creative și momente de dans adaptate spațiului și regulilor locației.</p>" },
    { id: '05ebf189-048c-4650-a3f4-2adc1adbd9a5', question: "Se poate organiza programul dacă restaurantul are spațiu mic?", answer: "<p>Da, dar este important să știm din timp cum este configurată sala. În funcție de spațiu, recomandăm activități statice sau jocuri care nu necesită deplasare amplă.</p>" },
    { id: 'f214f33b-a217-4594-858f-38fabbaa4ce2', question: "Cât timp este potrivit un program cu animator la restaurant?", answer: "<p>Durata se alege în funcție de programul mesei, vârsta copiilor și numărul invitaților. Pentru multe petreceri, un program de 1–2 ore poate acoperi partea principală a evenimentului.</p>" },
    { id: '1604427f-fef7-4af7-97a7-4cdf35fe3c42', question: "Copiii de vârste diferite pot participa la același program?", answer: "<p>Da. Animatorul poate alterna activități simple pentru copiii mai mici cu jocuri mai dinamice pentru copiii mai mari.</p>" },
    { id: '17b2861d-f7a9-4795-8a26-8205e4c40f1b', question: "Ce detalii trebuie să trimitem înainte de rezervare?", answer: "<p>Ne ajută data, ora, restaurantul sau zona, numărul aproximativ de copii, vârstele lor și dacă locația are un spațiu separat pentru activități.</p>" },
    { id: '0f37187b-fe52-4e60-8fac-f873ae617d32', question: "Ce fel de muzică va fi pe fundal în timpul jocurilor?", answer: "<p>Folosim muzică de petrecere pentru copii, dar ajustăm volumul astfel încât să nu depășim limitele impuse de restaurant și să nu deranjăm restul clienților.</p>" },
    { id: '2ee95be9-d4cf-4f90-8936-2634a870c646', question: "Puteți aduce un sistem karaoke pentru copii la restaurant?", answer: "<p>De regulă evităm volumul puternic în spații de restaurant închise pentru a menține un ambient plăcut, concentrându-ne pe jocuri interactive și ateliere creative.</p>" }
  ]
};

const corporateData = {
  page_id: '44ccceb6-1404-4438-84ea-f7e51debe94e',
  expected_slug: 'animatori-eveniment-corporate-copii-bucuresti',
  expected_path: '/animatori-eveniment-corporate-copii-bucuresti/',
  updates: {
    title: "Animatori copii evenimente corporate București | Kassia",
    meta_title: "Animatori copii evenimente corporate București | Kassia",
    meta_description: "Animatori pentru copii la evenimente corporate, Family Day și petreceri de companie în București și Ilfov, cu jocuri interactive, mascote și activități adaptate grupului.",
    h1: "Animatori pentru copii la evenimente corporate în București"
  },
  sections: [
    {
      id: 'd82bfd88-3a36-4717-ad8a-d159f1a299ea',
      heading: "Activități pentru copiii invitați la evenimente corporate",
      content: {
        body: "<p>La un eveniment corporate, copiii invitaților au nevoie de o zonă de activități clar organizată, separată de programul adulților. Animatorii pot coordona jocuri, momente creative și activități adaptate vârstelor, astfel încât părinții să poată participa mai ușor la evenimentul companiei.</p>",
        image_url: "/images/animatori/animatori-copii-bucuresti-evenimente.webp",
        image_alt: "Animatori pentru copii la eveniment corporate în București"
      }
    },
    {
      id: '36203511-1f48-41b8-9ac9-9bdc818490d4',
      heading: "Program adaptat pentru grupuri și vârste diferite",
      content: {
        body: "<p>În funcție de numărul copiilor și de spațiul disponibil, programul poate include jocuri de grup, modelaj de baloane, pictură pe față, mascote sau activități creative. Structura se stabilește înainte de eveniment, astfel încât activitățile să fie potrivite pentru grupa de vârstă și pentru ritmul general al evenimentului.</p>",
        image_url: "/images/animatori/echipa-animatori-kassia-events.webp",
        image_alt: "Activități de grup pentru copii la petrecere de companie în București"
      }
    },
    {
      id: 'a63c22ea-53ee-4719-9d77-1cab4b21c4c4',
      heading: "Organizare pentru sediu, sală de evenimente sau spațiu exterior",
      content: {
        body: "<p>Programul poate fi adaptat pentru sedii de companie, săli de evenimente, restaurante, terase sau spații exterioare, în funcție de regulile locației. Înainte de eveniment discutăm zona disponibilă pentru copii, numărul estimat de participanți și momentele importante din program, pentru ca activitățile să se integreze natural.</p>",
        image_url: "/images/animatori/desfasurare-program-animatie-copii.webp",
        image_alt: "Zonă de activități pentru copii la eveniment de companie în București"
      }
    },
    {
      id: 'f676e5bf-accd-4d77-94ac-d94ec7b61770',
      heading: "Cere o propunere pentru evenimentul companiei",
      content: {
        body: "<p>Trimite-ne data, locația, numărul aproximativ de copii, intervalul dorit și tipul evenimentului. Echipa Kassia poate propune o structură de program cu animatori și activități potrivite pentru copiii invitați, în funcție de spațiu și de obiectivul evenimentului.</p>",
        cta_url: "/contact/",
        cta_text: "Cere Ofertă",
        image_url: "/images/animatori/animatori-copii-bucuresti-cta-final.webp",
        image_alt: "Program cu animatori pentru copii la eveniment corporate în București"
      }
    }
  ],
  faqs: [
    { id: 'f817e008-1d11-473c-985e-f85f8cf3f27d', question: "Pentru ce tipuri de evenimente corporate se potrivesc animatorii pentru copii?", answer: "<p>Programul poate fi adaptat pentru Family Day, petreceri de companie, evenimente de Crăciun, zile aniversare ale firmei sau evenimente unde participă și familiile angajaților.</p>" },
    { id: '4f16899a-4c38-454c-9ece-28eef1c55135', question: "Câți animatori sunt necesari pentru un eveniment corporate?", answer: "<p>Recomandarea depinde de numărul de copii, vârstele acestora și spațiul disponibil. Pentru grupuri mari, poate fi utilă o echipă extinsă, stabilită după detaliile evenimentului.</p>" },
    { id: '9a5f3b7d-706f-4795-b265-d03f94eb91e2', question: "Puteți veni la sediul companiei?", answer: "<p>Da, programul poate fi organizat la sediul companiei, într-o sală de evenimente, la restaurant sau într-un spațiu exterior, în funcție de condițiile locației.</p>" },
    { id: '26015ca4-8654-4b43-b806-e4fdd25ab3a5', question: "Ce activități pot fi incluse pentru copiii angajaților?", answer: "<p>În funcție de vârstă și spațiu, programul poate include jocuri de grup, activități creative, modelaj de baloane, pictură pe față, mini-disco sau mascote.</p>" },
    { id: 'a5996fc4-fb0e-4507-b526-cfc8ad5b8bfc', question: "Se poate adapta programul la agenda evenimentului?", answer: "<p>Da. Discutăm înainte momentele importante ale evenimentului, intervalul disponibil și zona dedicată copiilor, astfel încât activitățile să se integreze natural.</p>" },
    { id: '89eeb4b2-d5fa-4256-b1ba-6fa767fc241a', question: "Ce detalii trebuie trimise pentru o propunere?", answer: "<p>Sunt utile data, locația, intervalul dorit, numărul estimat de copii, vârstele acestora și tipul evenimentului corporate.</p>" },
    { id: '45e0d028-8112-43b6-8f64-44e25d8406ac', question: "Putem organiza activitățile copiilor într-o sală de meeting separată?", answer: "<p>Absolut, este o soluție excelentă pentru a delimita zona de joacă de zona principală a evenimentului de companie și pentru a respecta programul organizatoric.</p>" },
    { id: '2850f4d0-3b86-4df8-b324-e9613f5c2ef7', question: "În ce limbă se desfășoară activitățile cu copiii?", answer: "<p>Activitățile se desfășoară în limba română, dar la cerere putem integra și interacțiuni de bază în limba engleză, în funcție de componența invitaților.</p>" }
  ]
};

checkForbidden(restaurantData, 'Restaurant Data Payload');
checkForbidden(corporateData, 'Corporate Data Payload');

async function dbFetch(table, queryParams) {
  const q = new URLSearchParams(queryParams).toString();
  const res = await fetch(`${supabaseUrl}/rest/v1/${table}?${q}`, {
    headers: { 'apikey': supabaseKey, 'Authorization': `Bearer ${supabaseKey}` }
  });
  if (!res.ok) throw new Error(`HTTP error: ${res.status}`);
  return await res.json();
}

async function dbUpdate(table, id, payload) {
  const res = await fetch(`${supabaseUrl}/rest/v1/${table}?id=eq.${id}`, {
    method: 'PATCH',
    headers: {
      'apikey': supabaseKey, 
      'Authorization': `Bearer ${supabaseKey}`,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal'
    },
    body: JSON.stringify(payload)
  });
  if (!res.ok) throw new Error(`HTTP error during update: ${res.status}`);
}

async function checkPage(data) {
  const pages = await dbFetch('kassia_pages', { id: `eq.${data.page_id}` });
  const page = pages[0];
  if (!page) {
    log(`ERROR: Could not find page ${data.page_id}`);
    process.exit(1);
  }
  
  // Validation blockers
  if (page.status !== 'published') { log(`ERROR: Page not published`); process.exit(1); }
  if (page.index_status !== 'index') { log(`ERROR: Page not indexed`); process.exit(1); }
  if (page.include_in_sitemap !== true) { log(`ERROR: Page not in sitemap`); process.exit(1); }
  if (page.slug !== data.expected_slug) { log(`ERROR: Slug mismatch`); process.exit(1); }
  if (page.path !== data.expected_path) { log(`ERROR: Path mismatch`); process.exit(1); }
  
  if (page.show_pricing_preview !== false) {
    log(`WARNING: show_pricing_preview is ${page.show_pricing_preview}, but we do NOT modify it.`);
  }

  log(`PAGE DB OK: ${page.slug} (BEFORE H1: ${page.h1})`);
}

async function runUpdate() {
  log("Starting Batch A V3.1 Validation & Update process via REST...");

  await checkPage(restaurantData);
  await checkPage(corporateData);

  const targets = [restaurantData, corporateData];

  for (const t of targets) {
    log(`\n--- Processing Page ID: ${t.page_id} ---`);
    if (!DRY_RUN) {
      await dbUpdate('kassia_pages', t.page_id, t.updates);
    }
    log(`PAGES UPDATE: [${Object.keys(t.updates).join(', ')}]`);

    for (const s of t.sections) {
      const sections = await dbFetch('kassia_page_sections', { id: `eq.${s.id}`, page_id: `eq.${t.page_id}` });
      const existS = sections[0];
        
      if (!existS) {
        log(`ERROR: Section ${s.id} not found or does not belong to page ${t.page_id}!`); 
        process.exit(1);
      }
      
      // Ensure image urls are strictly from /public/images/animatori/
      if (s.content.image_url && !s.content.image_url.startsWith('/images/animatori/')) {
        log(`ERROR: Image path ${s.content.image_url} is outside allowed directory.`);
        process.exit(1);
      }

      // Merge content
      let newContent = typeof existS.content === 'string' ? JSON.parse(existS.content) : existS.content;
      newContent = { ...newContent, ...s.content };

      log(`SECTION UPDATE: ${s.id} (BEFORE: ${existS.heading}) -> (AFTER: ${s.heading})`);
      if (!DRY_RUN) {
        await dbUpdate('kassia_page_sections', s.id, { heading: s.heading, content: newContent });
      }
    }

    for (const f of t.faqs) {
      const faqsList = await dbFetch('kassia_faqs', { id: `eq.${f.id}`, page_id: `eq.${t.page_id}` });
      const existF = faqsList[0];
        
      if (!existF) {
        log(`ERROR: FAQ ${f.id} not found or does not belong to page ${t.page_id}!`); 
        process.exit(1);
      }
      log(`FAQ UPDATE: ${f.id} (BEFORE: ${existF.question}) -> (AFTER: ${f.question})`);
      if (!DRY_RUN) {
        await dbUpdate('kassia_faqs', f.id, { question: f.question, answer: f.answer });
      }
    }
  }

  log(`Done. DRY_RUN was ${DRY_RUN}`);
}

runUpdate().catch(e => {
  log(e.message);
  process.exit(1);
});
