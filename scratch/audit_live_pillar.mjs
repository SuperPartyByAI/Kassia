import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

const URL = 'https://www.kassia.ro/animatori-petreceri-copii-bucuresti/';

async function audit() {
  try {
    const res = await fetch(URL, { headers: { 'User-Agent': 'Mozilla/5.0' } });
    const html = await res.text();
    const $ = cheerio.load(html);

    console.log("=== JSON-LD Scripts ===");
    $('script[type="application/ld+json"]').each((i, el) => {
      console.log(`Script ${i}:`);
      console.log($(el).html());
      console.log("------------------------");
    });
  } catch (e) {
    console.error(e);
  }
}

audit();
