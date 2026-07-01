const puppeteer = require('puppeteer');

(async () => {
  const url = 'https://www.kassia.ro/animatori-petreceri-copii-berceni/';
  const outDir = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227';
  
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  
  try {
    await page.setViewport({ width: 1280, height: 800 });
    await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    
    await page.screenshot({ path: `${outDir}/qa_berceni_micro_desktop.png`, fullPage: true });

    // Extract metadata & content
    const data = await page.evaluate(() => {
      const headHtml = document.head.innerHTML;
      const title = document.querySelector('title') ? document.querySelector('title').innerText : '';
      const metaDesc = document.querySelector('meta[name="description"]') ? document.querySelector('meta[name="description"]').content : '';
      const canonical = document.querySelector('link[rel="canonical"]') ? document.querySelector('link[rel="canonical"]').href : '';
      const robots = document.querySelector('meta[name="robots"]') ? document.querySelector('meta[name="robots"]').content : '';
      
      const sections = Array.from(document.querySelectorAll('main section.content-section'));
      const textExtras = sections.map(s => {
          const h2 = s.querySelector('h2') ? s.querySelector('h2').innerText : '';
          const body = s.querySelector('.section-body') ? s.querySelector('.section-body').innerText : '';
          return `${h2} ${body}`;
      }).join(' ');
      
      const bodyTextLower = textExtras.toLowerCase();
      
      const faqs = Array.from(document.querySelectorAll('details.faq-details'));
      const faqCount = faqs.length;
      
      const schemas = Array.from(document.querySelectorAll('script[type="application/ld+json"]'));
      const hasFaqSchema = schemas.some(s => s.innerText.includes('"@type":"FAQPage"'));
      
      return { title, metaDesc, canonical, robots, bodyTextLower, faqCount, hasFaqSchema };
    });
    
    // Mobile
    await page.setViewport({ width: 375, height: 812, isMobile: true, hasTouch: true });
    await page.reload({ waitUntil: 'networkidle2' });
    await page.screenshot({ path: `${outDir}/qa_berceni_micro_mobile.png`, fullPage: true });
    
    // Editorial Scan
    const forbidden = ["cost", "preț", "pret", "tarif", "taxă", "taxa", "gratuit", "premium", "perfect", "ideal", "garantat", "magie", "memorabil", "de neuitat", "profesioniști", "profesionisti", "pachete", "pictură pe față", "pictura pe fata", "face painting", "latex", "hipoalergenic", "antialergic", "asigur", "asigură", "asigura", "asigurat", "siguranță", "siguranta", "captivant", "captivante"];
    const found = forbidden.filter(word => {
        const regex = new RegExp(`\\b${word}\\b`, 'g');
        return regex.test(data.bodyTextLower);
    });
    
    console.log("=== HEAD METADATA ===");
    console.log(`Title: ${data.title}`);
    console.log(`Meta Description: ${data.metaDesc}`);
    console.log(`Canonical: ${data.canonical}`);
    console.log(`Robots: ${data.robots || 'NOT FOUND (defaults to index, follow)'}`);
    
    console.log("\n=== EDITORIAL SCAN ===");
    console.log(`Scan Violations: ${found.length > 0 ? found.join(', ') : 'NONE (0 violations)'}`);
    
    console.log("\n=== FAQ ===");
    console.log(`FAQ Count Live: ${data.faqCount}`);
    console.log(`FAQPage Schema Valid: ${data.hasFaqSchema ? 'Yes' : 'No'}`);
    
  } catch (err) {
    console.error(err);
  } finally {
    await browser.close();
  }
})();
