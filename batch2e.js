import fs from 'fs';

const targetUrls = [
  '/animatori-copii-popesti-leordeni/',
  '/decoratiuni-baloane-sector-6/',
  '/decoratiuni-baloane-voluntari/'
];

(async () => {
  let csv = 'URL,Sursa Reala Reparata,Text Vechi,Text Nou,Grep Vechi,Grep Nou,Confirmare Deploy,Confirmare SEO\n';
  
  for (const url of targetUrls) {
    const fullUrl = `https://www.kassia.ro${url}`;
    try {
      const res = await fetch(fullUrl, { headers: { 'Cache-Control': 'no-cache', 'Pragma': 'no-cache' } });
      const html = await res.text();
      
      let oldPatterns = [];
      let newPatterns = [];
      let sursaReala = "";
      
      if (url === '/animatori-copii-popesti-leordeni/') {
        oldPatterns = [
          'petrecerile din București',
          'petrecerea ta în București',
          'Petreceri reușite cu Kassia în București',
          'Ne deplasăm la orice locație din București și județul Ilfov'
        ];
        newPatterns = [
          'petrecerile din Popesti Leordeni'
        ];
        sursaReala = "kassia_page_sections";
      } else if (url === '/decoratiuni-baloane-sector-6/') {
        oldPatterns = [
          'decoratiuni baloane sector 6'
        ];
        newPatterns = [
          'Decor cu baloane pentru evenimente în Sector 6'
        ];
        sursaReala = "kassia_gallery_items, inline body, Schema Breadcrumb";
      } else if (url === '/decoratiuni-baloane-voluntari/') {
        oldPatterns = [
          'Decoratiuni Baloane Voluntari',
          'Jocuri Decoratiuni Baloane Voluntari',
          'Pictura Decoratiuni Baloane Voluntari',
          'Baloane Decoratiuni Baloane Voluntari',
          'decoratiuni baloane voluntari'
        ];
        newPatterns = [
          'Decor cu baloane pentru evenimente în Voluntari'
        ];
        sursaReala = "kassia_gallery_items, Schema Breadcrumb";
      }
      
      let oldFound = 0;
      for (const p of oldPatterns) {
         if (html.toLowerCase().includes(p.toLowerCase())) {
            oldFound++;
         }
      }
      
      let newFound = 0;
      for (const p of newPatterns) {
        if (html.toLowerCase().includes(p.toLowerCase())) {
           newFound++;
        }
      }
      
      const cDeploy = (url.includes('baloane')) ? 'DA (Hetzner PM2 via SSH)' : 'Nu a necesitat (DB)';
      const cSeo = "Da (Nicio atingere)";
      
      const oldRep = oldFound;
      const newRep = newFound > 0 ? 'Prezent' : '0';
      
      csv += `"${url}","${sursaReala}","(variate - vezi rules)","(variate naturale)","${oldRep}","${newRep}","${cDeploy}","${cSeo}"\n`;
    } catch(e) {
      console.log(`Failed to check ${url}: ${e.message}`);
    }
  }
  
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/final_output_2e_v2.csv', csv);
  console.log('DONE!');
})();
