import * as cheerio from 'cheerio';
import fs from 'fs';

const targetUrls = [
  '/animatori-copii-popesti-leordeni/',
  '/decoratiuni-baloane-sector-6/',
  '/decoratiuni-baloane-voluntari/'
];

(async () => {
  let csv = 'URL,GrepVechi\n';
  
  for (const url of targetUrls) {
    const fullUrl = `https://www.kassia.ro${url}`;
    try {
      const res = await fetch(fullUrl, { headers: { 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' } });
      const html = await res.text();
      
      const oldPatterns = [
        'petrecerile din București',
        'petrecerea ta în București',
        'Petreceri reușite cu Kassia în București',
        'Ne deplasăm la orice locație din București și județul Ilfov',
        'decoratiuni baloane sector 6',
        'decoratiuni baloane voluntari'
      ];
      
      let oldFound = 0;
      for (const p of oldPatterns) {
        if (html.includes(p)) {
           oldFound++;
           console.log(`[WARN] Old pattern found on ${url}: "${p}"`);
        }
      }
      csv += `"${url}","${oldFound}"\n`;
      console.log(`Checked ${url}: GrepVechi=${oldFound}`);
    } catch(e) {
      console.log(`Failed to check ${url}: ${e.message}`);
    }
  }
  
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/raport_batch2d.csv', csv);
  console.log('DONE!');
})();
