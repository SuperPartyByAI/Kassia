import puppeteer from 'puppeteer';

(async () => {
  console.log("Launching Puppeteer...");
  const browser = await puppeteer.launch({ headless: true });
  
  try {
    const page = await browser.newPage();
    
    // 1. Homepage
    await page.setViewport({ width: 390, height: 800, isMobile: true, hasTouch: true });
    console.log("Navigating to Homepage...");
    await page.goto('http://127.0.0.1:3050/', { waitUntil: 'networkidle2' });
    console.log("Taking Homepage screenshot...");
    await page.screenshot({
      path: '/Users/universparty/.gemini/antigravity/brain/0ef2e4ed-9c7f-4113-a38e-7835fd2fb733/home_fullpage.png',
      fullPage: true
    });
    console.log("Homepage screenshot saved!");

    // 2. Sector 1 Page
    console.log("Navigating to Sector 1 Page...");
    await page.goto('http://127.0.0.1:3050/animatori-petreceri-copii-sector-1/', { waitUntil: 'networkidle2' });
    console.log("Taking Sector 1 screenshot...");
    await page.screenshot({
      path: '/Users/universparty/.gemini/antigravity/brain/0ef2e4ed-9c7f-4113-a38e-7835fd2fb733/sector1_fullpage.png',
      fullPage: true
    });
    console.log("Sector 1 screenshot saved!");

  } catch (err) {
    console.error("Error:", err);
  } finally {
    await browser.close();
    console.log("Done!");
  }
})();
