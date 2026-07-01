import { chromium, devices } from 'playwright';

(async () => {
  const url = 'https://www.kassia.ro/animatori-petreceri-copii/?bust=' + Date.now();
  const browser = await chromium.launch();
  
  // Desktop
  const desktopContext = await browser.newContext();
  const desktopPage = await desktopContext.newPage();
  await desktopPage.goto(url, { waitUntil: 'networkidle' });
  await desktopPage.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/hub_desktop_above_fold.png' });
  
  // Desktop Full
  await desktopPage.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/hub_desktop_full.png', fullPage: true });

  // Mobile
  const mobileContext = await browser.newContext({ ...devices['iPhone 12'] });
  const mobilePage = await mobileContext.newPage();
  await mobilePage.goto(url, { waitUntil: 'networkidle' });
  await mobilePage.screenshot({ path: '/Users/universparty/.gemini/antigravity/brain/6d86611f-e938-48db-98c9-3bb7d0b0f227/hub_mobile_full.png', fullPage: true });

  await browser.close();
  console.log("Screenshots captured!");
})();
