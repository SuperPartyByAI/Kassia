import puppeteer from 'puppeteer';
import fs from 'fs';

async function run() {
  console.log("Starting Puppeteer...");
  const browser = await puppeteer.launch({
    headless: "new",
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  
  const page = await browser.newPage();
  await page.setViewport({ width: 1280, height: 800 });
  await page.setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36');
  
  const queries = [
    "prețuri animatori copii București",
    "tarife animatori copii București",
    "pachete animatori petreceri copii București",
    "animatori petreceri copii prețuri"
  ];
  
  const evidence = {};
  
  for (const q of queries) {
    console.log(`Searching for: ${q}`);
    const url = `https://www.google.ro/search?q=${encodeURIComponent(q)}&hl=ro`;
    await page.goto(url, { waitUntil: 'domcontentloaded' });
    
    // Accept cookies if present
    try {
      const btn = await page.$('button#L2AGLb');
      if (btn) await btn.click();
    } catch(e) {}
    
    await new Promise(r => setTimeout(r, 2000));
    
    const results = await page.evaluate(() => {
      const items = Array.from(document.querySelectorAll('div.g'));
      const parsed = [];
      items.forEach(item => {
        const titleEl = item.querySelector('h3');
        const linkEl = item.querySelector('a');
        const snippetEl = item.querySelector('div.VwiC3b, div.IsZvec');
        
        if (titleEl && linkEl) {
          parsed.push({
            title: titleEl.innerText,
            url: linkEl.href,
            snippet: snippetEl ? snippetEl.innerText : 'N/A'
          });
        }
      });
      return parsed;
    });
    
    evidence[q] = results.filter(r => !r.url.includes('google.com'));
    
    // Save raw HTML for proof
    const html = await page.content();
    fs.writeFileSync(`serp_${q.replace(/ /g, '_')}.html`, html);
  }
  
  fs.writeFileSync('serp_evidence.json', JSON.stringify(evidence, null, 2));
  await browser.close();
  console.log("Done. Evidence saved to serp_evidence.json");
}
run();
