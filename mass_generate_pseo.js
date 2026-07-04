import { createClient } from '@supabase/supabase-js';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const BATCH_SIZE = 10;

async function run() {
  console.log("Starting Mass pSEO Generation...");

  // Fetch all noindex pages
  const { data: pages, error: pageError } = await supabase
    .from('kassia_pages')
    .select('id, path, h1, title')
    .eq('index_status', 'noindex');

  if (pageError) {
    console.error("Error fetching pages:", pageError);
    return;
  }

  console.log(`Found ${pages.length} pages to process.`);

  // Process in batches
  for (let i = 0; i < pages.length; i += BATCH_SIZE) {
    const batch = pages.slice(i, i + BATCH_SIZE);
    console.log(`Processing batch ${i / BATCH_SIZE + 1} of ${Math.ceil(pages.length / BATCH_SIZE)}...`);

    const pageIds = batch.map(p => p.id);

    // Clean existing data for this batch
    await supabase.from('kassia_page_sections').delete().in('page_id', pageIds);
    await supabase.from('kassia_faqs').delete().in('page_id', pageIds);
    await supabase.from('kassia_gallery_items').delete().in('page_id', pageIds);

    const allSections = [];
    const allFaqs = [];
    const allGalleryItems = [];
    const pagesToUpdate = [];

    for (const page of batch) {
      const path = page.path.toLowerCase();
      let keyword = page.h1 || page.title || 'Animatori Petreceri Copii';
      
      // Determine bucket for slight variations
      const isAge = path.includes('-ani');
      const isLocation = path.includes('sector') || path.includes('ilfov') || path.includes('bucuresti');
      const isBaptism = path.includes('botez') || path.includes('mot');
      
      let introSubheading = 'Personaje îndrăgite, jocuri interactive și amintiri de neuitat.';
      if (isAge) introSubheading = `Programe perfect adaptate pentru energia copiilor la această vârstă!`;
      if (isLocation) introSubheading = `Suntem prezenți zilnic cu evenimente magice în zona ta. Fără taxe ascunse de transport.`;
      if (isBaptism) introSubheading = `Cea mai bună soluție pentru a menține copiii ocupați în timp ce adulții se bucură de petrecere.`;

      // 1. Hero
      allSections.push({
        page_id: page.id,
        section_type: 'hero',
        order_index: 10,
        heading: keyword,
        content: {
          body: `
<div style="font-size:1.3rem; font-weight:700; margin-bottom:1.5rem; display:flex; flex-direction:column; gap:0.75rem; color:#f8fafc;">
  <span style="color:#fcd34d; font-size:1.4rem; text-transform:uppercase; letter-spacing:1px;">Experiența Premium Kassia Events</span>
  <span>${introSubheading}</span>
</div>
<div style="display:flex; justify-content:center; gap:1.25rem; flex-wrap:wrap; margin-top:2.5rem;">
  <a href="#pachete" class="btn-primary" style="background:#0f172a; color:white; padding:16px 32px; border-radius:99px; text-decoration:none; font-weight:800; font-size:1.1rem;">Vezi Oferta și Prețurile</a>
  <a href="https://wa.me/40763795919" class="btn-primary" style="background:#25D366; color:white; padding:16px 32px; border-radius:99px; text-decoration:none; font-weight:800; font-size:1.1rem; box-shadow:0 10px 15px -3px rgba(37,211,102,0.4);">Verifică Disponibilitatea</a>
</div>`,
          image_url: "/images/animatori/animator-petrecere-copii-bucuresti-hero.webp"
        }
      });

      // 2. Costume Catalog
      allSections.push({
        page_id: page.id,
        section_type: 'costume_catalog',
        order_index: 20,
        heading: `Alege personajul preferat pentru ${keyword}`,
        content: {}
      });

      // 3. Service Details - Intro & Features
      allSections.push({
        page_id: page.id,
        section_type: 'service_details',
        order_index: 30,
        heading: `De ce să ne alegi pentru ${keyword}?`,
        content: {
          subheading: 'Dincolo de animație: o experiență interactivă completă',
          body: `
<img src="/images/animatori/animatori-copii-bucuresti-jocuri-interactive.webp" alt="${keyword}" class="rounded-2xl shadow-lg" style="width:100%; max-width:800px; display:block; margin: 2rem auto; object-fit:cover; border: 4px solid white;" />
<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">La Kassia Events nu trimitem doar pe cineva îmbrăcat într-un costum. Oferim o experiență de divertisment completă, bazată pe un scenariu adaptat și jocuri antrenante care îi implică activ pe toți copiii prezenți.</p>
<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 2rem; margin-top: 3rem;">
  <div style="background: white; padding: 2rem; border-radius: 16px; border: 1px solid #e2e8f0; text-align: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
    <div style="font-size: 3rem; margin-bottom: 1rem;">🎨</div>
    <h3 style="font-size: 1.25rem; font-weight: 800; color: #0f172a; margin-bottom: 0.5rem;">Pictură pe Față</h3>
    <p style="color: #475569; font-size: 0.95rem;">Folosim exclusiv vopsele profesionale, sigure și hipoalergenice (Snazaroo, Diamond FX).</p>
  </div>
  <div style="background: white; padding: 2rem; border-radius: 16px; border: 1px solid #e2e8f0; text-align: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
    <div style="font-size: 3rem; margin-bottom: 1rem;">🎈</div>
    <h3 style="font-size: 1.25rem; font-weight: 800; color: #0f172a; margin-bottom: 0.5rem;">Modelaj Baloane</h3>
    <p style="color: #475569; font-size: 0.95rem;">Săbiuțe, flori, cățeluși și inimioare din baloane modelabile pentru fiecare invitat.</p>
  </div>
  <div style="background: white; padding: 2rem; border-radius: 16px; border: 1px solid #e2e8f0; text-align: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05);">
    <div style="font-size: 3rem; margin-bottom: 1rem;">🛡️</div>
    <h3 style="font-size: 1.25rem; font-weight: 800; color: #0f172a; margin-bottom: 0.5rem;">Garanția Kassia</h3>
    <p style="color: #475569; font-size: 0.95rem;">Sistem de backup asigurat: niciodată nu vei rămâne fără animator în ziua petrecerii!</p>
  </div>
</div>`
        }
      });

      // 4. Pricing / Packages
      allSections.push({
        page_id: page.id,
        section_type: 'service_details',
        order_index: 40,
        heading: 'Pachete și Oferte',
        content: {
          body: `
<div id="pachete" style="background: linear-gradient(180deg, #f8fafc 0%, #ffffff 100%); padding: 4rem 2rem; border-radius: 24px; margin: 3rem 0; width: 100%; box-shadow: 0 4px 20px rgba(0,0,0,0.03); border:1px solid #e2e8f0;">
  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 3rem; max-width:1000px; margin: 0 auto;">
    <div style="background: white; padding: 3rem 2rem; border-radius: 24px; border: 1px solid #e2e8f0; text-align: center; display:flex; flex-direction:column; position:relative;">
      <h3 style="font-size: 1.8rem; font-weight: 900; color: #0f172a; margin-bottom:0.5rem;">1 Animator</h3>
      <span style="display:inline-block; font-size:1.1rem; font-weight:700; color:#3b82f6; margin-bottom:1.5rem;">Ideal pentru 10-12 copii</span>
      <ul style="text-align:left; color:#475569; margin-bottom:3rem; padding-left:1.5rem; line-height:1.8;">
        <li>✓ Jocuri interactive și concursuri</li>
        <li>✓ Pictură pe față (Face painting)</li>
        <li>✓ Modelaj de baloane</li>
        <li>✓ Recuzită pentru jocuri</li>
        <li>✓ Boxă portabilă pentru fundal muzical</li>
      </ul>
      <a href="https://wa.me/40763795919" style="margin-top:auto; display: inline-block; padding: 1.25rem 2.5rem; background: #0f172a; color: white; border-radius: 99px; font-weight: 800; text-decoration: none; font-size:1.1rem; transition:transform 0.2s;">Vezi Tarife / Rezervă</a>
    </div>
    <div style="background: white; padding: 3rem 2rem; border-radius: 24px; border: 3px solid #a855f7; box-shadow: 0 25px 50px -12px rgba(168,85,247, 0.15); text-align: center; display:flex; flex-direction:column; transform:scale(1.02); position:relative;">
      <span style="position: absolute; top: -16px; left: 50%; transform: translateX(-50%); background: linear-gradient(to right, #a855f7, #ec4899); color: white; padding: 8px 24px; border-radius: 99px; font-size: 0.9rem; font-weight: 800; letter-spacing:1px;">RECOMANDAT</span>
      <h3 style="font-size: 1.8rem; font-weight: 900; color: #0f172a; margin-bottom:0.5rem;">2 Animatori</h3>
      <span style="display:inline-block; font-size:1.1rem; font-weight:700; color:#ec4899; margin-bottom:1.5rem;">Pentru 12-25 copii</span>
      <ul style="text-align:left; color:#475569; margin-bottom:3rem; padding-left:1.5rem; line-height:1.8;">
        <li>✓ Tot ce include pachetul cu 1 Animator</li>
        <li>✓ Jocuri în echipe (spirit de competiție)</li>
        <li>✓ Timp de așteptare înjumătățit la pictură/baloane</li>
        <li>✓ Super-atmosferă și interacțiune dublă</li>
        <li>✓ Scenete între cele 2 personaje</li>
      </ul>
      <a href="https://wa.me/40763795919" style="margin-top:auto; display: inline-block; padding: 1.25rem 2.5rem; background: linear-gradient(to right, #a855f7, #ec4899); color: white; border-radius: 99px; font-weight: 800; text-decoration: none; font-size:1.1rem; transition:transform 0.2s;">Vezi Tarife / Rezervă</a>
    </div>
  </div>
</div>`
        }
      });

      // 5. Saftey / Avoid
      allSections.push({
        page_id: page.id,
        section_type: 'service_details',
        order_index: 50,
        heading: 'Siguranța pe primul loc: Ce EVITĂM cu strictețe',
        content: {
          body: `
<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Pentru noi, distracția nu trebuie să compromită niciodată siguranța copiilor sau confortul părinților.</p>
<ul style="font-size:1.15rem; line-height:1.8; color:#475569;">
  <li><strong>Fără limbaj sau atitudine nepotrivită:</strong> Respectăm standardele morale și educaționale. Artiștii noștri nu folosesc expresii vulgare.</li>
  <li><strong>Fără culori ieftine:</strong> Nu facem rabat la calitatea materialelor. Culorile de face-painting sunt profesionale, pe bază de apă, și se spală imediat, fără să irite pielea.</li>
  <li><strong>Fără jocuri periculoase:</strong> Toată recuzita este din materiale sigure (spumă, plastic moale, pânză), concepută special pentru evenimente cu copii hiperactivi.</li>
  <li><strong>Nu forțăm copiii timizi:</strong> Dacă un copil este mai retras, animatorul va folosi tehnici blânde de integrare, respectând ritmul fiecăruia.</li>
</ul>`
        }
      });

      // 6. Step by step
      allSections.push({
        page_id: page.id,
        section_type: 'service_details',
        order_index: 60,
        heading: 'Cum decurge programul pas cu pas?',
        content: {
          body: `
<img src="/images/animatori/desfasurare-program-animatie-copii.webp" alt="Program animatori copii" class="rounded-2xl shadow-lg" style="width:100%; max-width:800px; display:block; margin: 2rem auto; object-fit:cover; border: 4px solid white;" />
<ol style="font-size:1.15rem; line-height:1.8; color:#475569; padding-left:1.5rem;">
  <li><strong>Sosirea "În Secret":</strong> Animatorii ajung de obicei cu 10-15 minute mai devreme pentru a se schimba, astfel încât surpriza să fie totală la prima apariție.</li>
  <li><strong>Introducerea Eroului:</strong> Apariția personajelor este grandioasă, punând sărbătoritul direct în centrul atenției.</li>
  <li><strong>Jocuri și Concursuri (aprox. 60-70% din timp):</strong> Se scot parașutele colorate, sacii de sărit, tunelul bucuriei și începe o adevărată competiție distractivă, cu muzică în fundal.</li>
  <li><strong>Momentul de Relaxare (Pictură și Baloane):</strong> După ce s-a consumat energia, copiii sunt invitați la atelierul de pictură pe față și la primirea figurinelor din baloane.</li>
  <li><strong>Tăierea Tortului:</strong> Personajele rămân alături de sărbătorit pentru a-i cânta "La Mulți Ani" și pentru a asista la momentul tortului (pe muzica adecvată din boxa portabilă).</li>
  <li><strong>Sesiunea Foto:</strong> Nu plecăm până nu facem o mulțime de poze grozave cu toți copiii și părinții!</li>
</ol>`
        }
      });

      // 7. Age Differences (Crucial for SEO)
      allSections.push({
        page_id: page.id,
        section_type: 'service_details',
        order_index: 70,
        heading: 'Activități adaptate strict pe grupe de vârstă',
        content: {
          body: `
<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Ceea ce funcționează la 4 ani, cu siguranță nu va funcționa la 10 ani. De aceea, personalizăm scenariul fiecărui pachet în funcție de media de vârstă a invitaților:</p>
<div style="display:flex; flex-direction:column; gap:1.5rem;">
  <div style="background:#f8fafc; padding:1.5rem; border-left:4px solid #3b82f6;"><strong>Copii Mici (1-3 ani):</strong> Accent pe vizual și muzical. Folosim mașina de baloane de săpun, tunele textile moi, cântecele scurte (Zumba Kids), mascote de pluș cu care ei pot interacționa blând.</div>
  <div style="background:#f8fafc; padding:1.5rem; border-left:4px solid #10b981;"><strong>Copii (4-7 ani):</strong> Vârsta de aur a imaginației! Aici personajele au cel mai mare succes. Implicăm copiii în scenete, căutarea comorilor, jocuri cu parașuta, sfoara curajului și concursuri amuzante.</div>
  <div style="background:#f8fafc; padding:1.5rem; border-left:4px solid #a855f7;"><strong>Copii Mari (8-12 ani):</strong> Aceste petreceri se transformă în "Mini-Discotecă". Evităm personajele clasice și recomandăm DJ/MC Animatori care organizează battle-uri de dans, karaoke, freeze dance, jocuri de strategie pe echipe și concursuri tip "Cine știe câștigă".</div>
</div>`
        }
      });

      // 8. Locations / Acoperire
      allSections.push({
        page_id: page.id,
        section_type: 'service_details',
        order_index: 80,
        heading: 'Suntem acolo unde este petrecerea ta!',
        content: {
          body: `
<p style="font-size:1.15rem; line-height:1.7; margin-bottom:1.5rem;">Ne deplasăm la orice locație din București și județul Ilfov. Fie că petrecerea are loc acasă, la curte, la un loc de joacă, la grădiniță sau la un restaurant, echipa noastră este pregătită.</p>
<p style="font-size:1.15rem; line-height:1.7;">Dacă evenimentul este într-un spațiu de evenimente formal, prezența animatorilor este de-a dreptul "salvatoare" pentru părinți, care astfel se pot bucura liniștiți de meniu și muzică, știind că cei mici sunt supravegheați și distrați de o echipă profesionistă în colțul copiilor.</p>`
        }
      });

      // 9. Gallery
      allSections.push({
        page_id: page.id,
        section_type: 'gallery',
        order_index: 90,
        heading: `Galerie: Cum arată ${keyword} cu Kassia`,
        content: {}
      });

      // 10. CTA Final
      allSections.push({
        page_id: page.id,
        section_type: 'cta_final',
        order_index: 100,
        heading: `Rezervă acum echipa perfectă pentru ${keyword}!`,
        content: {}
      });
      
      // 11. Testimonials
      allSections.push({
        page_id: page.id,
        section_type: 'testimonials_section',
        order_index: 110,
        content: {}
      });

      // Gallery Items
      allGalleryItems.push(
        { page_id: page.id, url: '/images/animatori/animatori-copii-bucuresti-jocuri-interactive.webp', alt_text: `Jocuri ${keyword}`, order_index: 10 },
        { page_id: page.id, url: '/images/animatori/animatori-copii-bucuresti-pictura-pe-fata.webp', alt_text: `Pictura ${keyword}`, order_index: 20 },
        { page_id: page.id, url: '/images/animatori/animatori-copii-bucuresti-modelaj-baloane.webp', alt_text: `Baloane ${keyword}`, order_index: 30 }
      );

      // FAQs
      allFaqs.push(
        { page_id: page.id, question: `Cu cât timp înainte trebuie să rezerv echipa pentru ${keyword}?`, answer: "Pentru weekend-uri, recomandăm rezervarea cu cel puțin 2-3 săptămâni înainte, deoarece programul se ocupă foarte repede. Pentru zilele din timpul săptămânii, o săptămână în avans este, de regulă, suficientă.", order_index: 10 },
        { page_id: page.id, question: "Ce se întâmplă dacă un copil nu dorește să fie pictat pe față?", answer: "Niciun copil nu este obligat. Animatorul nostru va propune alternative (un tatuaj mic pe mână) sau îi va oferi direct balonul modelabil, pentru a se asigura că nimeni nu pleacă supărat.", order_index: 20 },
        { page_id: page.id, question: "Puteți ține copiii ocupați în timp ce adulții mănâncă la un eveniment?", answer: "Absolut! Este una dintre cele mai solicitate servicii. Creăm un 'Kids Corner' unde preluăm complet copiii pentru 2, 3 sau 4 ore, lăsând adulții să se bucure de eveniment.", order_index: 30 },
        { page_id: page.id, question: "Vine animatorul și cu muzica?", answer: "Da, fiecare echipă de animatori Kassia vine dotată cu o boxă portabilă cu bluetooth și playlist-uri special create pentru petreceri de copii.", order_index: 40 }
      );

      // Flag page to be updated to 'index'
      pagesToUpdate.push(page.id);
    }

    // Insert all data for batch
    if (allSections.length > 0) {
      const { error: errSec } = await supabase.from('kassia_page_sections').insert(allSections);
      if (errSec) console.error("Error inserting sections for batch:", errSec);
    }
    
    if (allGalleryItems.length > 0) {
      const { error: errGal } = await supabase.from('kassia_gallery_items').insert(allGalleryItems);
      if (errGal) console.error("Error inserting gallery for batch:", errGal);
    }

    if (allFaqs.length > 0) {
      const { error: errFaq } = await supabase.from('kassia_faqs').insert(allFaqs);
      if (errFaq) console.error("Error inserting FAQs for batch:", errFaq);
    }

    // Update index_status to 'index' for this batch
    if (pagesToUpdate.length > 0) {
      const { error: errUpd } = await supabase.from('kassia_pages').update({ index_status: 'index' }).in('id', pagesToUpdate);
      if (errUpd) console.error("Error updating page index status:", errUpd);
    }
  }

  console.log("Mass pSEO Generation completed successfully!");
}

run();
