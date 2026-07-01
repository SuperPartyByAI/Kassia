const puppeteer = require('puppeteer');

(async () => {
  try {
    const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    
    const targetUrl = 'https://www.kassia.ro/animatori-petreceri-copii-popesti-leordeni/';
    
    console.log(`Navigating to ${targetUrl}...`);
    const response = await page.goto(targetUrl, { waitUntil: 'networkidle0', timeout: 60000 });
    console.log(`Status HTTP: ${response.status()}`);
    
    // Desktop
    await page.setViewport({ width: 1280, height: 800 });
    const desktopPath = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/popesti_live_desktop.png';
    await page.screenshot({ path: desktopPath, fullPage: true });
    console.log(`Saved desktop screenshot to ${desktopPath}`);

    // Mobile
    await page.setViewport({ width: 375, height: 667, isMobile: true });
    const mobilePath = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/popesti_live_mobile.png';
    await page.screenshot({ path: mobilePath, fullPage: true });
    console.log(`Saved mobile screenshot to ${mobilePath}`);

    await browser.close();
  } catch (err) {
    console.error('Failed to take screenshot:', err);
  }
})();
