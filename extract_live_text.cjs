
const cheerio = require('cheerio');

async function run() {
  const res = await fetch('https://www.kassia.ro/animatori-petreceri-copii-voluntari/', {
      headers: {
          'Cache-Control': 'no-cache',
          'Pragma': 'no-cache'
      }
  });
  const html = await res.text();
  const $ = cheerio.load(html);

  console.log("=== RAW HTML EXCERPTS (H2 Sections) ===");
  $('.split-section, .hero').each((i, el) => {
      const pText = $(el).find('p').text();
      if(pText) {
          console.log(`[Fragment ${i+1}]: ${pText}`);
      }
  });

  console.log("\n=== RAW HTML EXCERPTS (FAQs) ===");
  $('.faq-item').each((i, el) => {
      const q = $(el).find('h3').text();
      const a = $(el).find('.faq-answer p').text();
      console.log(`[FAQ ${i+1}] Q: ${q}`);
      console.log(`[FAQ ${i+1}] A: ${a}`);
  });
}
run();
