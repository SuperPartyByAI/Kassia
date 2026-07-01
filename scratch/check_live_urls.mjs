import * as cheerio from 'cheerio';

const URLS = [
  'https://www.kassia.ro/animatori-petreceri-copii/',
  'https://www.kassia.ro/animatori-copii/',
  'https://www.kassia.ro/animatori-petreceri-copii-bucuresti/',
  'https://www.kassia.ro/animatori-petreceri-copii-sector-1/'
];

async function checkUrl(url) {
  console.log(`\nChecking URL: ${url}`);
  try {
    const res = await fetch(url, { redirect: 'manual' });
    console.log(`HTTP Status: ${res.status}`);
    
    if (res.status === 301 || res.status === 302) {
      console.log(`Redirects to: ${res.headers.get('location')}`);
      return;
    }

    if (res.status === 200) {
      const followRes = await fetch(url);
      const html = await followRes.text();
      const $ = cheerio.load(html);
      
      const canonical = $('link[rel="canonical"]').attr('href');
      const robots = $('meta[name="robots"]').attr('content');
      
      const h1s = [];
      $('h1').each((_, el) => h1s.push($(el).text().trim()));
      
      const h2Count = $('h2').length;
      
      console.log(`Canonical: ${canonical}`);
      console.log(`Robots: ${robots}`);
      console.log(`H1 count: ${h1s.length}, text: "${h1s[0] || ''}"`);
      console.log(`H2 count: ${h2Count}`);
    }
  } catch (e) {
    console.error(`Error checking ${url}:`, e.message);
  }
}

async function run() {
  for (const url of URLS) {
    await checkUrl(url);
  }
}

run().catch(console.error);
