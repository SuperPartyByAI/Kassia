const puppeteer = require('puppeteer');

(async () => {
  const url = 'https://www.kassia.ro/animatori-petreceri-copii-berceni/';
  const outDir = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227';
  
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  
  try {
    await page.setViewport({ width: 1280, height: 800 });
    await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    
    // Scroll down to ensure lazy loaded images load
    await page.evaluate(async () => {
        await new Promise((resolve) => {
            let totalHeight = 0;
            let distance = 100;
            let timer = setInterval(() => {
                let scrollHeight = document.body.scrollHeight;
                window.scrollBy(0, distance);
                totalHeight += distance;
                if(totalHeight >= scrollHeight - window.innerHeight){
                    clearInterval(timer);
                    resolve();
                }
            }, 100);
        });
    });
    
    await new Promise(r => setTimeout(r, 1000));
    await page.evaluate(() => window.scrollTo(0, 0));
    
    await page.screenshot({ path: `${outDir}/qa_berceni_visual_desktop.png`, fullPage: true });

    const data = await page.evaluate(async () => {
      // 1. Check New H2s
      const h2s = Array.from(document.querySelectorAll('main h2, main h3')).map(h => h.innerText.trim());
      const hasCards = h2s.some(h => h.includes('Berceni urban sau comuna Berceni') || h.includes('Cartierul Berceni / Sector 4'));
      const hasLogistics = h2s.some(h => h.includes('Ce detalii ne ajută înainte de eveniment'));
      
      // 2. Check FAQs
      const faqs = Array.from(document.querySelectorAll('details.faq-details'));
      const faqCount = faqs.length;
      const faqTexts = faqs.map(f => f.innerText);
      const hasNewFaq1 = faqTexts.some(t => t.includes('Care este diferența dintre Berceni cartier'));
      const hasNewFaq2 = faqTexts.some(t => t.includes('Acoperiți și zona Metalurgiei'));
      
      // 3. Image QA
      const images = Array.from(document.querySelectorAll('main img'));
      const imgData = [];
      
      for (const img of images) {
          const computed = window.getComputedStyle(img);
          const rect = img.getBoundingClientRect();
          const isVisible = rect.width > 0 && rect.height > 0 && computed.display !== 'none' && computed.visibility !== 'hidden' && parseFloat(computed.opacity) > 0;
          
          let httpStatus = 0;
          try {
            const res = await fetch(img.src, { method: 'HEAD' });
            httpStatus = res.status;
          } catch(e) { httpStatus = 'Error'; }

          imgData.push({
             src: img.src.split('/').pop(),
             alt: img.alt,
             httpStatus: httpStatus,
             naturalWidth: img.naturalWidth,
             naturalHeight: img.naturalHeight,
             renderedWidth: rect.width,
             renderedHeight: rect.height,
             display: computed.display,
             visibility: computed.visibility,
             opacity: computed.opacity,
             rectTop: rect.top,
             rectBottom: rect.bottom,
             visible: isVisible
          });
      }
      
      return { hasCards, hasLogistics, faqCount, hasNewFaq1, hasNewFaq2, imgData, h2s };
    });
    
    // Mobile Screenshot
    await page.setViewport({ width: 375, height: 812, isMobile: true, hasTouch: true });
    await page.evaluate(() => window.scrollTo(0, 0));
    await page.screenshot({ path: `${outDir}/qa_berceni_visual_mobile.png`, fullPage: true });
    
    console.log("=== HTML EXTRACT LIVE ===");
    console.log(`H2 Cards Found: ${data.hasCards ? 'YES' : 'NO'}`);
    console.log(`H2 Logistics Found: ${data.hasLogistics ? 'YES' : 'NO'}`);
    console.log(`FAQ Count: ${data.faqCount}`);
    console.log(`New FAQ 1 Visible: ${data.hasNewFaq1 ? 'YES' : 'NO'}`);
    console.log(`New FAQ 2 Visible: ${data.hasNewFaq2 ? 'YES' : 'NO'}`);
    
    console.log("\n=== IMAGES VISUAL QA ===");
    console.table(data.imgData.map(i => ({
        src: i.src.substring(0, 20) + '...',
        alt: i.alt.substring(0, 15) + '...',
        http: i.httpStatus,
        natSize: `${i.naturalWidth}x${i.naturalHeight}`,
        rendSize: `${Math.round(i.renderedWidth)}x${Math.round(i.renderedHeight)}`,
        disp_vis_op: `${i.display}/${i.visibility}/${i.opacity}`,
        isVisible: i.visible ? 'YES' : 'NO'
    })));
    
  } catch (err) {
    console.error(err);
  } finally {
    await browser.close();
  }
})();
