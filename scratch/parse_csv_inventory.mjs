import fs from 'fs';
import path from 'path';

const csvPath = '/Users/universparty/.gemini/antigravity/brain/0ef2e4ed-9c7f-4113-a38e-7835fd2fb733/artifacts/structura_seo_500_pagini.csv';
const content = fs.readFileSync(csvPath, 'utf-8');

// Parse CSV manually or using a simple splitter since it's simple
const lines = content.split('\n').filter(l => l.trim() !== '');
const header = lines[0].split(',');
const rows = [];

// Quick CSV parser for quoted fields
for (let i = 1; i < lines.length; i++) {
  const line = lines[i];
  const row = [];
  let current = '';
  let inQuotes = false;
  
  for (let j = 0; j < line.length; j++) {
    const char = line[j];
    if (char === '"') {
      inQuotes = !inQuotes;
    } else if (char === ',' && !inQuotes) {
      row.push(current.trim());
      current = '';
    } else {
      current += char;
    }
  }
  row.push(current.trim());
  
  // Map row to headers
  const rowObj = {};
  header.forEach((h, idx) => {
    rowObj[h.trim()] = row[idx] ? row[idx].replace(/^"|"$/g, '') : '';
  });
  rows.push(rowObj);
}

console.log("=== CSV OVERVIEW ===");
console.log(`Total rows (excl header): ${rows.length}`);

const uniqueSlugs = new Set(rows.map(r => r.Slug).filter(Boolean));
console.log(`Unique slugs: ${uniqueSlugs.size}`);

const uniqueKeywords = new Set(rows.map(r => r.Keyword).filter(Boolean));
console.log(`Unique keywords: ${uniqueKeywords.size}`);

// Categorize page types or slugs
let bucurestiCount = 0;
let sectorCount = 0;
let cartierCount = 0;
let ilfovCount = 0;
let personajeCount = 0;
let serviciiCount = 0; // Wait, are services pages in 'pagină oraș + serviciu'? Yes. Let's check total for that type or by service.
let tematiciCount = 0;
let varsteCount = 0;
let evenimenteCount = 0;

const ilfovLocations = ['pantelimon', 'voluntari', 'pipera', 'otopeni', 'chiajna', 'bragadiru', 'popesti-leordeni', 'ilfov', 'buftea', 'chitila', 'magurele', 'pantelimon', 'cernica', 'snagov', 'corbeanca', 'otopeni', 'mogosoaia', 'jilava', 'domnesti', 'afumati', 'balotesti', 'pantelimon'];
const sectors = ['sector-1', 'sector-2', 'sector-3', 'sector-4', 'sector-5', 'sector-6'];

let foundGenericSlug = false;
let foundGenericKeyword = false;
let genericSlugRows = [];
let genericKeywordRows = [];

rows.forEach(r => {
  const type = r['Tip Pagina'] || '';
  const slug = r.Slug || '';
  const kw = r.Keyword || '';
  const slugLower = slug.toLowerCase();
  const kwLower = kw.toLowerCase();
  
  if (slug === '/animatori-petreceri-copii/') {
    foundGenericSlug = true;
    genericSlugRows.push(r);
  }
  if (kw === 'animatori petreceri copii') {
    foundGenericKeyword = true;
    genericKeywordRows.push(r);
  }

  if (type === 'pagină personaj') {
    personajeCount++;
  } else if (type === 'pagină tematică vârstă') {
    varsteCount++;
  } else if (type === 'pagină eveniment') {
    evenimenteCount++;
  } else if (type === 'pagină tematică') {
    tematiciCount++;
  } else if (type === 'pagină oraș + serviciu') {
    // Determine the location
    if (sectors.some(sec => slugLower.includes(sec))) {
      sectorCount++;
    } else if (slugLower.includes('-bucuresti/') && !slugLower.includes('sector') && !slugLower.includes('ilfov')) {
      bucurestiCount++;
    } else if (ilfovLocations.some(loc => slugLower.includes(loc))) {
      ilfovCount++;
    } else {
      cartierCount++;
    }
  }
});

const closeKws = rows.filter(r => r.Keyword.toLowerCase().includes('animatori petreceri') || r.Keyword.toLowerCase().includes('animatori copii'));
console.log(`\nKeywords containing 'animatori petreceri' or 'animatori copii' in CSV (${closeKws.length} total):`);
closeKws.slice(0, 30).forEach(r => console.log(`Slug: ${r.Slug} | Keyword: ${r.Keyword}`));


console.log(`\nGeneric slug '/animatori-petreceri-copii/' exists: ${foundGenericSlug ? 'Da' : 'Nu'}`);
console.log(`Generic keyword 'animatori petreceri copii' exists: ${foundGenericKeyword ? 'Da' : 'Nu'}`);

const bucurestiSlugs = rows.filter(r => r.Slug.toLowerCase().includes('bucuresti'));
console.log(`\nSlugs containing 'bucuresti' in CSV (${bucurestiSlugs.length} total):`);
bucurestiSlugs.forEach(r => console.log(`Slug: ${r.Slug} | Keyword: ${r.Keyword}`));



