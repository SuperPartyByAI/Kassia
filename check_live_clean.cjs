const cheerio = require('cheerio');

async function run() {
  const res = await fetch('https://www.kassia.ro/animatori-petreceri-copii-voluntari/', {
      headers: { 'Cache-Control': 'no-cache, no-store' }
  });
  const html = await res.text();
  const $ = cheerio.load(html);

  // Remove protected blocks
  $('.aprecieri-sectiune, .site-footer').remove();
  
  const text = $('body').text();
  const terms = ['Intervenim cu succes', 'tărâm', 'perfect', 'siguran', 'asigur', 'ideale', 'Absolut', 'personajul ideal'];
  
  const found = terms.filter(t => text.toLowerCase().includes(t.toLowerCase()));
  
  if (found.length === 0) {
      console.log('OUTPUT GOL (Fără termeni interziși în conținutul editabil)');
  } else {
      console.log('FOUND:', found);
      // Let's print the HTML of the elements that contain it just to be sure
      $('*').each((i, el) => {
          if($(el).children().length === 0) {
              const elText = $(el).text();
              for(const t of found) {
                  if(elText.toLowerCase().includes(t.toLowerCase())) {
                       console.log(`FOUND IN TAG <${el.tagName}>: ${elText}`);
                  }
              }
          }
      });
  }
}
run();
