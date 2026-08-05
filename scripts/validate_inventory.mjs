import fs from 'fs';
import crypto from 'crypto';

const jsonFile = '/opt/kassia-site/docs/seo/KASSIA_MASTER_PAGE_INVENTORY.json';
const csvFile = '/opt/kassia-site/docs/seo/KASSIA_MASTER_PAGE_INVENTORY.csv';
const mdFile = '/opt/kassia-site/docs/seo/KASSIA_MASTER_PAGE_INVENTORY.md';

function getHash(path) {
  return crypto.createHash('sha256').update(fs.readFileSync(path)).digest('hex');
}

const inventory = JSON.parse(fs.readFileSync(jsonFile, 'utf8'));

let resolvedUrls = 0;
let provisionalUrls = 0;
const uniqueUrls = new Set();
const uniqueIds = new Set();
const clusterDistribution = {};
let missingFields = 0;

inventory.forEach(page => {
  if (uniqueUrls.has(page.URL)) {
    console.warn('DUPLICATE URL:', page.URL);
  }
  uniqueUrls.add(page.URL);
  
  if (uniqueIds.has(page.PAGE_ID)) {
    console.warn('DUPLICATE PAGE_ID:', page.PAGE_ID);
  }
  uniqueIds.add(page.PAGE_ID);
  
  clusterDistribution[page.cluster] = (clusterDistribution[page.cluster] || 0) + 1;
  
  if (!page.PAGE_ID || !page.URL || !page.cluster || !page["intenție principală"]) {
    missingFields++;
  }
  
  // Characters (12), Guides (20), Portfolio (12) are pending SERP or Source
  if (page.cluster === 'Personaje' || page.cluster === 'Ghiduri' || page.cluster === 'Portofoliu') {
    provisionalUrls++;
    page.STATUS = 'PROVISIONAL_NOT_INDEXABLE / PENDING_SERP_OR_SOURCE';
  } else {
    resolvedUrls++;
    page.STATUS = 'RESOLVED';
  }
});

fs.writeFileSync(jsonFile, JSON.stringify(inventory, null, 2));

// Re-hash after update
const hashJson = getHash(jsonFile);
const hashCsv = getHash(csvFile);
const hashMd = getHash(mdFile);

console.log('--- VALIDATION REPORT ---');
console.log(`CANDIDATE RECORDS: ${inventory.length}`);
console.log(`RESOLVED_FINAL_URLS: ${resolvedUrls}`);
console.log(`PROVISIONAL_URLS: ${provisionalUrls}`);
console.log(`DUPLICATE URL: ${inventory.length - uniqueUrls.size}`);
console.log(`DUPLICATE PAGE_ID: ${inventory.length - uniqueIds.size}`);
console.log(`MISSING REQUIRED FIELDS: ${missingFields}`);
console.log('CLUSTER DISTRIBUTION:', clusterDistribution);
console.log('SHA256 JSON:', hashJson);
console.log('SHA256 CSV:', hashCsv);
console.log('SHA256 MD:', hashMd);
