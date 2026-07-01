import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

const baseUrl = 'https://www.kassia.ro';
const newPage = `${baseUrl}/personaje-animatori-copii-bucuresti/`;

const pagesToCheck = [
  '/',
  '/animatori-petreceri-copii/',
  '/animatori-petreceri-copii-sector-1/',
  '/animatori-petreceri-copii-sector-2/',
  '/animatori-petreceri-copii-sector-3/',
  '/animatori-petreceri-copii-sector-4/',
  '/animatori-petreceri-copii-sector-5/',
  '/animatori-petreceri-copii-sector-6/',
  '/preturi-animatori-copii-bucuresti/'
];

async function run() {
  console.log("=== LIVE VALIDATION ===");

  // 1. Check New Page
  console.log(`Checking new page: ${newPage}`);
  const res = await fetch(newPage);
  const status = res.status;
  const text = await res.text();
  const $ = cheerio.load(text);
  
  const title = $('title').text().trim();
  const metaDesc = $('meta[name="description"]').attr('content') || '';
  const h1 = $('h1').text().trim();
  const canonical = $('link[rel="canonical"]').attr('href') || '';
  const robots = $('meta[name="robots"]').attr('content') || '';
  const faqs = $('script[type="application/ld+json"]').filter((i, el) => $(el).html().includes('FAQPage')).length;
  
  console.log({
    status,
    title: title.substring(0,30) + '...',
    h1,
    canonical,
    robots,
    hasFaqSchema: faqs > 0
  });

  // 2. Check internal links on existing pages
  for (const p of pagesToCheck) {
    const pUrl = `${baseUrl}${p}`;
    const pRes = await fetch(pUrl);
    const pText = await pRes.text();
    const p$ = cheerio.load(pText);
    const hasLink = p$('a[href="/personaje-animatori-copii-bucuresti/"]').length > 0;
    console.log(`Checking link on ${pUrl}: ${hasLink ? 'OK' : 'MISSING'}`);
  }

  // 3. Verify Legacy Redirects
  console.log("\nVerifying legacy redirect /animatori-copii-sector-2/");
  const legRes = await fetch(`${baseUrl}/animatori-copii-sector-2/`, { redirect: 'manual' });
  console.log(`Legacy status: ${legRes.status}`);
}

run();
