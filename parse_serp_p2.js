import * as cheerio from 'cheerio';
import fs from 'fs';

const queries = [
  "animatori petreceri copii București",
  "animatori copii București",
  "animatori pentru petreceri copii",
  "animatori petreceri copii"
];

const evidence = {};

for (let i = 0; i < queries.length; i++) {
  const q = queries[i];
  try {
    const html = fs.readFileSync(`raw_serp_p2_${i}.html`, 'utf8');
    const $ = cheerio.load(html);
    const results = [];
    let position = 1;
    
    // Fallback parser since cheerio structure matching can be fragile
    const rawLinks = html.match(/<a [^>]*href="https:\/\/[^"]*"[^>]*>/g) || [];
    const seenDomains = new Set();
    
    for (const linkHtml of rawLinks) {
       if (linkHtml.includes('jsname=') && linkHtml.includes('data-ved=')) {
          const urlMatch = linkHtml.match(/href="(https:\/\/[^"]*)"/);
          if (urlMatch) {
             const url = urlMatch[1];
             if (!url.includes('google.com') && !url.includes('google.ro')) {
                 const domain = new URL(url).hostname.replace('www.', '');
                 if (!seenDomains.has(domain)) {
                     seenDomains.add(domain);
                     results.push({
                         position: position++,
                         url: url,
                         domain: domain
                     });
                 }
             }
          }
       }
    }
    
    evidence[q] = results.slice(0, 10);
  } catch (e) {
    console.error(`Error parsing ${q}: ${e.message}`);
  }
}

console.log(JSON.stringify(evidence, null, 2));
