import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

async function run() {
  const url = 'https://www.kassia.ro/personaje-animatori-copii-bucuresti/';
  const targetUrl = '/preturi-animatori-copii-bucuresti/';
  
  const r = await fetch(url);
  const status = r.status;
  const html = await r.text();
  const $ = cheerio.load(html);
  
  const links = $('.kassia-premium-page a[href="' + targetUrl + '"]');
  const numLinks = links.length;
  
  if (numLinks > 0) {
    const anchor = links.first().text().trim();
    console.log(`ALREADY_PRESENT|${anchor}`);
  } else {
    console.log('MISSING');
  }
}

run();
