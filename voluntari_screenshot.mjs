import puppeteer from 'puppeteer';

(async () => {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  
  // Desktop
  await page.setViewport({ width: 1440, height: 1080 });
  await page.goto('https://www.kassia.ro/animatori-petreceri-copii-voluntari/', { waitUntil: 'networkidle2' });
  await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/voluntari_desktop.png' });
  console.log("Desktop screenshot saved");

  // Mobile
  await page.setViewport({ width: 390, height: 844, isMobile: true, hasTouch: true });
  await page.goto('https://www.kassia.ro/animatori-petreceri-copii-voluntari/', { waitUntil: 'networkidle2' });
  await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/voluntari_mobile.png' });
  console.log("Mobile screenshot saved");

  await browser.close();
})();
