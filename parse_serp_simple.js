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
    let position = 1;
    
    $('div.g').each((i, item) => {
       const titleEl = $(item).find('h3').first();
       const linkEl = $(item).find('a').first();
       
       if (titleEl.length > 0 && linkEl.length > 0) {
           const url = linkEl.attr('href');
           const title = titleEl.text().trim();
           if (url && !url.includes('google.com') && url.startsWith('http') && !url.includes('google.ro')) {
               results.push({
                   position: position++,
                   title: title,
                   url: url,
                   domain: new URL(url).hostname.replace('www.', '')
               });
           }
       }
    });
    
    // Deduplicate domains and exact URLs
    const unique = [];
    const seenDomains = new Set();
    results.forEach(r => {
        if (!seenDomains.has(r.domain)) {
            seenDomains.add(r.domain);
            unique.push(r);
        }
    });
    
    evidence[q] = unique.slice(0, 10);
  } catch (e) {
    console.error(`Error parsing ${q}: ${e.message}`);
  }
}

fs.writeFileSync('serp_native_organic.json', JSON.stringify(evidence, null, 2));
console.log(JSON.stringify(evidence, null, 2));
