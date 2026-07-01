import puppeteer from 'puppeteer';

(async () => {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  
  // Desktop
  await page.setViewport({ width: 1440, height: 2500 });
  await page.goto('https://www.kassia.ro/animatori-petreceri-copii-voluntari/', { waitUntil: 'networkidle0' });
  await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/voluntari_desktop_cards_order.png', fullPage: true });
  console.log("Desktop full page screenshot saved");

  // Mobile
  await page.setViewport({ width: 390, height: 844, isMobile: true, hasTouch: true });
  await page.goto('https://www.kassia.ro/animatori-petreceri-copii-voluntari/', { waitUntil: 'networkidle0' });
  await page.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/voluntari_mobile_cards_order.png', fullPage: true });
  console.log("Mobile full page screenshot saved");

  // Crop the 3 cards
  const element = await page.$('.feature-cards-section');
  if (element) {
    await element.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/voluntari_cards_crop.png' });
    console.log("Feature cards crop saved");
  }

  await browser.close();
})();
