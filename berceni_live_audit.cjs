const puppeteer = require('puppeteer');

async function scrape(url) {
  try {
    const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    const response = await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    
    const data = await page.evaluate(() => {
      const title = document.title;
      const h1 = document.querySelector('h1') ? document.querySelector('h1').innerText.replace(/\n/g, ' ') : 'N/A';
      const metaDesc = document.querySelector('meta[name="description"]') ? document.querySelector('meta[name="description"]').content : 'N/A';
      const canonical = document.querySelector('link[rel="canonical"]') ? document.querySelector('link[rel="canonical"]').href : 'N/A';
      const robots = document.querySelector('meta[name="robots"]') ? document.querySelector('meta[name="robots"]').content : 'N/A';
      
      const hasFaqSchema = !!document.querySelector('script[type="application/ld+json"]') && document.querySelector('script[type="application/ld+json"]').innerText.includes('FAQPage');
      
      return { title, h1, metaDesc, canonical, robots, hasFaqSchema };
    });
    
    // Also capture the redirect target if the page redirected
    data.status = response.status();
    data.url = page.url(); // Final URL
    data.redirected = response.request().redirectChain().length > 0;
    if (data.redirected) {
        data.redirectTarget = data.url;
    }
    
    await browser.close();
    return data;
  } catch (err) {
    return { error: err.message };
  }
}

const urls = [
  'https://www.kassia.ro/animatori-copii-berceni/',
  'https://www.kassia.ro/animatori-copii-berceni',
  'https://www.kassia.ro/animatori-petreceri-copii-berceni/',
  'https://www.kassia.ro/animatori-petreceri-copii-sector-4/'
];

(async () => {
  for (const url of urls) {
    console.log(`\n=== Live Check for ${url} ===`);
    const res = await scrape(url);
    console.log(JSON.stringify(res, null, 2));
  }
})();
