import puppeteer from 'puppeteer';

async function run() {
  const browser = await puppeteer.launch({ headless: "new", args: ['--no-sandbox', '--disable-setuid-sandbox'] });
  const page = await browser.newPage();
  await page.setExtraHTTPHeaders({
    'Accept-Language': 'ro-RO,ro;q=0.9,en-US;q=0.8,en;q=0.7'
  });
  await page.goto('https://www.google.ro/search?q=preturi+animatori+copii+Bucuresti&hl=ro', { waitUntil: 'networkidle2' });
  
  // try to click accept cookies
  try {
    const btn = await page.$('button[id="L2AGLb"]');
    if(btn) {
      await btn.click();
      await page.waitForNavigation({ waitUntil: 'networkidle2' });
    }
  } catch(e) {}

  const results = await page.evaluate(() => {
    let items = Array.from(document.querySelectorAll('div.g'));
    return items.slice(0, 10).map((item, index) => {
      let title = item.querySelector('h3') ? item.querySelector('h3').innerText : '';
      let link = item.querySelector('a') ? item.querySelector('a').href : '';
      let snippet = item.querySelector('div[data-sncf="1"]') ? item.querySelector('div[data-sncf="1"]').innerText : '';
      return `${index + 1}. [${title}](${link}) - ${snippet}`;
    });
  });

  console.log("TOP 10 SERP:");
  console.log(results.join('\n'));
  await browser.close();
}
run();
