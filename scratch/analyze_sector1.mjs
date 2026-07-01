import fs from 'fs';

const html = fs.readFileSync('./scratch/sector1.html', 'utf-8');

console.log("=== HEADINGS ===");
const h1Matches = html.match(/<h1[^>]*>([\s\S]*?)<\/h1>/gi) || [];
console.log(`H1 count: ${h1Matches.length}`);
h1Matches.forEach(m => console.log("  " + m.replace(/<[^>]+>/g, '').trim()));

const h2Matches = html.match(/<h2[^>]*>([\s\S]*?)<\/h2>/gi) || [];
console.log(`H2 count: ${h2Matches.length}`);
h2Matches.forEach((m, idx) => console.log(`  ${idx+1}. ${m.replace(/<[^>]+>/g, '').trim()}`));

const h3Matches = html.match(/<h3[^>]*>([\s\S]*?)<\/h3>/gi) || [];
console.log(`H3 count: ${h3Matches.length}`);
h3Matches.forEach((m, idx) => console.log(`  ${idx+1}. ${m.replace(/<[^>]+>/g, '').trim()}`));

console.log("\n=== SCHEMAS (application/ld+json) ===");
const schemaRegex = /<script\s+type="application\/ld\+json"[^>]*>([\s\S]*?)<\/script>/gi;
let match;
let idx = 1;
while ((match = schemaRegex.exec(html)) !== null) {
  try {
    const data = JSON.parse(match[1].trim());
    console.log(`Block ${idx}:`, JSON.stringify(data, null, 2));
  } catch(e) {
    console.log(`Block ${idx} invalid:`, e.message);
  }
  idx++;
}

console.log("\n=== SEARCH FOR GOOGLE / GBP MENTIONS ===");
const googleMatches = html.match(/google/gi) || [];
const gbpMatches = html.match(/gbp/gi) || [];
const gmbMatches = html.match(/gmb/gi) || [];

console.log(`Google matches in html: ${googleMatches.length}`);
console.log(`GBP matches in html: ${gbpMatches.length}`);
console.log(`GMB matches in html: ${gmbMatches.length}`);

console.log("\n=== FILTERED GOOGLE MENTIONS (excluding site-verification & schema.org) ===");
const lines = html.split('\n');
lines.forEach((line, lineIdx) => {
  if (/google|gbp|gmb/i.test(line) && !/google-site-verification|schema\.org/i.test(line)) {
    console.log(`Line ${lineIdx+1}: ${line.trim()}`);
  }
});
