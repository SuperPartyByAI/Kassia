import * as cheerio from 'cheerio';

const NEW_URL = 'https://www.kassia.ro/animatori-petreceri-copii-bucuresti/';
const OLD_URL = 'https://www.kassia.ro/animatori-copii-bucuresti/';

async function verify() {
  console.log("=========================================");
  console.log("VERIFICARE LIVE PAGINA PILON BUCURESTI");
  console.log("=========================================");

  // 1. Verificare redirect 301
  try {
    console.log(`\n1. Verificare redirect: ${OLD_URL}`);
    const resOld = await fetch(OLD_URL, { redirect: 'manual' });
    console.log(`   HTTP Status: ${resOld.status}`);
    const loc = resOld.headers.get('location');
    console.log(`   Redirect Location: ${loc}`);
    if (resOld.status === 301 && loc && loc.endsWith('/animatori-petreceri-copii-bucuresti/')) {
      console.log("   ✅ REDIRECT 301 CORECT!");
    } else {
      console.log("   ❌ REDIRECT INCORECT SAU LIPSA!");
    }
  } catch (e) {
    console.error("   ❌ Eroare verificare redirect:", e.message);
  }

  // 2. Verificare status 200 pe pagina noua
  let html = '';
  try {
    console.log(`\n2. Verificare status pagina noua: ${NEW_URL}`);
    const resNew = await fetch(NEW_URL);
    console.log(`   HTTP Status: ${resNew.status}`);
    if (resNew.status === 200) {
      console.log("   ✅ STATUS 200 OK!");
      html = await resNew.text();
    } else {
      console.log("   ❌ STATUS INVALID!");
      return;
    }
  } catch (e) {
    console.error("   ❌ Eroare incarcare pagina:", e.message);
    return;
  }

  const $ = cheerio.load(html);

  // 3. Verificare metadate SEO
  console.log("\n3. Verificare SEO:");
  const canonical = $('link[rel="canonical"]').attr('href');
  console.log(`   Canonical URL: ${canonical}`);
  if (canonical === NEW_URL) {
    console.log("   ✅ CANONICAL CORECT!");
  } else {
    console.log("   ❌ CANONICAL INCORECT!");
  }

  const robots = $('meta[name="robots"]').attr('content');
  console.log(`   Robots Meta: ${robots}`);
  if (robots === 'index, follow') {
    console.log("   ✅ ROBOTS META CORECT!");
  } else {
    console.log("   ❌ ROBOTS META INCORECT (LIPSA SAU NOINDEX)!");
  }

  console.log(`   Meta Title: ${$('title').text()}`);
  console.log(`   Meta Description: ${$('meta[name="description"]').attr('content')}`);

  // 4. Verificare Headings
  console.log("\n4. Verificare ierarhie Headings:");
  const h1s = [];
  $('h1').each((_, el) => h1s.push($(el).text().trim()));
  console.log(`   H1 Count: ${h1s.length}`);
  h1s.forEach((h, i) => console.log(`     H1 [${i}]: "${h}"`));
  if (h1s.length === 1 && h1s[0] === 'Animatori pentru petreceri de copii în București și Ilfov') {
    console.log("   ✅ H1 CORECT!");
  } else {
    console.log("   ❌ H1 INVALID!");
  }

  const h2s = [];
  $('h2').each((_, el) => h2s.push($(el).text().trim()));
  console.log(`   H2 Count: ${h2s.length}`);
  h2s.forEach((h, i) => console.log(`     H2 [${i}]: "${h}"`));
  if (h2s.length === 9) {
    console.log("   ✅ EXACT 9 H2 HEADINGS IN DOM!");
  } else {
    console.log(`   ❌ NUMAR H2 NEASTEPTAT: ${h2s.length} (Trebuie sa fie exact 9)`);
  }

  // 5. Verificare FAQPage Schema JSON-LD
  console.log("\n5. Verificare JSON-LD FAQ Schema:");
  let hasFaqSchema = false;
  $('script[type="application/ld+json"]').each((_, el) => {
    try {
      const json = JSON.parse($(el).html());
      const graph = json['@graph'] || (Array.isArray(json) ? json : [json]);
      const faqNode = graph.find(item => item['@type'] === 'FAQPage');
      if (faqNode) {
        hasFaqSchema = true;
        console.log(`   ✅ Gasit FAQPage Schema cu ${faqNode.mainEntity.length} intrebari.`);
        faqNode.mainEntity.forEach((faq, i) => {
          console.log(`     FAQ [${i+1}]: "${faq.name}"`);
        });
      }
    } catch(e) {}
  });
  if (!hasFaqSchema) {
    console.log("   ❌ FAQPAGE SCHEMA NU A FOST GASIT IN DOM!");
  }

  // 6. Verificare elemente structura/design
  console.log("\n6. Verificare elemente UI/Design:");
  const hasMobileCTAClass = $('.kassia-premium-page.has-mobile-floating-cta').length > 0;
  console.log(`   Are clasa has-mobile-floating-cta: ${hasMobileCTAClass}`);
  const hasStickyNav = $('.animatori-sticky-nav').length > 0;
  console.log(`   Are Sticky sub-navigation: ${hasStickyNav}`);
  const hasReviews = $('.aprecieri-track').length > 0;
  console.log(`   Are Reviews track: ${hasReviews}`);
  const hasTrustStats = $('.aprecieri-clienti').length > 0;
  console.log(`   Are TrustStats: ${hasTrustStats}`);

  console.log("\n=========================================");
}

verify().catch(console.error);
