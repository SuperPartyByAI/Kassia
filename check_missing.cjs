const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

function getHash(filePath) {
  return crypto.createHash('sha256').update(fs.readFileSync(filePath)).digest('hex');
}

const origFolder = '/Users/universparty/wa-web-launcher/kassia-site/kassia-maps-poze';
const seoFolder = '/Users/universparty/wa-web-launcher/kassia-site/kassia-maps-poze-seo';

const origHashes = {};
const origFiles = fs.readdirSync(origFolder).filter(f => f.endsWith('.png') || f.endsWith('.jpg'));
for (const f of origFiles) {
  origHashes[getHash(path.join(origFolder, f))] = f;
}

const seoHashes = new Set();
const seoFiles = fs.readdirSync(seoFolder).filter(f => f.endsWith('.png') || f.endsWith('.jpg'));
for (const f of seoFiles) {
  seoHashes.add(getHash(path.join(seoFolder, f)));
}

let missing = [];
for (const hash in origHashes) {
  if (!seoHashes.has(hash)) {
    missing.push(origHashes[hash]);
  }
}

console.log("Missing in SEO folder: ", missing);
