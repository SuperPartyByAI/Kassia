const puppeteer = require('puppeteer');
const fs = require('fs');

(async () => {
  const url = 'https://www.kassia.ro/animatori-petreceri-copii-berceni/';
  const outDir = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227';
  
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  
  try {
    // Desktop
    await page.setViewport({ width: 1280, height: 800 });
    const response = await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    await page.screenshot({ path: `${outDir}/qa_berceni_desktop.png`, fullPage: true });
    
    // Extract metadata & content
    const data = await page.evaluate(() => {
      const robots = document.querySelector('meta[name="robots"]') ? document.querySelector('meta[name="robots"]').content : 'N/A';
      
      // Get pure text ONLY from editable sections
      const sections = Array.from(document.querySelectorAll('main section.content-section'));
      const textExtras = sections.map(s => {
          const h2 = s.querySelector('h2') ? s.querySelector('h2').innerText : '';
          const body = s.querySelector('.section-body') ? s.querySelector('.section-body').innerText : '';
          return `[H2] ${h2}\n[Text] ${body}\n`;
      }).join('\n');
      
      const bodyTextLower = textExtras.toLowerCase();
      
      return { robots, textExtras, bodyTextLower };
    });
    
    // Mobile
    await page.setViewport({ width: 375, height: 812, isMobile: true, hasTouch: true });
    await page.reload({ waitUntil: 'networkidle2' });
    await page.screenshot({ path: `${outDir}/qa_berceni_mobile.png`, fullPage: true });
    
    // Editorial Scan
    const forbidden = ["cost", "preț", "pret", "tarif", "taxă", "taxa", "premium", "perfect", "ideal", "garantat", "magie", "memorabil", "de neuitat", "profesioniști", "profesionisti", "pachete", "pictură pe față", "pictura pe fata", "face painting", "latex", "hipoalergenic", "antialergic", "asigur", "asigură", "asigura", "asigurat", "siguranță", "siguranta", "gratuit"];
    const found = forbidden.filter(word => {
        const regex = new RegExp(`\\b${word}\\b`, 'g');
        return regex.test(data.bodyTextLower);
    });
    
    console.log("\n--- RAW QA EVIDENCE ---");
    console.log(`URL: ${url}`);
    console.log(`HTTP Status: ${response.status()}`);
    console.log(`Robots: ${data.robots}`);
    console.log(`Editorial Scan Violations: ${found.length > 0 ? found.join(', ') : 'NONE (Clean)'}`);
    
    console.log("\n--- EXTRAS LIVE COMPLET DIN MAIN CONTENT ---");
    console.log(data.textExtras);
    
  } catch (err) {
    console.error(err);
  } finally {
    await browser.close();
  }
})();
