import fs from 'fs';
import * as cheerio from 'cheerio';
import https from 'https';

const url = 'https://www.google.ro/search?q=preturi+animatori+copii+Bucuresti&hl=ro';
const options = {
  headers: {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
  }
};

https.get(url, options, (res) => {
  let data = '';
  res.on('data', (chunk) => data += chunk);
  res.on('end', () => {
    const $ = cheerio.load(data);
    const results = [];
    $('div.g').each((i, el) => {
      if (i >= 10) return false;
      const title = $(el).find('h3').text();
      const link = $(el).find('a').attr('href');
      const snippet = $(el).text();
      results.push(`${i+1}. ${title} | ${link}`);
    });
    console.log("TOP 10:");
    console.log(results.join('\n'));
  });
}).on('error', (err) => console.error(err));
