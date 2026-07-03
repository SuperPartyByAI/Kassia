const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  
  await page.setViewport({ width: 1280, height: 800 });

  const urls = [
    { url: 'https://www.kassia.ro/', name: 'homepage.png' },
    { url: 'https://www.kassia.ro/animatori-petreceri-copii-floreasca/', name: 'floreasca.png' },
    { url: 'https://www.kassia.ro/animatori-petreceri-copii-bucuresti/', name: 'bucuresti.png' }
  ];

  for (const item of urls) {
    console.log(`Navigating to ${item.url}...`);
    await page.goto(item.url, { waitUntil: 'networkidle2' });
    const path = `/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/${item.name}`;
    await page.screenshot({ path: path, fullPage: true });
    console.log(`Saved screenshot to ${path}`);
  }

  await browser.close();
})();
