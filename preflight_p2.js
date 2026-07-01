import fs from 'fs';
import puppeteer from 'puppeteer';

const urls = [
    "https://www.kassia.ro/animatori-petreceri-copii-sector-1/",
    "https://www.kassia.ro/animatori-petreceri-copii-sector-2/",
    "https://www.kassia.ro/animatori-petreceri-copii-sector-3/",
    "https://www.kassia.ro/animatori-petreceri-copii-sector-4/",
    "https://www.kassia.ro/animatori-petreceri-copii-sector-5/",
    "https://www.kassia.ro/animatori-petreceri-copii-sector-6/"
];

async function run() {
  const browser = await puppeteer.launch({
    headless: false,
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  
  const page = await browser.newPage();
  const results = {};
  
  for (const url of urls) {
     try {
       const response = await page.goto(url, { waitUntil: 'networkidle2', timeout: 15000 });
       const status = response.status();
       const data = await page.evaluate(() => {
          const canonical = document.querySelector('link[rel="canonical"]') ? document.querySelector('link[rel="canonical"]').href : 'None';
          const robots = document.querySelector('meta[name="robots"]') ? document.querySelector('meta[name="robots"]').content : 'None';
          return { canonical, robots };
       });
       results[url] = { status, canonical: data.canonical, robots: data.robots };
     } catch (e) {
       results[url] = { error: e.message };
     }
  }
  
  console.log(JSON.stringify(results, null, 2));
  await browser.close();
}
run();
