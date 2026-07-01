async function validate() {
  const url = 'https://www.kassia.ro/animatori-petreceri-copii/?bust=' + Date.now();
  const res = await fetch(url);
  const text = await res.text();
  
  const terms = {
      'face-painting': /face-painting/i.test(text),
      'experiență superioară': /experiență superioară/i.test(text),
      'Costurile pot varia': /Costurile pot varia/i.test(text),
      'Pentru detalii comerciale actualizate și opțiuni suplimentare': /Pentru detalii comerciale actualizate și opțiuni suplimentare/i.test(text),
      '1-3 ore': /1-3 ore/i.test(text),
      'Servicii conexe care completează': /Servicii conexe care completează/i.test(text),
      'De ce să alegi Kassia Events': /De ce să alegi Kassia Events/i.test(text),
      'Animatori pentru petreceri de copii în sectoarele Bucureștiului': /Animatori pentru petreceri de copii în sectoarele Bucureștiului/i.test(text)
  };

  console.log("LIVE MICRO-QA GREP VALIDATION:");
  for (const [term, present] of Object.entries(terms)) {
      console.log(`- "${term}": ${present ? 'PRESENT' : 'ABSENT'}`);
  }

  // Count pricing cards by looking for price values in the preview format (or just checking if 280, 490, 830 are there and missing 640)
  const has280 = /280 lei/i.test(text);
  const has490 = text.match(/490 lei/gi)?.length >= 2; // Should appear twice
  const has830 = /830 lei/i.test(text);
  const has640 = /640 lei/i.test(text); // 3 hours

  console.log(`\nPRICING PREVIEW: 280 lei (${has280}), 490 lei (${has490}), 830 lei (${has830}), 640 lei/3ore (${has640})`);

  // Check protected blocks
  const protectedBlocks = {
      'AggregateRating / Google Badge': /google-trust-badge/i.test(text) || /AggregateRating/i.test(text) || /gtb-stars/i.test(text),
      'Review text (e.g. "perfect")': /perfect/i.test(text),
      'Testimonials Section': /Ce spun clienții noștri/i.test(text)
  };

  console.log("\nPROTECTED BLOCKS:");
  for (const [block, present] of Object.entries(protectedBlocks)) {
      console.log(`- ${block}: ${present ? 'INTACT' : 'MISSING'}`);
  }
}

validate();
