import fs from 'fs';
import path from 'path';

const sqlDir = '/Users/universparty/wa-web-launcher/kassia-site/db';
const sqlFiles = fs.readdirSync(sqlDir).filter(f => f.endsWith('.sql'));

const terms = [
  'pages',
  'page_sections',
  'internal_links',
  'faqs',
  'gallery_items',
  'pricing_packages',
  'publish_page',
  'unpublish_page',
  'get_sitemap_entries',
  'get_robots_meta',
  'get_canonical_url'
];

let dangerousCount = 0;
let safeCount = 0;

for (const file of sqlFiles) {
  const content = fs.readFileSync(path.join(sqlDir, file), 'utf8');
  const lines = content.split('\n');
  
  lines.forEach((line, i) => {
    for (const term of terms) {
      // Check for exact word boundary matches of the term
      const regex = new RegExp(`\\b${term}\\b`, 'g');
      let match;
      while ((match = regex.exec(line)) !== null) {
        // Check if it's prefixed by 'kassia_'
        const isPrefixed = line.substring(match.index - 7, match.index) === 'kassia_';
        if (isPrefixed) {
          safeCount++;
        } else {
          // It's dangerous!
          console.log(`[DANGEROUS] ${file}:${i+1} : ${line.trim()}`);
          dangerousCount++;
        }
      }
    }
  });
}

console.log(`\nSafe kassia_ occurrences: ${safeCount}`);
console.log(`Dangerous non-prefixed occurrences: ${dangerousCount}`);
