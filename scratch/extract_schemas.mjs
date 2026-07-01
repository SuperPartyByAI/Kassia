import * as cheerio from 'cheerio';

async function run() {
  try {
    const html = await fetch('http://127.0.0.1:3050/animatori-petreceri-copii-sector-1/').then(r => r.text());
    const $ = cheerio.load(html);
    const schemas = [];
    $('script[type="application/ld+json"]').each((i, el) => {
      try {
        schemas.push(JSON.parse($(el).text()));
      } catch (err) {
        console.error("Error parsing schema:", err.message);
      }
    });
    console.log(JSON.stringify(schemas, null, 2));
  } catch (err) {
    console.error("Fetch error:", err.message);
  }
}
run();
