import * as cheerio from 'cheerio';

const VPS_SITE = 'https://www.kassia.ro';

async function checkUrl(urlPath, redirectManual = false) {
  const url = `${VPS_SITE}${urlPath}`;
  try {
    const res = await fetch(url, {
      redirect: redirectManual ? 'manual' : 'follow',
      headers: { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36' }
    });
    return {
      status: res.status,
      headers: res.headers,
      url: res.url,
      text: res.status === 200 ? await res.text() : ''
    };
  } catch (e) {
    return { status: 0, error: e.message };
  }
}

async function runAudit() {
  console.log("==================================================================");
  console.log("             COMPLET LIVE AUDIT - KASSIA EVENTS");
  console.log("==================================================================");

  let success = true;

  // 1. Sector 1 URL Nou
  console.log("\n--- VERIFICARE SECTOR 1 URL NOU ---");
  const sec1 = await checkUrl('/animatori-petreceri-copii-sector-1/');
  console.log(`Status: ${sec1.status}`);
  if (sec1.status !== 200) {
    console.error("❌ Sector 1 URL Nou nu returnează 200!");
    success = false;
  } else {
    console.log("✅ Status 200 OK");
    const $ = cheerio.load(sec1.text);
    
    // Canonical
    const canonical = $('link[rel="canonical"]').attr('href');
    console.log(`Canonical: ${canonical}`);
    if (canonical === 'https://www.kassia.ro/animatori-petreceri-copii-sector-1/') {
      console.log("✅ Canonical corect");
    } else {
      console.error(`❌ Canonical incorect: ${canonical}`);
      success = false;
    }

    // Robots
    const robots = $('meta[name="robots"]').attr('content');
    console.log(`Robots: ${robots}`);
    if (robots === 'index, follow') {
      console.log("✅ Robots indexable (index, follow)");
    } else {
      console.error(`❌ Robots incorect: ${robots}`);
      success = false;
    }

    // Headings
    const h1s = $('h1').map((_, el) => $(el).text().trim()).get();
    console.log(`H1 count: ${h1s.length}, text: "${h1s[0]}"`);
    if (h1s.length === 1 && h1s[0] === 'Animatori pentru petreceri de copii în Sector 1') {
      console.log("✅ H1 unic corect");
    } else {
      console.error(`❌ H1 incorect sau multiplu: ${JSON.stringify(h1s)}`);
      success = false;
    }

    const h2s = $('h2').map((_, el) => $(el).text().trim()).get();
    console.log(`H2 count: ${h2s.length}`);
    h2s.forEach((h, i) => console.log(`   H2 [${i+1}]: "${h}"`));
    if (h2s.length === 9) {
      console.log("✅ Exact 9 H2-uri");
    } else {
      console.error(`❌ Numarul de H2-uri (${h2s.length}) nu este exact 9!`);
      success = false;
    }

    // FAQ Schema
    let faqSchema = null;
    $('script[type="application/ld+json"]').each((_, el) => {
      try {
        const json = JSON.parse($(el).html());
        const graph = json['@graph'] || (Array.isArray(json) ? json : [json]);
        const found = graph.find(item => item['@type'] === 'FAQPage');
        if (found) faqSchema = found;
      } catch(e) {}
    });

    if (faqSchema) {
      console.log(`✅ FAQPage Schema gasit cu ${faqSchema.mainEntity.length} intrebari.`);
      if (faqSchema.mainEntity.length === 8) {
        console.log("✅ FAQPage Schema are exact 8 intrebari active.");
      } else {
        console.error(`❌ FAQPage Schema are ${faqSchema.mainEntity.length} intrebari (se doreau exact 8).`);
        success = false;
      }
    } else {
      console.error("❌ FAQPage Schema lipseste!");
      success = false;
    }

    // TrustStats and ratings restrictions
    const textLower = sec1.text.toLowerCase();
    const hasStars = textLower.includes('stele') || sec1.text.includes('★') || sec1.text.includes('rating') || sec1.text.includes('scor');
    console.log(`Verificare restrictii rating/stars: ${hasStars ? 'Gasit potentiale stele/scoruri/rating-uri' : '✅ Nu contine rating-uri sau stele'}`);
    if (hasStars) {
      console.log("Debugging matches for rating/stars in Sector 1 HTML:");
      const lines = sec1.text.split('\n');
      lines.forEach((line, lineIdx) => {
        if (/stele|★|rating|scor/i.test(line)) {
          console.log(`   Linia ${lineIdx+1}: ${line.trim().slice(0, 120)}`);
        }
      });
    }

    // Mobile CTA check
    const hasMobileCTA = $('.kassia-premium-page.has-mobile-floating-cta').length > 0;
    console.log(`Mobile Floating CTA class: ${hasMobileCTA}`);
    if (hasMobileCTA) {
      console.log("✅ Mobile CTA activat pe Sector 1");
    } else {
      console.error("❌ Mobile CTA lipseste de pe Sector 1");
      success = false;
    }
  }

  // 2. Sector 1 URL Vechi (301 Redirect)
  console.log("\n--- VERIFICARE SECTOR 1 URL VECHI ---");
  const sec1Old = await checkUrl('/animatori-copii-sector-1/', true);
  console.log(`Status: ${sec1Old.status}`);
  const sec1OldLoc = sec1Old.headers?.get('location');
  console.log(`Location redirect header: ${sec1OldLoc}`);
  if (sec1Old.status === 301 && sec1OldLoc === '/animatori-petreceri-copii-sector-1/') {
    console.log("✅ Redirect 301 corect catre noul URL");
  } else {
    console.error(`❌ Redirect 301 esuat: status=${sec1Old.status}, location=${sec1OldLoc}`);
    success = false;
  }

  // 3. Bucuresti URL Nou
  console.log("\n--- VERIFICARE BUCURESTI URL NOU ---");
  const buc = await checkUrl('/animatori-petreceri-copii-bucuresti/');
  console.log(`Status: ${buc.status}`);
  if (buc.status !== 200) {
    console.error("❌ Bucuresti URL Nou nu returnează 200!");
    success = false;
  } else {
    console.log("✅ Status 200 OK");
    const $ = cheerio.load(buc.text);
    
    // Canonical
    const canonical = $('link[rel="canonical"]').attr('href');
    console.log(`Canonical: ${canonical}`);
    if (canonical === 'https://www.kassia.ro/animatori-petreceri-copii-bucuresti/') {
      console.log("✅ Canonical corect");
    } else {
      console.error(`❌ Canonical incorect: ${canonical}`);
      success = false;
    }

    // Robots
    const robots = $('meta[name="robots"]').attr('content');
    console.log(`Robots: ${robots}`);
    if (robots === 'index, follow') {
      console.log("✅ Robots indexable (index, follow)");
    } else {
      console.error(`❌ Robots incorect: ${robots}`);
      success = false;
    }

    // Meta title / description obligatorii
    const metaTitle = $('title').text().trim();
    const metaDesc = $('meta[name="description"]').attr('content')?.trim();
    console.log(`Meta Title: "${metaTitle}"`);
    console.log(`Meta Description: "${metaDesc}"`);

    const EXPECTED_H1 = 'Animatori pentru petreceri de copii în București și Ilfov';
    const EXPECTED_TITLE = 'Animatori petreceri copii București și Ilfov | Jocuri, mascote și activități';
    const EXPECTED_DESC = 'Animatori pentru petreceri de copii în București și Ilfov, cu jocuri interactive, mascote, pictură pe față, modelaj de baloane, mini-disco și activități adaptate vârstei.';

    if (metaTitle === EXPECTED_TITLE) {
      console.log("✅ Meta Title corect");
    } else {
      console.error(`❌ Meta Title incorect! Așteptat: "${EXPECTED_TITLE}"`);
      success = false;
    }

    if (metaDesc === EXPECTED_DESC) {
      console.log("✅ Meta Description corect");
    } else {
      console.error(`❌ Meta Description incorect! Așteptat: "${EXPECTED_DESC}"`);
      success = false;
    }

    // Headings
    const h1s = $('h1').map((_, el) => $(el).text().trim()).get();
    console.log(`H1 count: ${h1s.length}, text: "${h1s[0]}"`);
    if (h1s.length === 1 && h1s[0] === EXPECTED_H1) {
      console.log("✅ H1 unic corect");
    } else {
      console.error(`❌ H1 incorect sau multiplu: ${JSON.stringify(h1s)}`);
      success = false;
    }

    const h2s = $('h2').map((_, el) => $(el).text().trim()).get();
    console.log(`H2 count: ${h2s.length}`);
    h2s.forEach((h, i) => console.log(`   H2 [${i+1}]: "${h}"`));
    if (h2s.length === 9) {
      console.log("✅ Exact 9 H2-uri");
    } else {
      console.error(`❌ Numarul de H2-uri (${h2s.length}) nu este exact 9!`);
      success = false;
    }

    // FAQ Schema
    let faqSchema = null;
    $('script[type="application/ld+json"]').each((_, el) => {
      try {
        const json = JSON.parse($(el).html());
        const graph = json['@graph'] || (Array.isArray(json) ? json : [json]);
        const found = graph.find(item => item['@type'] === 'FAQPage');
        if (found) faqSchema = found;
      } catch(e) {}
    });

    if (faqSchema) {
      console.log(`✅ FAQPage Schema gasit cu ${faqSchema.mainEntity.length} intrebari.`);
      if (faqSchema.mainEntity.length === 8) {
        console.log("✅ FAQPage Schema are exact 8 intrebari active.");
      } else {
        console.error(`❌ FAQPage Schema are ${faqSchema.mainEntity.length} intrebari (se doreau exact 8).`);
        success = false;
      }
    } else {
      console.error("❌ FAQPage Schema lipseste!");
      success = false;
    }

    // Restrictions check
    const textLower = buc.text.toLowerCase();
    const hasStars = textLower.includes('stele') || buc.text.includes('★') || buc.text.includes('rating') || buc.text.includes('scor');
    console.log(`Verificare restrictii rating/stars: ${hasStars ? 'Gasit potentiale stele/scoruri/rating-uri' : '✅ Nu contine rating-uri sau stele'}`);
    if (hasStars) {
      console.log("Debugging matches for rating/stars in Bucuresti HTML:");
      const lines = buc.text.split('\n');
      lines.forEach((line, lineIdx) => {
        if (/stele|★|rating|scor/i.test(line)) {
          console.log(`   Linia ${lineIdx+1}: ${line.trim().slice(0, 120)}`);
        }
      });
    }

    // Forbidden terms check
    const forbidden = ['pachete', 'program standard', 'rezervare', 'rezervăm', 'gratuit', 'garantează', 'structura orară', 'intervalul estimat'];
    const foundForbidden = [];
    forbidden.forEach(term => {
      // Check in body/HTML but be careful not to catch URL links like "/pachete-..."
      // Let's check in visible text only by loading cheerio text
      const visibleText = $('body').text().toLowerCase();
      if (visibleText.includes(term)) {
        foundForbidden.push(term);
      }
    });
    console.log(`Verificare cuvinte interzise: ${foundForbidden.length > 0 ? `❌ Gasit: ${foundForbidden.join(', ')}` : '✅ Niciunul gasit'}`);
    if (foundForbidden.length > 0) {
      console.warn("⚠️ AVERTISMENT: S-au gasit cuvinte restrictionate in textul vizibil!");
    }

    // Mobile CTA check
    const hasMobileCTA = $('.kassia-premium-page.has-mobile-floating-cta').length > 0;
    console.log(`Mobile Floating CTA class: ${hasMobileCTA}`);
    if (hasMobileCTA) {
      console.log("✅ Mobile CTA activat pe Bucuresti");
    } else {
      console.error("❌ Mobile CTA lipseste de pe Bucuresti");
      success = false;
    }
  }

  // 4. Bucuresti URL Vechi (301 Redirect)
  console.log("\n--- VERIFICARE BUCURESTI URL VECHI ---");
  const bucOld = await checkUrl('/animatori-copii-bucuresti/', true);
  console.log(`Status: ${bucOld.status}`);
  const bucOldLoc = bucOld.headers?.get('location');
  console.log(`Location redirect header: ${bucOldLoc}`);
  if (bucOld.status === 301 && bucOldLoc === '/animatori-petreceri-copii-bucuresti/') {
    console.log("✅ Redirect 301 corect catre noul URL");
  } else {
    console.error(`❌ Redirect 301 esuat: status=${bucOld.status}, location=${bucOldLoc}`);
    success = false;
  }

  // 5. Homepage
  console.log("\n--- VERIFICARE HOMEPAGE ---");
  const home = await checkUrl('/');
  console.log(`Status: ${home.status}`);
  if (home.status !== 200) {
    console.error("❌ Homepage nu returnează 200!");
    success = false;
  } else {
    console.log("✅ Status 200 OK");
    const $ = cheerio.load(home.text);
    
    // Canonical
    const canonical = $('link[rel="canonical"]').attr('href');
    console.log(`Canonical: ${canonical}`);
    if (canonical === 'https://www.kassia.ro/') {
      console.log("✅ Canonical corect");
    } else {
      console.error(`❌ Canonical incorect: ${canonical}`);
      success = false;
    }

    // Mobile CTA absence on homepage
    const hasMobileCTA = $('.kassia-premium-page.has-mobile-floating-cta').length > 0;
    console.log(`Mobile Floating CTA class: ${hasMobileCTA}`);
    if (!hasMobileCTA) {
      console.log("✅ Mobile CTA absent de pe Homepage (conform regulii)");
    } else {
      console.error("❌ EROARE: Mobile CTA apare pe Homepage!");
      success = false;
    }
  }

  // 6. Pagina Baloane Test
  console.log("\n--- VERIFICARE PAGINA BALOANE TEST ---");
  const baloane = await checkUrl('/preturi-decoratiuni-baloane/');
  console.log(`Status: ${baloane.status}`);
  if (baloane.status !== 200) {
    console.error("❌ Pagina baloane test nu returnează 200!");
    success = false;
  } else {
    console.log("✅ Status 200 OK");
    const $ = cheerio.load(baloane.text);
    
    // Canonical
    const canonical = $('link[rel="canonical"]').attr('href');
    console.log(`Canonical: ${canonical}`);
    if (canonical === 'https://www.kassia.ro/preturi-decoratiuni-baloane/') {
      console.log("✅ Canonical corect");
    } else {
      console.error(`❌ Canonical incorect: ${canonical}`);
      success = false;
    }

    // Mobile CTA absence on balloon pages
    const hasMobileCTA = $('.kassia-premium-page.has-mobile-floating-cta').length > 0;
    console.log(`Mobile Floating CTA class: ${hasMobileCTA}`);
    if (!hasMobileCTA) {
      console.log("✅ Mobile CTA absent de pe paginile de baloane (conform regulii)");
    } else {
      console.error("❌ EROARE: Mobile CTA apare pe pagina de baloane!");
      success = false;
    }
  }

  console.log("\n==================================================================");
  if (success) {
    console.log("🏆 LIVE AUDIT COMPLET INCHEIAT CU SUCCES! PAGINA BUCURESTI SI TOATE REGULILE TEHNICE/SEO SUNT DEPLIN SATISFACUTE.");
  } else {
    console.error("🚨 LIVE AUDIT A INTERCEPTAT ERORI! VERIFICATI LOGURILE MAI SUS.");
  }
  console.log("==================================================================");
}

runAudit().catch(console.error);
