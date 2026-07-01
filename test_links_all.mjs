import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

async function run() {
  const urls = [
    'https://www.kassia.ro/',
    'https://www.kassia.ro/animatori-petreceri-copii/',
    'https://www.kassia.ro/animatori-petreceri-copii-sector-1/',
    'https://www.kassia.ro/animatori-petreceri-copii-sector-2/',
    'https://www.kassia.ro/animatori-petreceri-copii-sector-3/',
    'https://www.kassia.ro/animatori-petreceri-copii-sector-4/',
    'https://www.kassia.ro/animatori-petreceri-copii-sector-5/',
    'https://www.kassia.ro/animatori-petreceri-copii-sector-6/',
    'https://www.kassia.ro/preturi-animatori-copii-bucuresti/'
  ];
  
  const results = [];
  
  for (const u of urls) {
    const r = await fetch(u);
    const status = r.status;
    const html = await r.text();
    const $ = cheerio.load(html);
    
    const links = $('a[href="/personaje-animatori-copii-bucuresti/"]');
    const numLinks = links.length;
    const anchorText = numLinks > 0 ? links.first().text().trim() : 'N/A';
    
    // duplicate check:
    const duplicates = numLinks > 1 ? 'DA (' + numLinks + ')' : 'NU';
    
    const verdict = (status === 200 && numLinks === 1) ? 'OK' : 'ISSUE';
    
    results.push({
      Pagină: new URL(u).pathname,
      HTTP: status,
      'număr linkuri către Personaje': numLinks,
      'anchor text': anchorText,
      duplicate: duplicates,
      verdict: verdict
    });
  }
  
  console.table(results);
}

run();
