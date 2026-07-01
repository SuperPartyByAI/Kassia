import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

async function run() {
  const urls = [
    'https://www.kassia.ro/',
    'https://www.kassia.ro/animatori-petreceri-copii/',
    'https://www.kassia.ro/animatori-petreceri-copii-sector-1/',
    'https://www.kassia.ro/animatori-petreceri-copii-sector-6/',
    'https://www.kassia.ro/preturi-animatori-copii-bucuresti/'
  ];
  
  for (const u of urls) {
    const r = await fetch(u);
    const html = await r.text();
    const $ = cheerio.load(html);
    const hasLink = $('a[href="/personaje-animatori-copii-bucuresti/"]').length > 0;
    console.log(u, 'has link:', hasLink);
  }
}

run();
