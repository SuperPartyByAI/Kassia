const puppeteer = require('puppeteer');
const fs = require('fs');

(async () => {
  try {
    const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    
    const targetUrl = 'http://localhost:4321/animatori-petreceri-copii-voluntari/';
    
    console.log(`Navigating to ${targetUrl}...`);
    await page.goto(targetUrl, { waitUntil: 'networkidle0', timeout: 60000 });
    
    // Hide any cookie banners if present
    await page.evaluate(() => {
      const cookieBanner = document.querySelector('.cookie-banner');
      if (cookieBanner) cookieBanner.style.display = 'none';
    });

    // Desktop
    await page.setViewport({ width: 1280, height: 800 });
    const desktopPath = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/voluntari_desktop.png';
    await page.screenshot({ path: desktopPath, fullPage: true });
    console.log(`Saved desktop screenshot to ${desktopPath}`);

    // Mobile
    await page.setViewport({ width: 375, height: 667, isMobile: true });
    const mobilePath = '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/voluntari_mobile.png';
    await page.screenshot({ path: mobilePath, fullPage: true });
    console.log(`Saved mobile screenshot to ${mobilePath}`);

    await browser.close();
  } catch (err) {
    console.error('Failed to take screenshot:', err);
  }
})();
