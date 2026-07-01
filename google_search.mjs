import puppeteer from 'puppeteer';

const queries = [
  "animatori copii Voluntari",
  "animatori petreceri copii Voluntari",
  "animatori copii Pipera",
  "animatori copii Iancu Nicolae"
];

(async () => {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  
  for (const query of queries) {
    console.log(`\n--- QUERY: ${query} ---`);
    await page.goto(`https://www.google.ro/search?q=${encodeURIComponent(query)}&gl=ro&hl=ro`, { waitUntil: 'networkidle2' });
    
    // Accept cookies if prompt appears
    try {
      const button = await page.$('button#L2AGLb');
      if (button) await button.click();
    } catch(e) {}

    const results = await page.evaluate(() => {
      const links = Array.from(document.querySelectorAll('div.g a'));
      let urls = [];
      links.forEach(l => {
        const url = l.href;
        if (url && url.startsWith('http') && !url.includes('google.com') && !urls.includes(url)) {
          // ignore cache or translate links
          if (!url.includes('webcache') && !url.includes('translate')) {
             urls.push(url);
          }
        }
      });
      return urls.slice(0, 10);
    });

    results.forEach((r, i) => console.log(`[${i+1}] ${r}`));
    await new Promise(r => setTimeout(r, 2000)); // sleep between queries
  }
  
  await browser.close();
})();
