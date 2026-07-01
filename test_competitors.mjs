import puppeteer from 'puppeteer';

const urls = [
  "https://www.superparty.ro/animatori-copii-voluntari/",
  "https://allincludedevents.ro/animatori-copii/voluntari/",
  "https://funevents.ro/animatori-petreceri-copii-ilfov/"
];

(async () => {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  
  for (const url of urls) {
    console.log(`\n============================\n${url}\n============================`);
    const page = await browser.newPage();
    try {
      await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 10000 });
      const content = await page.evaluate(() => {
        return {
          h1: document.querySelector('h1')?.innerText || '',
          h2s: Array.from(document.querySelectorAll('h2')).map(h => h.innerText),
          bodyTextPrefix: document.body.innerText.substring(0, 500).replace(/\n/g, ' ')
        }
      });
      console.log(JSON.stringify(content, null, 2));
    } catch(e) {
      console.log("Error loading " + url + ": " + e.message);
    }
    await page.close();
  }
  
  await browser.close();
})();
