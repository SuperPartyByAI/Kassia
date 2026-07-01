import puppeteer from 'puppeteer';
import fs from 'fs';

async function run() {
  console.log("Starting Puppeteer to extract SERP organic results...");
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
  
  // Go to google first to accept cookies
  await page.goto('https://www.google.ro/', { waitUntil: 'networkidle2' });
  try {
    const btn = await page.$('button#L2AGLb');
    if (btn) await btn.click();
    await new Promise(r => setTimeout(r, 1000));
  } catch(e) {}
  
  for (const q of queries) {
    console.log(`Extracting SERP for: ${q}`);
    try {
      await page.goto(`https://www.google.ro/search?q=${encodeURIComponent(q)}`, { waitUntil: 'networkidle2', timeout: 30000 });
      
      const data = await page.evaluate(() => {
        const results = [];
        // Google organic results usually inside div.g
        const items = document.querySelectorAll('div.g');
        let position = 1;
        
        items.forEach(item => {
           // Basic filter to ignore people also ask / local pack
           if (item.closest('.Wt5Tfe') || item.closest('.O9g5cc')) return; 
           
           const titleEl = item.querySelector('h3');
           const linkEl = item.querySelector('a');
           
           if (titleEl && linkEl && linkEl.href && !linkEl.href.includes('google.com')) {
               results.push({
                   position: position++,
                   title: titleEl.innerText,
                   url: linkEl.href,
                   domain: new URL(linkEl.href).hostname.replace('www.', '')
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
  
  fs.writeFileSync('serp_organic_evidence.json', JSON.stringify(evidence, null, 2));
  await browser.close();
  console.log("Done extracting SERP.");
}
run();
