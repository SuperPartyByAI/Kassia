import * as cheerio from 'cheerio';

const url = 'https://www.kassia.ro/animatori-petreceri-copii-sector-6/';

(async () => {
  console.log(`Checking ${url}...`);
  const res = await fetch(url);
  const html = await res.text();
  
  const oldTexts = [
    'Alege personajul preferat pentru',
    'De ce să ne alegi pentru',
    'Rezervă acum echipa perfectă pentru',
    'Galerie: Cum arată'
  ];
  
  const newTexts = [
    'Personaje preferate de copii pentru petrecerile din Sector 6',
    'De ce să inviți animatorii Kassia la petrecerea ta în Sector 6',
    'Rezervă acum echipa Kassia pentru petrecerea ta din Sector 6',
    'Galerie foto: Petreceri reușite cu Kassia în Sector 6'
  ];
  
  console.log('\n--- OLD TEXTS CHECK ---');
  oldTexts.forEach(t => {
    console.log(`"${t}": ${html.includes(t) ? 'FOUND ❌' : 'NOT FOUND ✅'}`);
  });
  
  console.log('\n--- NEW TEXTS CHECK ---');
  newTexts.forEach(t => {
    console.log(`"${t}": ${html.includes(t) ? 'FOUND ✅' : 'NOT FOUND ❌'}`);
  });
})();
