const puppeteer = require('puppeteer');

(async () => {
  const url = 'https://www.kassia.ro/animatori-petreceri-copii-berceni/';
  
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  
  try {
    await page.setViewport({ width: 1280, height: 800 });
    const response = await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    
    // Extract metadata & content
    const data = await page.evaluate(() => {
      // Get pure text ONLY from editable sections (excluding header/footer/reviews/faq)
      const sections = Array.from(document.querySelectorAll('main section.content-section'));
      const textExtras = sections.map(s => {
          const h2 = s.querySelector('h2') ? s.querySelector('h2').innerText : '';
          const body = s.querySelector('.section-body') ? s.querySelector('.section-body').innerText : '';
          return `${h2} ${body}`;
      }).join(' ');
      
      const bodyTextLower = textExtras.toLowerCase();
      
      // FAQ
      const faqs = Array.from(document.querySelectorAll('details.faq-details'));
      const faqCount = faqs.length;
      const hasOldFaq = document.body.innerText.toLowerCase().includes('ce pachet recomandați pentru o petrecere de băieți?'); // example of old toxic faq
      
      // Schema
      const schemas = Array.from(document.querySelectorAll('script[type="application/ld+json"]'));
      const hasFaqSchema = schemas.some(s => s.innerText.includes('"@type":"FAQPage"'));
      
      return { bodyTextLower, faqCount, hasOldFaq, hasFaqSchema };
    });
    
    // Editorial Scan
    const forbidden = ["cost", "preț", "pret", "tarif", "taxă", "taxa", "gratuit", "premium", "perfect", "ideal", "garantat", "magie", "memorabil", "de neuitat", "profesioniști", "profesionisti", "pachete", "pictură pe față", "pictura pe fata", "face painting", "latex", "hipoalergenic", "antialergic", "asigur", "asigură", "asigura", "asigurat", "siguranță", "siguranta", "captivant", "captivante"];
    const found = forbidden.filter(word => {
        const regex = new RegExp(`\\b${word}\\b`, 'g');
        return regex.test(data.bodyTextLower);
    });
    
    console.log("\n=== E. Editorial scan ===");
    console.log(`Scan Violations: ${found.length > 0 ? found.join(', ') : 'NONE (0 violations)'}`);
    
    console.log("\n=== F. FAQ ===");
    console.log(`FAQ Count Live: ${data.faqCount}`);
    console.log(`FAQPage Schema Valid: ${data.hasFaqSchema ? 'Yes' : 'No'}`);
    console.log(`Old Toxic FAQ Found: ${data.hasOldFaq ? 'Yes' : 'No'}`);
    
  } catch (err) {
    console.error(err);
  } finally {
    await browser.close();
  }
})();
