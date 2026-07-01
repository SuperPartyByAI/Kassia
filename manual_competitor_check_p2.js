import puppeteer from 'puppeteer';

async function run() {
  const browser = await puppeteer.launch({
    headless: false,
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  
  const page = await browser.newPage();
  
  const urls = [
    "https://www.cool-events.ro/animatori-petreceri-copii/",
    "https://www.bluparty.ro/petreceri-personaje-animatori-14/",
    "https://www.funevents.ro/",
    "https://paradisulpersonajelor.ro/animatie-copii/",
    "https://dizemanepe.ro/"
  ];
  
  const results = {};
  
  for (const url of urls) {
    try {
      await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
      const data = await page.evaluate(() => {
        const text = document.body.innerText;
        return {
          h1: document.querySelector('h1') ? document.querySelector('h1').innerText : 'None',
          h2: Array.from(document.querySelectorAll('h2')).map(el => el.innerText).slice(0,2),
          wordCount: text.split(/\s+/).length,
          hasTable: document.querySelector('table') ? true : false,
          hasPrices: text.includes('lei') || text.includes('RON')
        };
      });
      results[url] = data;
    } catch(e) {
      results[url] = { error: e.message };
    }
  }
  
  console.log(JSON.stringify(results, null, 2));
  await browser.close();
}
run();
