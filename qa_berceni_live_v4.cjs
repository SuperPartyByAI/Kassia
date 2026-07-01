const puppeteer = require('puppeteer');

(async () => {
  const url = 'https://www.kassia.ro/animatori-petreceri-copii-berceni/';
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  
  try {
    await page.setViewport({ width: 1280, height: 800 });
    await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    
    const textExtras = await page.evaluate(() => {
      const sections = Array.from(document.querySelectorAll('main section.content-section'));
      return sections.map(s => {
          const body = s.querySelector('.section-body') ? s.querySelector('.section-body').innerText : '';
          return body;
      }).join('\n\n');
    });
    
    // Only print the relevant paragraphs to prove the fix
    const lines = textExtras.split('\n');
    let proof = [];
    lines.forEach(line => {
        if (line.includes('organizăm evenimente și pentru familiile') || 
            line.includes('jocuri de mișcare și întreceri adaptate') || 
            line.includes('ștafete și, unde se potrivește, animatori pe picioroange')) {
            proof.push(line);
        }
    });

    console.log("\n--- EXTRAS LIVE ACTUALIZAT PENTRU CELE 2 PARAGRAFE MODIFICATE ---");
    console.log(proof.join('\n\n'));
    
  } catch (err) {
    console.error(err);
  } finally {
    await browser.close();
  }
})();
