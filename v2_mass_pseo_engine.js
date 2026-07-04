import { createClient } from '@supabase/supabase-js';
import fs from 'fs';

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const BATCH_SIZE = 10;

const CLUSTERS = {
  HUB: ['animatori-petreceri-copii', 'ursitoare', 'baloane', 'magie', 'pictura', 'ateliere', 'pinata', 'vată', 'popcorn', 'gheață', 'oglindă', 'cabina-360'],
  LOCAL: ['sector', 'voluntari', 'pipera', 'otopeni', 'corbeanca', 'chiajna', 'bragadiru', 'popești', 'ilfov', 'militari', 'titan', 'berceni', 'floreasca', 'drumul-taberei', 'baneasa', 'bucuresti'],
  CHARACTER: ['personaj', 'mascot', 'spiderman', 'elsa', 'sonic', 'batman', 'aurora', 'chase', 'venom', 'catboy', 'rapunzel'],
  AGE_CONTEXT: ['-an', '-ani', 'acasa', 'gradinita', 'scoala', 'restaurant', 'aer-liber', 'botez', 'mot', 'turta', 'corporate', 'family-day', 'serbare'],
  THEME: ['frozen', 'supereroi', 'printese', 'paw-patrol', 'gaming', 'minecraft', 'roblox', 'dinozaur', 'unicorn', 'siren', 'jungla', 'safari', 'halloween', 'craciun', 'mini-disco']
};

function getCluster(path) {
  const p = path.toLowerCase();
  for (const t of CLUSTERS.THEME) if (p.includes(t)) return 'THEME';
  for (const l of CLUSTERS.LOCAL) if (p.includes(l)) return 'LOCAL';
  for (const c of CLUSTERS.CHARACTER) if (p.includes(c)) return 'CHARACTER';
  for (const a of CLUSTERS.AGE_CONTEXT) if (p.includes(a)) return 'AGE_CONTEXT';
  return 'HUB';
}

async function run() {
  console.log("Starting V2 Mass pSEO Generation...");

  const { data: allPages, error: err } = await supabase.from('kassia_pages').select('id, path, h1, title, index_status');
  if (err) {
    console.error(err);
    return;
  }

  const pages = allPages.filter(p => p.index_status === 'noindex');
  console.log(`Found ${pages.length} NOINDEX pages to rebuild.`);

  const report = [];

  for (let i = 0; i < pages.length; i += BATCH_SIZE) {
    const batch = pages.slice(i, i + BATCH_SIZE);
    console.log(`Processing batch ${Math.floor(i / BATCH_SIZE) + 1} of ${Math.ceil(pages.length / BATCH_SIZE)}`);
    const pageIds = batch.map(p => p.id);

    await supabase.from('kassia_page_sections').delete().in('page_id', pageIds);
    await supabase.from('kassia_faqs').delete().in('page_id', pageIds);
    await supabase.from('kassia_gallery_items').delete().in('page_id', pageIds);

    const allSections = [];
    const allFaqs = [];
    const allGalleryItems = [];

    for (const page of batch) {
      const cluster = getCluster(page.path);
      const rawKw = page.path.replace(/\//g, '').replace(/-/g, ' ');
      // Simple capitalized title from slug for now if h1 is missing
      const TitleKwCapped = page.h1 || rawKw.charAt(0).toUpperCase() + rawKw.slice(1);

      let sectionsCount = 0;
      let imagesCount = 0;
      let faqsCount = 0;

      // 1. Hero
      allSections.push({
        page_id: page.id,
        section_type: 'hero',
        order_index: 10,
        heading: TitleKwCapped,
        content: {
          body: `<div style="font-size:1.3rem; font-weight:700; margin-bottom:1.5rem; color:#f8fafc;">Alege Experiența Kassia Events</div>
                 <a href="#pachete" class="btn-primary" style="background:#0f172a; color:white; padding:16px 32px; border-radius:99px; text-decoration:none; font-weight:800;">Vezi Pachete și Prețuri</a>`,
          image_url: "/images/animatori/animator-petrecere-copii-bucuresti-hero.webp"
        }
      });
      sectionsCount++; imagesCount++;

      // 2. Specific Section based on cluster
      let specificHeading = '';
      let specificBody = '';
      
      if (cluster === 'LOCAL') {
        specificHeading = `Petreceri perfecte direct în locația ta`;
        specificBody = `<p style="font-size:1.1rem; line-height:1.7;">Suntem prezenți zilnic pentru a oferi bucurie la petrecerile din zona ta. Fie că locuiești la casă cu curte, organizezi petrecerea la un apartament sau ai rezervat un restaurant / loc de joacă, animatorii noștri se vor deplasa la timp și pregătiți de distracție cu absolut toată recuzita necesară.</p>`;
      } else if (cluster === 'AGE_CONTEXT') {
        specificHeading = `Activități alese exact pentru această vârstă și locație`;
        specificBody = `<p style="font-size:1.1rem; line-height:1.7;">Copiii au niveluri complet diferite de energie și putere de concentrare. Noi nu folosim un scenariu standard pe care să îl repetăm mecanic, ci adaptăm tipul jocurilor, intensitatea și recuzita exact pentru această grupă de vârstă. Așa garantăm că nimeni nu se plictisește.</p>`;
      } else if (cluster === 'CHARACTER' || cluster === 'THEME') {
        specificHeading = `Costume impecabile și intrare spectaculoasă`;
        specificBody = `<p style="font-size:1.1rem; line-height:1.7;">Pentru cei mici, eroul lor trebuie să fie real. De aceea folosim doar costume premium, întreținute impecabil, și facem o intrare memorabilă la petrecere. Fiecare personaj este interpretat de un actor cu experiență, care știe să intre în rol și să mențină atenția copiilor.</p>`;
      } else {
        specificHeading = `De ce Kassia Events pentru ${rawKw}?`;
        specificBody = `<p style="font-size:1.1rem; line-height:1.7;">Pentru că distracția copiilor trebuie să fie o certitudine, nu o loterie. Experiența noastră se traduce prin petreceri fără griji pentru tine, și 100% amintiri frumoase pentru sărbătorit.</p>`;
      }

      allSections.push({
        page_id: page.id,
        section_type: 'service_details',
        order_index: 20,
        heading: specificHeading,
        content: { body: specificBody + `<img src="/images/animatori/animatori-copii-bucuresti-jocuri-interactive.webp" alt="${rawKw} jocuri copii" style="width:100%; border-radius:16px; margin-top:20px;" />` }
      });
      sectionsCount++; imagesCount++;

      // 3. Pricing
      allSections.push({
        page_id: page.id,
        section_type: 'service_details',
        order_index: 30,
        heading: 'Pachete Transparente și Corecte',
        content: {
          body: `<div id="pachete" style="display:flex; gap:20px; flex-wrap:wrap; margin-top:20px;">
            <div style="flex:1; min-width:300px; padding:20px; border:1px solid #e2e8f0; border-radius:16px;">
              <h3 style="font-size:1.5rem; font-weight:800; margin-bottom:10px;">1 Animator (280 Lei / oră)</h3>
              <p>Ideal pentru grupuri mici (10-12 copii). Include modelaj baloane, pictură pe față și jocuri de grup cu parașuta.</p>
            </div>
            <div style="flex:1; min-width:300px; padding:20px; border:2px solid #a855f7; border-radius:16px;">
              <h3 style="font-size:1.5rem; font-weight:800; margin-bottom:10px;">2 Animatori (490 Lei / oră)</h3>
              <p>Recomandat! Timp de așteptare redus la pictură și baloane, competiții pe echipe, distracție la dublu.</p>
            </div>
          </div>`
        }
      });
      sectionsCount++;

      // 4. E-E-A-T and CTA
      allSections.push({
        page_id: page.id,
        section_type: 'service_details',
        order_index: 40,
        heading: 'Siguranță și Experiență - Garanția Kassia',
        content: {
          body: `<div style="display:flex; gap:20px; flex-wrap:wrap; text-align:center;">
             <div style="flex:1; padding:15px; background:#f8fafc; border-radius:12px;"><strong>11+</strong><br>Ani de Experiență</div>
             <div style="flex:1; padding:15px; background:#f8fafc; border-radius:12px;"><strong>19.000+</strong><br>Petreceri Organizate</div>
             <div style="flex:1; padding:15px; background:#f8fafc; border-radius:12px;"><strong>60+</strong><br>Oameni în Echipă</div>
          </div>
          <div style="margin-top:30px; text-align:center;">
             <a href="https://wa.me/40763795919" class="btn-primary" style="background:#25D366; color:white; padding:16px 32px; border-radius:99px; text-decoration:none; font-weight:800;">Rezervă echipa Kassia</a>
          </div>`
        }
      });
      sectionsCount++;

      // 5. Gallery
      allSections.push({ page_id: page.id, section_type: 'gallery', order_index: 50, heading: `Galerie Foto`, content: {} });
      sectionsCount++;

      allGalleryItems.push(
        { page_id: page.id, url: '/images/animatori/animatori-copii-bucuresti-jocuri-interactive.webp', alt_text: `Copii la petrecere ${rawKw}`, order_index: 10 },
        { page_id: page.id, url: '/images/animatori/animatori-copii-bucuresti-pictura-pe-fata.webp', alt_text: `Face painting ${rawKw}`, order_index: 20 },
        { page_id: page.id, url: '/images/animatori/animatori-copii-bucuresti-modelaj-baloane.webp', alt_text: `Modelaj baloane ${rawKw}`, order_index: 30 }
      );
      imagesCount += 3;

      // 6. FAQs
      allFaqs.push(
        { page_id: page.id, question: `Veniți și la locația noastră pentru ${rawKw}?`, answer: `Da, ne deplasăm oriunde este nevoie: acasă, la restaurant, la curte sau la locul de joacă, având tot echipamentul pregătit.`, order_index: 10 },
        { page_id: page.id, question: `Cu cât timp înainte trebuie rezervat?`, answer: `Recomandăm să rezervați cu minim 2 săptămâni în avans, mai ales dacă petrecerea este în weekend, deoarece intervalele orare se ocupă rapid.`, order_index: 20 }
      );
      faqsCount += 2;

      // Add to report
      report.push({
        url: `https://www.kassia.ro${page.path}`,
        cluster: cluster,
        status: page.index_status,
        h1: TitleKwCapped,
        sections: sectionsCount,
        images: imagesCount,
        faqs: faqsCount
      });
    }

    if (allSections.length > 0) await supabase.from('kassia_page_sections').insert(allSections);
    if (allGalleryItems.length > 0) await supabase.from('kassia_gallery_items').insert(allGalleryItems);
    if (allFaqs.length > 0) await supabase.from('kassia_faqs').insert(allFaqs);
  }

  const reportPath = '/tmp/kassia_pseo_report.json';
  fs.writeFileSync(reportPath, JSON.stringify(report, null, 2));

  console.log(`Mass pSEO Generation completed. Processed ${report.length} pages.`);
  console.log(`Report saved to ${reportPath}`);
}

run();
