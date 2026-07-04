import * as cheerio from 'cheerio';
import fs from 'fs';

const targetUrls = [
  '/animatori-petreceri-copii-sector-1/',
  '/animatori-petreceri-copii-sector-6/',
  '/animatori-copii-otopeni/',
  '/animatori-copii-popesti-leordeni/',
  '/animatori-petreceri-copii-voluntari/',
  '/animatori-copii-pipera-bucuresti/',
  '/animatori-copii-chiajna/',
  '/animatori-copii-bragadiru/',
  '/animatori-copii-corbeanca/',
  '/decoratiuni-baloane-voluntari/',
  '/decoratiuni-baloane-sector-6/',
  '/animatori-petreceri-copii/'
];

(async () => {
  let csv = 'URL,HTTP_Status,Old_Found,New_Found,H1,Title,Meta,Canonical,Meta_Robots\n';
  
  for (const url of targetUrls) {
    const fullUrl = `https://www.kassia.ro${url}`;
    try {
      const res = await fetch(fullUrl, { headers: { 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' } });
      const html = await res.text();
      const $ = cheerio.load(html);
      
      const oldPatterns = [
        'Animatori Petreceri Copii animatori copii',
        'Cauți animatori pentru petreceri copii în animatori copii',
        'Jocuri Animatori Petreceri Copii animatori copii',
        'Cu cât timp înainte trebuie să rezerv echipa pentru Animatori Petreceri Copii animatori copii'
      ];
      
      let oldFound = 0;
      for (const p of oldPatterns) {
        if (html.includes(p)) oldFound++;
      }
      
      const newPatterns = [
        'Animatori pentru petreceri de copii în',
        'Jocuri interactive cu animatori pentru copii',
        'Cu cât timp înainte trebuie să rezerv animatorii',
        'Decorațiuni cu baloane în'
      ];
      
      let newFound = 0;
      for (const p of newPatterns) {
        if (html.includes(p)) newFound++;
      }
      
      const title = $('title').text().trim().replace(/"/g, '""');
      const h1 = $('h1').first().text().trim().replace(/"/g, '""');
      const meta = ($('meta[name="description"]').attr('content') || '').replace(/"/g, '""');
      const canonical = $('link[rel="canonical"]').attr('href') || '';
      const metaRobots = $('meta[name="robots"]').attr('content') || '';
      
      csv += `"${url}","${res.status}","${oldFound}","${newFound}","${h1}","${title}","${meta}","${canonical}","${metaRobots}"\n`;
      console.log(`Checked ${url}: Old=${oldFound}, New=${newFound}`);
    } catch(e) {
      console.log(`Failed to check ${url}: ${e.message}`);
    }
  }
  
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/raport_batch2.csv', csv);
  console.log('DONE!');
})();
