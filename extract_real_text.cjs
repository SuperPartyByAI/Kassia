const cheerio = require('cheerio');

async function run() {
  const res = await fetch('https://www.kassia.ro/animatori-petreceri-copii-voluntari/', {
      headers: {
          'Cache-Control': 'no-cache, no-store, must-revalidate',
          'Pragma': 'no-cache',
          'Expires': '0'
      }
  });
  const html = await res.text();
  const $ = cheerio.load(html);

  console.log("=== EXTRAGERE HTML LIVE (H2 Sections) ===");
  $('.section-body').each((i, el) => {
      const pText = $(el).find('p').text();
      if(pText) {
          console.log(`\n[Paragraf ${i+1}]:\n${pText}`);
      }
  });

  console.log("\n=== EXTRAGERE HTML LIVE (FAQs) ===");
  $('.faq-details').each((i, el) => {
      const q = $(el).find('.faq-summary').text();
      const a = $(el).find('.faq-answer').text();
      console.log(`\n[FAQ ${i+1}] Q: ${q}`);
      console.log(`[FAQ ${i+1}] A: ${a}`);
  });
}
run();
