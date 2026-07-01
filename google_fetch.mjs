import * as cheerio from 'cheerio';

const queries = [
  "animatori copii Voluntari",
  "animatori copii Pipera",
  "animatori copii Iancu Nicolae"
];

const headers = {
  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36',
  'Accept-Language': 'ro-RO,ro;q=0.9,en-US;q=0.8,en;q=0.7'
};

(async () => {
  for (const query of queries) {
    console.log(`\n--- QUERY: ${query} ---`);
    const url = `https://www.google.ro/search?q=${encodeURIComponent(query)}&gl=ro&hl=ro&num=15`;
    try {
      const response = await fetch(url, { headers });
      const html = await response.text();
      const $ = cheerio.load(html);
      
      const results = $('div.g');
      let count = 0;
      results.each((i, el) => {
        if (count >= 10) return;
        const a_tag = $(el).find('a').first();
        if (a_tag.length && a_tag.attr('href') && a_tag.attr('href').startsWith('http')) {
          const href = a_tag.attr('href');
          const title = $(el).find('h3').first().text() || "No title";
          const snippet = $(el).find('div[style="-webkit-line-clamp:2"], .VwiC3b').first().text() || "No snippet";
          console.log(`[${count+1}] TITLE: ${title}\n    URL: ${href}\n    SNIPPET: ${snippet}\n`);
          count++;
        }
      });
    } catch (e) {
      console.log(`Error fetching ${query}: ${e.message}`);
    }
    await new Promise(r => setTimeout(r, 2000));
  }
})();
