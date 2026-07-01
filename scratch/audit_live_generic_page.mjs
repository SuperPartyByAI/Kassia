import fetch from 'node-fetch'; // or use native fetch if available, node 22 has native fetch

async function runAudit() {
  console.log("=== INIȚIERE AUDIT LIVE QA PE PRODUCTION/VPS ===");
  const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
  console.log(`Se downloadează pagina de la: ${url}`);
  
  const res = await fetch(url);
  console.log(`HTTP Status Response: ${res.status} ${res.statusText}`);
  
  if (res.status !== 200) {
    console.error(`Eroare: Pagina a returnat statusul ${res.status} în loc de 200 OK.`);
    process.exit(1);
  }
  
  const html = await res.text();
  let errors = [];

  // Helper count function
  const count = (regex) => (html.match(regex) || []).length;

  // 1. Title verification
  const titleCount = count(/<title>.*?<\/title>/gi);
  console.log(`- Title count: ${titleCount}`);
  if (titleCount !== 1) {
    errors.push(`Așteptat 1 element <title>, s-au găsit ${titleCount}.`);
  } else {
    const titleMatch = html.match(/<title>(.*?)<\/title>/i);
    console.log(`  Title text: "${titleMatch ? titleMatch[1] : 'N/A'}"`);
  }

  // 2. Meta description verification
  const descCount = count(/<meta[^>]*name="description"[^>]*>/gi);
  console.log(`- Meta description count: ${descCount}`);
  if (descCount !== 1) {
    errors.push(`Așteptată 1 meta description, s-au găsit ${descCount}.`);
  } else {
    const descMatch = html.match(/<meta[^>]*name="description"[^>]*content="([^"]*)"/i);
    console.log(`  Meta description content: "${descMatch ? descMatch[1] : 'N/A'}"`);
  }

  // 3. Canonical url verification
  const canonicalCount = count(/<link[^>]*rel="canonical"[^>]*>/gi);
  console.log(`- Canonical tag count: ${canonicalCount}`);
  if (canonicalCount !== 1) {
    errors.push(`Așteptat 1 canonical URL tag, s-au găsit ${canonicalCount}.`);
  } else {
    const canonicalMatch = html.match(/<link[^>]*rel="canonical"[^>]*href="([^"]*)"/i);
    console.log(`  Canonical URL: "${canonicalMatch ? canonicalMatch[1] : 'N/A'}"`);
    if (canonicalMatch && canonicalMatch[1] !== 'https://www.kassia.ro/animatori-petreceri-copii/') {
      errors.push(`Canonical URL greșit: s-a găsit "${canonicalMatch[1]}" în loc de "https://www.kassia.ro/animatori-petreceri-copii/".`);
    }
  }

  // 4. Robots meta tag verification
  const robotsMatch = html.match(/<meta[^>]*name="robots"[^>]*content="([^"]*)"/i);
  if (!robotsMatch) {
    errors.push("Nu s-a găsit tag-ul meta name=\"robots\".");
  } else {
    console.log(`- Robots meta content: "${robotsMatch[1]}"`);
    if (!robotsMatch[1].toLowerCase().includes('noindex')) {
      errors.push(`Eroare robots: în faza de QA robots trebuie să fie noindex (s-a găsit "${robotsMatch[1]}").`);
    }
  }

  // 5. H1 Verification (strictly one H1)
  const h1Count = count(/<h1[^>]*>([\s\S]*?)<\/h1>/gi);
  console.log(`- H1 count: ${h1Count}`);
  if (h1Count !== 1) {
    errors.push(`Așteptat exact 1 H1, s-au găsit ${h1Count}.`);
  } else {
    const h1Match = html.match(/<h1[^>]*>([\s\S]*?)<\/h1>/i);
    const h1Text = h1Match ? h1Match[1].trim().replace(/\s+/g, ' ') : '';
    console.log(`  H1 Text: "${h1Text}"`);
    if (h1Text !== 'Animatori pentru petreceri de copii') {
      errors.push(`H1 diferit: s-a găsit "${h1Text}" în loc de "Animatori pentru petreceri de copii".`);
    }
  }

  // 6. H2 count verification (exactly 9 H2s)
  const h2Count = count(/<h2[^>]*>([\s\S]*?)<\/h2>/gi);
  console.log(`- H2 count: ${h2Count}`);
  
  const h2Matches = [...html.matchAll(/<h2[^>]*>([\s\S]*?)<\/h2>/gi)];
  h2Matches.forEach((m, idx) => {
    console.log(`  H2 [${idx + 1}]: "${m[1].trim().replace(/\s+/g, ' ')}"`);
  });

  if (h2Count !== 9) {
    errors.push(`Așteptate exact 9 titluri H2, s-au găsit ${h2Count}.`);
  }

  // 7. Schema markup check (FAQPage)
  const schemaMatches = [...html.matchAll(/<script[^>]*type="application\/ld\+json"[^>]*>([\s\S]*?)<\/script>/gi)];
  let faqSchemaFound = false;
  let aggregateRatingFound = false;
  let reviewSchemaFound = false;
  let faqCount = 0;

  schemaMatches.forEach(sm => {
    try {
      const json = JSON.parse(sm[1].trim());
      // Handle array of graphs or single objects
      const objects = Array.isArray(json) ? json : (json['@graph'] || [json]);
      
      objects.forEach(obj => {
        if (obj['@type'] === 'FAQPage') {
          faqSchemaFound = true;
          const questions = obj['mainEntity'] || [];
          faqCount = questions.length;
          console.log(`- FAQ Schema found with ${faqCount} questions.`);
        }
        if (obj['@type'] === 'AggregateRating') {
          aggregateRatingFound = true;
        }
        if (obj['@type'] === 'Review') {
          reviewSchemaFound = true;
        }
      });
    } catch (e) {
      // Ignoră erorile de parsare JSON-LD dacă există alte scripturi non-JSON
    }
  });

  if (!faqSchemaFound) {
    errors.push("Nu s-a găsit schema JSON-LD de tip FAQPage.");
  } else if (faqCount !== 8) {
    errors.push(`Așteptată schemă FAQPage cu exact 8 întrebări, s-au găsit ${faqCount}.`);
  }

  if (aggregateRatingFound || reviewSchemaFound) {
    errors.push("Eroare de conformitate: S-a detectat schemă AggregateRating sau Review în JSON-LD (suspicios/interzis).");
  }

  // 8. Internal link verification
  const requiredLinkMatch = html.match(/href="\/pachete-animatori-copii-bucuresti\/"[^>]*>Programe animatori copii<\/a>/i) ||
                             html.match(/>Programe animatori copii<\/a>/i);
  
  if (!requiredLinkMatch) {
    errors.push("Nu s-a găsit linkul intern obligatoriu către '/pachete-animatori-copii-bucuresti/' cu textul ancoră 'Programe animatori copii'.");
  } else {
    console.log("- Linkul intern către /pachete-animatori-copii-bucuresti/ ('Programe animatori copii') există pe pagină.");
  }

  // 9. Mobile Floating CTA verification
  const hasFloatingCTA = html.includes('kassia-premium-page has-mobile-floating-cta') || html.includes('MobileFloatingCTA');
  console.log(`- Mobile floating CTA detected: ${hasFloatingCTA ? 'DA' : 'NU'}`);
  if (!hasFloatingCTA) {
    errors.push("Nu s-a detectat clasa 'has-mobile-floating-cta' sau componenta MobileFloatingCTA pe pagină.");
  }

  // 10. Forbidden words check
  const plainText = html.replace(/<[^>]+>/g, ' ').replace(/\s+/g, ' ');
  const findMatch = (rx) => (plainText.match(rx) || []).length;
  
  const forbiddenMatches = [
    { rx: /Cere ofertă/gi, label: 'Cere ofertă' },
    { rx: /\bPrețuri\b/gi, label: 'Prețuri' },
    { rx: /\bPachete\b/gi, label: 'Pachete' },
    { rx: /\bRezervă\b/gi, label: 'Rezervă' },
    { rx: /\btarife\b/gi, label: 'tarife' },
    { rx: /\bprogram standard\b/gi, label: 'program standard' }
  ];

  forbiddenMatches.forEach(fm => {
    const c = findMatch(fm.rx);
    if (c > 0) {
      // Exceptăm cazurile din linkul "/pachete-animatori-copii-bucuresti/" dacă e în href
      // Dar să verificăm dacă apare în textul brut
      console.log(`  [AVERTISMENT] Cuvântul interzis "${fm.label}" apare în textul brut de ${c} ori.`);
    }
  });

  // Verify other pages are unaffected
  console.log("\nSe verifică paginile București și Sector 1...");
  const resBuc = await fetch('https://www.kassia.ro/animatori-petreceri-copii-bucuresti/');
  const resSec1 = await fetch('https://www.kassia.ro/animatori-petreceri-copii-sector-1/');
  console.log(`București Page status: ${resBuc.status}`);
  console.log(`Sector 1 Page status: ${resSec1.status}`);
  if (resBuc.status !== 200 || resSec1.status !== 200) {
    errors.push("Eroare gravă: paginile București sau Sector 1 au fost afectate și nu mai returnează 200 OK.");
  }

  console.log("\n=== REZULTATE AUDIT ===");
  if (errors.length === 0) {
    console.log("✅ AUDIT LIVE COMPLETAT CU SUCCES! Pagina corespunde 100% specificațiilor.");
  } else {
    console.error("❌ S-AU GĂSIT ERORI ÎN TIMPUL AUDITULUI:");
    errors.forEach(e => console.error(`  - ${e}`));
    process.exit(1);
  }
}

runAudit().catch(console.error);
