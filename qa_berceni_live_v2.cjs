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
      const title = document.title;
      const metaDesc = document.querySelector('meta[name="description"]') ? document.querySelector('meta[name="description"]').content : 'N/A';
      const canonical = document.querySelector('link[rel="canonical"]') ? document.querySelector('link[rel="canonical"]').href : 'N/A';
      const robots = document.querySelector('meta[name="robots"]') ? document.querySelector('meta[name="robots"]').content : 'N/A';
      
      const hasFaqSchema = !!document.querySelector('script[type="application/ld+json"]') && document.querySelector('script[type="application/ld+json"]').innerText.includes('FAQPage');
      const faqCount = document.querySelectorAll('.faq, .accordion, details, [itemprop="mainEntity"]').length;
      
      // Select only main images (excluding testimonials, footer, header)
      const imgs = Array.from(document.querySelectorAll('main section:not(.aprecieri-clienti) img')).map(img => {
        return {
          src: img.src,
          alt: img.alt,
          section: img.closest('section') ? img.closest('section').className || img.closest('section').id : 'unknown'
        };
      });

      // Get pure text ONLY from editable sections
      const sections = Array.from(document.querySelectorAll('main section:not(.aprecieri-clienti):not(.footer):not(.header)'));
      const bodyText = sections.map(s => s.innerText).join(' ').toLowerCase();
      
      return { title, metaDesc, canonical, robots, hasFaqSchema, faqCount, imgs, bodyText };
    });
    
    // Mobile
    await page.setViewport({ width: 375, height: 812, isMobile: true, hasTouch: true });
    await page.reload({ waitUntil: 'networkidle2' });
    await page.screenshot({ path: `${outDir}/qa_berceni_mobile.png`, fullPage: true });
    
    // Editorial Scan
    const forbidden = ["cost", "preț", "pret", "tarif", "taxă", "taxa", "premium", "perfect", "ideal", "garantat", "magie", "memorabil", "de neuitat", "profesioniști", "profesionisti", "pachete", "pictură pe față", "pictura pe fata", "face painting", "latex", "hipoalergenic", "antialergic", "asigur", "asigură", "asigura", "asigurat", "siguranță", "siguranta"];
    const found = forbidden.filter(word => {
        // use regex to match whole words to avoid partial matches
        const regex = new RegExp(`\\b${word}\\b`, 'g');
        return regex.test(data.bodyText);
    });
    
    console.log("\n--- RAW QA EVIDENCE ---");
    console.log(`URL: ${url}`);
    console.log(`HTTP Status: ${response.status()}`);
    console.log(`Robots: ${data.robots}`);
    console.log(`Canonical: ${data.canonical}`);
    console.log(`Meta Title: ${data.title}`);
    console.log(`Meta Desc: ${data.metaDesc}`);
    console.log(`FAQ Count: ${data.faqCount} | Schema: ${data.hasFaqSchema}`);
    console.log(`Editorial Scan Violations: ${found.length > 0 ? found.join(', ') : 'NONE (Clean)'}`);
    
    console.log("\n--- TEXT EXTRAS (Editable Only) ---");
    console.log(data.bodyText.substring(0, 500) + "...");

    console.log("\n--- IMAGES ---");
    data.imgs.forEach((img, i) => {
        console.log(`[${i+1}] SRC: ${img.src} | ALT: ${img.alt} | Section: ${img.section}`);
    });
    
  } catch (err) {
    console.error(err);
  } finally {
    await browser.close();
  }
})();
