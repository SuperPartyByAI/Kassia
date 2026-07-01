const puppeteer = require('puppeteer');

async function scrape(url) {
  try {
    const browser = await puppeteer.launch({ args: ['--no-sandbox', '--disable-setuid-sandbox'] });
    const page = await browser.newPage();
    const response = await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
    
    const data = await page.evaluate(() => {
      const title = document.title;
      const h1 = document.querySelector('h1') ? document.querySelector('h1').innerText.replace(/\n/g, ' ') : 'N/A';
      const bodyText = document.body.innerText.replace(/\n/g, ' ');
      const imgs = Array.from(document.querySelectorAll('img')).map(img => img.src).filter(src => src.startsWith('http'));
      const faqs = Array.from(document.querySelectorAll('.faq, .accordion, details, [itemprop="mainEntity"]')).length;
      const ctas = Array.from(document.querySelectorAll('a')).filter(a => /rezervă|contact|sună|pret|pachete/i.test(a.innerText)).length;
      
      return { title, h1, bodyText: bodyText.substring(0, 3000), imgCount: imgs.length, faqCount: faqs, ctaCount: ctas };
    });
    
    data.status = response.status();
    await browser.close();
    return data;
  } catch (err) {
    return { error: err.message };
  }
}

const urls = [
  'https://www.superparty.ro/animatori-copii-sector-4/',
  'https://www.funevents.ro/animatori-copii/animatori-copii-bucuresti-sector-4/',
  'https://dizemanepe.ro/animatori-copii-sector-4/',
  'https://alegriaparty.ro/',
  'https://sabripark.ro/'
];

(async () => {
  for (const url of urls) {
    console.log(`\n=== Competitor: ${url} ===`);
    const res = await scrape(url);
    console.log(JSON.stringify(res, null, 2));
  }
})();
