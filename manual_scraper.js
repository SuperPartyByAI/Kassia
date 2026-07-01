import puppeteer from 'puppeteer';
import fs from 'fs';

async function run() {
  console.log("Starting Puppeteer to extract Top 5 competitors...");
  const browser = await puppeteer.launch({
    headless: false, // Run in headful mode to avoid some bot detection
    args: ['--no-sandbox', '--disable-setuid-sandbox', '--window-size=1280,800']
  });
  
  const page = await browser.newPage();
  await page.setViewport({ width: 1280, height: 800 });
  await page.setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36');
  
  const competitors = [
    "https://anastasiaevents.ro/animatori-si-mascote/",
    "https://animatoriiveseli.ro/preturi/",
    "https://cool-events.ro/animatori-petreceri-copii/",
    "https://dizemanepe.ro/",
    "https://caravanapersonajelor.ro/tarife-si-oferte-promotionale.html"
  ];
  
  const evidence = {};
  
  for (const url of competitors) {
    console.log(`Extracting: ${url}`);
    try {
      await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
      
      const data = await page.evaluate(() => {
        const h1 = document.querySelector('h1') ? document.querySelector('h1').innerText.trim() : 'NOT VERIFIED';
        
        const h2s = Array.from(document.querySelectorAll('h2')).map(el => el.innerText.trim()).slice(0, 3).join(" | ");
        
        const text = document.body.innerText;
        const wordCount = text.split(/\s+/).length;
        
        // Very basic heuristics
        const hasPrices = text.includes('lei') || text.includes('RON') ? 'DA' : 'NOT VERIFIED';
        const hasTables = document.querySelector('table') ? 'DA' : 'NU';
        const hasTransport = text.toLowerCase().includes('transport') ? 'DA' : 'NOT VERIFIED';
        
        return { h1, h2: h2s || 'NOT VERIFIED', wordCount, hasPrices, hasTables, hasTransport };
      });
      
      evidence[url] = data;
      
    } catch (e) {
      console.log(`Failed to extract ${url}: ${e.message}`);
      evidence[url] = { error: e.message };
    }
  }
  
  fs.writeFileSync('competitor_evidence.json', JSON.stringify(evidence, null, 2));
  await browser.close();
  console.log("Done extracting competitors.");
}
run();
