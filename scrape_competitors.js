import * as cheerio from 'cheerio';

const urls = [
  'https://www.anastasiaevents.ro/animatori-si-mascote/',
  'https://animatoriiveseli.ro/preturi/',
  'https://dizemanepe.ro/',
  'https://www.cool-events.ro/animatori-petreceri-copii/',
  'http://www.caravanapersonajelor.ro/tarife-si-oferte-promotionale.html'
];

async function scrape() {
  for (const url of urls) {
    try {
      console.log(`\n--- SCRAPING: ${url} ---`);
      const response = await fetch(url, {
        headers: {
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/120.0.0.0 Safari/537.36'
        }
      });
      const html = await response.text();
      const $ = cheerio.load(html);
      
      const title = $('title').text().trim();
      const h1 = $('h1').first().text().trim().replace(/\s+/g, ' ');
      const h2s = [];
      $('h2').each((i, el) => {
        if(i < 5) h2s.push($(el).text().trim().replace(/\s+/g, ' '));
      });
      
      const text = $('body').text().replace(/\s+/g, ' ').trim();
      const wordCount = text.split(' ').length;
      
      // FAQ count estimation (look for schema or accordion-like classes, or question marks in headers)
      const faqSchema = html.includes('FAQPage') ? "DA" : "NU";
      let faqCount = 0;
      $('h2, h3, h4, strong, div').each((i, el) => {
        const t = $(el).text();
        if(t.includes('?') && t.length > 10 && t.length < 100) faqCount++;
      });
      
      const hasPrices = text.includes('lei') || text.includes('RON') ? "DA" : "NU";
      const hasTransport = text.toLowerCase().includes('transport') ? "DA" : "NU";
      
      console.log(`TITLE: ${title}`);
      console.log(`H1: ${h1}`);
      console.log(`H2s: ${h2s.join(' | ')}`);
      console.log(`WordCount: ~${wordCount}`);
      console.log(`FAQ Schema: ${faqSchema}`);
      console.log(`Possible FAQs: ~${faqCount}`);
      console.log(`Are prețuri/lei: ${hasPrices}`);
      console.log(`Explică transport: ${hasTransport}`);
      
    } catch(e) {
      console.error(`ERROR fetching ${url}: ${e.message}`);
    }
  }
}
scrape();
