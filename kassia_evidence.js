import * as cheerio from 'cheerio';
import fs from 'fs';

async function run() {
  const url = 'https://www.kassia.ro/preturi-animatori-copii-bucuresti/';
  const response = await fetch(url);
  const status = response.status;
  const html = await response.text();
  const $ = cheerio.load(html);
  
  const evidence = {
    HTTP_STATUS: status,
    TITLE: $('title').text(),
    META_DESC: $('meta[name="description"]').attr('content'),
    CANONICAL: $('link[rel="canonical"]').attr('href'),
    ROBOTS: $('meta[name="robots"]').attr('content'),
    H1: $('h1').text().trim(),
    WORD_COUNT: $('body').text().replace(/\s+/g, ' ').split(' ').length,
    FAQ_COUNT: $('details.faq-details').length,
    FAQ_SCHEMA: html.includes('FAQPage') ? "DA" : "NU",
    PRICING_TABLES: $('table').length > 0 ? "DA" : "NU",
    TRANSPORT_TEXT: html.includes('transportul este inclus') ? "DA" : "NU",
    BALLOON_EXPLODER: html.includes('Balloon Exploder') ? "DA" : "NU",
    LINK_HUB: $('a[href="/animatori-petreceri-copii/"]').length > 0 ? "DA" : "NU",
    LINK_PICTURA: $('a[href="/pictura-pe-fata-copii-bucuresti/"]').length > 0 ? "DA" : "NU",
    LINK_MODELAJ: $('a[href="/modelaj-baloane-copii-bucuresti/"]').length > 0 ? "DA" : "NU"
  };
  
  fs.writeFileSync('kassia_live_evidence.json', JSON.stringify(evidence, null, 2));
  fs.writeFileSync('kassia_live_source.html', html);
  console.log("Kassia evidence saved.");
}
run();
