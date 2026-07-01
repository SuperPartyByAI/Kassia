const puppeteer = require('puppeteer');
const fs = require('fs');

(async () => {
  const url = 'https://www.kassia.ro/animatori-copii-berceni/';
  const outDir = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227';
  
  const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  
  try {
    // Desktop
    await page.setViewport({ width: 1280, height: 800 });
    await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    await page.screenshot({ path: `${outDir}/audit_berceni_legacy_desktop.png`, fullPage: true });
    
    // Extract basic text
    const data = await page.evaluate(() => {
      const h1 = document.querySelector('h1') ? document.querySelector('h1').innerText.replace(/\n/g, ' ') : 'N/A';
      const text = document.body.innerText.replace(/\n/g, ' ').substring(0, 1000);
      return { h1, text };
    });
    console.log("Desktop Done.");
    console.log("H1:", data.h1);
    console.log("Text Snippet:", data.text);
    
    // Mobile
    await page.setViewport({ width: 375, height: 812, isMobile: true, hasTouch: true });
    await page.reload({ waitUntil: 'networkidle2' });
    await page.screenshot({ path: `${outDir}/audit_berceni_legacy_mobile.png`, fullPage: true });
    console.log("Mobile Done.");
  } catch (err) {
    console.error(err);
  } finally {
    await browser.close();
  }
})();
