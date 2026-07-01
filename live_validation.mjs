import fs from 'fs';

async function validate() {
  const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
  const res = await fetch(url);
  const status = res.status;
  const text = await res.text();
  
  const terms = {
      'Programe cu animatori potrivite': /Programe cu animatori potrivite/i.test(text),
      '280 lei': /280 lei/i.test(text),
      '490 lei': /490 lei/i.test(text),
      '830 lei': /830 lei/i.test(text),
      'Scenarii frecvente': /Scenarii frecvente/i.test(text),
      'Ce evităm': /Ce evităm/i.test(text),
      'Cum decurge programul': /Cum decurge programul/i.test(text),
      'Un personaj animator sau două personaje animatoare': /Un personaj animator sau două/i.test(text),
      'Zone acoperite': /Zone acoperite/i.test(text),
      '1-3 ore': /1-3 ore/i.test(text)
  };

  const toxicTerms = ['asigură', 'asigura', 'asigurăm', 'asigurat', 'premium', 'perfect', 'magie', 'garantat', 'pachete'];
  const foundToxic = toxicTerms.filter(t => new RegExp(`\\b${t}`, 'i').test(text));

  const protectedBlocks = {
      'AggregateRating': /AggregateRating/i.test(text),
      'Review Schema': /"Review"/i.test(text) || /ratingValue/i.test(text)
  };

  const canonicalMatch = text.match(/<link\s+rel="canonical"\s+href="([^"]+)"/i);
  const robotsMatch = text.match(/<meta\s+name="robots"\s+content="([^"]+)"/i);
  const h1Match = text.match(/<h1[^>]*>([\s\S]*?)<\/h1>/i);
  const h1 = h1Match ? h1Match[1].replace(/<[^>]+>/g, '').trim().replace(/\s+/g, ' ') : 'NOT FOUND';

  console.log(`URL live: ${url}`);
  console.log(`HTTP: ${status}`);
  console.log(`Canonical: ${canonicalMatch ? canonicalMatch[1] : 'MISSING'}`);
  console.log(`Robots: ${robotsMatch ? robotsMatch[1] : 'MISSING'}`);
  console.log(`H1 unchanged: ${h1 === 'Animatori pentru petreceri de copii în București și Ilfov'}`);
  
  console.log("\nTERMS VERIFICATION:");
  for (const [term, present] of Object.entries(terms)) {
      console.log(`- ${term}: ${present ? 'PRESENT' : 'ABSENT'}`);
  }
  
  console.log(`\nTOXIC TERMS FOUND: ${foundToxic.length > 0 ? foundToxic.join(', ') : 'NONE'}`);
  
  console.log("\nPROTECTED BLOCKS:");
  for (const [block, present] of Object.entries(protectedBlocks)) {
      console.log(`- ${block}: ${present ? 'PRESENT' : 'ABSENT'}`);
  }
}

validate();
