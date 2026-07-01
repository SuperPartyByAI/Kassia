import * as cheerio from 'cheerio';

const queries = [
  "animatori copii Voluntari",
  "animatori petreceri copii Voluntari",
  "animatori copii Pipera",
  "animatori copii Iancu Nicolae"
];

const headers = {
  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'
};

(async () => {
  for (const query of queries) {
    console.log(`\n--- QUERY: ${query} ---`);
    const url = `https://html.duckduckgo.com/html/?q=${encodeURIComponent(query)}`;
    try {
      const response = await fetch(url, { headers });
      const html = await response.text();
      const $ = cheerio.load(html);
      
      const results = $('.result');
      let count = 0;
      results.each((i, el) => {
        if (count >= 10) return;
        const a_tag = $(el).find('.result__title a').first();
        if (a_tag.length) {
          const href = a_tag.attr('href');
          // DDG often wraps urls in //duckduckgo.com/l/?uddg=...
          let cleanHref = href;
          if (href.includes('uddg=')) {
              try {
                  const urlObj = new URL(href, 'https://duckduckgo.com');
                  cleanHref = decodeURIComponent(urlObj.searchParams.get('uddg'));
              } catch(e) {}
          }
          const title = a_tag.text().trim();
          const snippet = $(el).find('.result__snippet').first().text().trim();
          console.log(`[${count+1}] TITLE: ${title}\n    URL: ${cleanHref}\n    SNIPPET: ${snippet}\n`);
          count++;
        }
      });
    } catch (e) {
      console.log(`Error fetching ${query}: ${e.message}`);
    }
    await new Promise(r => setTimeout(r, 2000));
  }
})();
