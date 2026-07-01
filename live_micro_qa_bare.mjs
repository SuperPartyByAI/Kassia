async function validate() {
  const url = 'https://www.kassia.ro/animatori-petreceri-copii/';
  const res = await fetch(url);
  const text = await res.text();
  
  const terms = {
      'face-painting': /face-painting/i.test(text),
      'experiență superioară': /experiență superioară/i.test(text),
      'Costurile pot varia': /Costurile pot varia/i.test(text),
      'Pentru detalii comerciale actualizate și opțiuni suplimentare': /Pentru detalii comerciale actualizate și opțiuni suplimentare/i.test(text),
      '1-3 ore': /1-3 ore/i.test(text),
      'Servicii conexe care completează atmosfera': /Servicii conexe care completează atmosfera/i.test(text),
      'De ce să alegi Kassia Events': /De ce să alegi Kassia Events/i.test(text),
      'Animatori pentru petreceri de copii în sectoarele Bucureștiului': /Animatori pentru petreceri de copii în sectoarele Bucureștiului/i.test(text),
      'Ghid pentru planificarea programului de animație': /Ghid pentru planificarea programului de animație/i.test(text)
  };

  console.log("LIVE BARE CANONICAL GREP VALIDATION:");
  for (const [term, present] of Object.entries(terms)) {
      console.log(`- "${term}": ${present ? 'PRESENT' : 'ABSENT'}`);
  }

  const has280 = /280 lei/i.test(text);
  const has490 = text.match(/490 lei/gi)?.length >= 2;
  const has830 = /830 lei/i.test(text);

  console.log(`\nPRICING PREVIEW: 280 lei (${has280}), 490 lei (${has490}), 830 lei (${has830})`);

  const protectedBlocks = {
      'Google badge prezent (google-trust-badge)': /google-trust-badge/i.test(text),
      'stele prezente (gtb-stars)': /gtb-stars/i.test(text),
      'reviews prezente (Ce spun clienții noștri)': /Ce spun clienții noștri/i.test(text)
  };

  console.log("\nPROTECTED BLOCKS:");
  for (const [block, present] of Object.entries(protectedBlocks)) {
      console.log(`- ${block}: ${present ? 'PRESENT' : 'ABSENT'}`);
  }
}

validate();
