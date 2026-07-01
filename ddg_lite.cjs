const cheerio = require('cheerio');
async function run() {
  const queries = ['animatori petreceri copii Voluntari', 'animatori copii Pipera'];
  for (const q of queries) {
    const res = await fetch('https://lite.duckduckgo.com/lite/', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded', 'User-Agent': 'Mozilla/5.0' },
      body: 'q=' + encodeURIComponent(q)
    });
    const html = await res.text();
    const $ = cheerio.load(html);
    console.log(`\n=== QUERY: ${q} ===`);
    $('.result-snippet').each((i, el) => {
        const href = $(el).attr('href');
        if (href) console.log(href);
    });
    $('.result-url').each((i, el) => {
        const text = $(el).text().trim();
        if (text) console.log(text);
    });
  }
}
run();
