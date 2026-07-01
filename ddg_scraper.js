import puppeteer from 'puppeteer';
import fs from 'fs';

async function run() {
  console.log("Starting Puppeteer to extract DuckDuckGo SERP organic results...");
  const browser = await puppeteer.launch({
    headless: false,
    args: ['--no-sandbox', '--disable-setuid-sandbox', '--window-size=1280,800']
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
    console.log(`Extracting DDG SERP for: ${q}`);
    try {
      await page.goto(`https://html.duckduckgo.com/html/?q=${encodeURIComponent(q)}`, { waitUntil: 'networkidle2', timeout: 30000 });
      
      const data = await page.evaluate(() => {
        const results = [];
        const items = document.querySelectorAll('a.result__url');
        let position = 1;
        
        items.forEach(item => {
           const url = item.href;
           if (url && !url.includes('duckduckgo.com')) {
               results.push({
                   position: position++,
                   url: url,
                   domain: new URL(url).hostname.replace('www.', '')
               });
           }
        });
        return results;
      });
      
      evidence[q] = data.slice(0, 10);
      
    } catch (e) {
      console.log(`Failed to extract SERP ${q}: ${e.message}`);
      evidence[q] = { error: e.message };
    }
  }
  
  fs.writeFileSync('ddg_organic_evidence.json', JSON.stringify(evidence, null, 2));
  await browser.close();
  console.log("Done extracting DDG SERP.");
}
run();
