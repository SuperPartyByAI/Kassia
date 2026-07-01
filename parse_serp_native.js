import * as cheerio from 'cheerio';
import fs from 'fs';

const queries = [
  "prețuri animatori copii București",
  "tarife animatori copii București",
  "pachete animatori petreceri copii București",
  "animatori petreceri copii prețuri"
];

const evidence = {};

for (let i = 0; i < queries.length; i++) {
  const q = queries[i];
  try {
    const html = fs.readFileSync(`raw_serp_${i}.html`, 'utf8');
    const $ = cheerio.load(html);
    const results = [];
    
    // In native Google Desktop Chrome, search results are usually in div.g
    const items = $('div.g').toArray();
    let position = 1;
    
    for (const item of items) {
       // Filter out local pack, PAA, etc. (often nested differently)
       if ($(item).parents('.Wt5Tfe, .O9g5cc, .xpdopen').length > 0) continue;
       
       const titleEl = $(item).find('h3');
       const linkEl = $(item).find('a');
       
       if (titleEl.length > 0 && linkEl.length > 0) {
           const url = linkEl.attr('href');
           const title = titleEl.text().trim();
           if (url && !url.includes('google.com') && url.startsWith('http')) {
               results.push({
                   position: position++,
                   title: title,
                   url: url,
                   domain: new URL(url).hostname.replace('www.', '')
               });
           }
       }
    }
    evidence[q] = results.slice(0, 10);
  } catch (e) {
    console.error(`Error parsing ${q}: ${e.message}`);
  }
}

fs.writeFileSync('serp_native_organic.json', JSON.stringify(evidence, null, 2));
console.log(JSON.stringify(evidence, null, 2));
