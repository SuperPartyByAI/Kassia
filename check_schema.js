const fetch = require('node-fetch');
const cheerio = require('cheerio');

fetch('https://www.kassia.ro/animatori-petreceri-copii/')
  .then(res => res.text())
  .then(html => {
    const $ = cheerio.load(html);
    const scripts = $('script[type="application/ld+json"]');
    console.log('Found ' + scripts.length + ' JSON-LD scripts');
    scripts.each((i, el) => {
      console.log('Script ' + i + ':');
      console.log($(el).html());
    });
  })
  .catch(err => console.error(err));
