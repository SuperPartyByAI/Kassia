const puppeteer = require('puppeteer');

(async () => {
  const url = 'https://www.kassia.ro/animatori-petreceri-copii-berceni/';
  const outDir = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227';
  
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  
  try {
    await page.setViewport({ width: 1280, height: 1000 });
    await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    
    const htmlData = await page.evaluate(() => {
        const h2s = Array.from(document.querySelectorAll('h2'));
        const targetH2 = h2s.find(el => el.textContent.includes('Berceni urban sau comuna Berceni'));
        if (!targetH2) return "Section not found";
        
        const parent = targetH2.parentElement.parentElement;
        return parent.innerHTML;
    });
    
    console.log("=== HTML EXTRACT ===");
    console.log(htmlData);
    
    const rect = await page.evaluate(() => {
        const h2s = Array.from(document.querySelectorAll('h2'));
        const targetH2 = h2s.find(el => el.textContent.includes('Berceni urban sau comuna Berceni'));
        if (!targetH2) return null;
        
        const parent = targetH2.parentElement.parentElement;
        const box = parent.getBoundingClientRect();
        return { x: box.x, y: box.y + window.scrollY, width: box.width, height: box.height };
    });
    
    if (rect) {
        await page.screenshot({
            path: `${outDir}/berceni_cta_cards_desktop.png`,
            clip: { x: rect.x, y: Math.max(0, rect.y - 50), width: rect.width, height: rect.height + 100 }
        });
        console.log("Saved desktop screenshot.");
    }

    await page.setViewport({ width: 390, height: 844 });
    const mobileRect = await page.evaluate(() => {
        const h2s = Array.from(document.querySelectorAll('h2'));
        const targetH2 = h2s.find(el => el.textContent.includes('Berceni urban sau comuna Berceni'));
        if (!targetH2) return null;
        
        const parent = targetH2.parentElement.parentElement;
        const box = parent.getBoundingClientRect();
        return { x: box.x, y: box.y + window.scrollY, width: box.width, height: box.height };
    });
    
    if (mobileRect) {
        await page.screenshot({
            path: `${outDir}/berceni_cta_cards_mobile.png`,
            clip: { x: mobileRect.x, y: Math.max(0, mobileRect.y - 50), width: mobileRect.width, height: mobileRect.height + 100 }
        });
        console.log("Saved mobile screenshot.");
    }

  } catch (err) {
    console.error(err);
  } finally {
    await browser.close();
  }
})();
