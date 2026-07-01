import fetch from 'node-fetch';
import * as cheerio from 'cheerio';
import { XMLParser } from 'fast-xml-parser';

const domain = 'https://www.kassia.ro';

async function run() {
  console.log('--- RAW CURL OUTPUTS PRODUCED VIA SCRIPT ---');
  // We'll just run them via node-fetch headers for the same effect
  
  // 1. Check New URL
  const newUrl = domain + '/animatori-petreceri-copii-popesti-leordeni/';
  const resNew = await fetch(newUrl, { redirect: 'manual' });
  console.log(`curl -I ${newUrl}`);
  console.log(`HTTP/1.1 ${resNew.status} ${resNew.statusText}`);
  for (const [key, val] of resNew.headers.entries()) console.log(`${key}: ${val}`);
  console.log('');
  
  // 2. Check Old URL
  const oldUrl = domain + '/animatori-copii-popesti-leordeni/';
  const resOld = await fetch(oldUrl, { redirect: 'manual' });
  console.log(`curl -I ${oldUrl}`);
  console.log(`HTTP/1.1 ${resOld.status} ${resOld.statusText}`);
  for (const [key, val] of resOld.headers.entries()) console.log(`${key}: ${val}`);
  console.log('');

  // 3. Sitemap Check
  console.log(`curl -s ${domain}/sitemap.xml | grep -E "animatori-petreceri-copii-popesti-leordeni|animatori-copii-popesti-leordeni"`);
  let sitemapLines = [];
  try {
    const sRes = await fetch(domain + '/sitemap.xml');
    if (sRes.status === 200) {
      const xml = await sRes.text();
      sitemapLines = xml.split('\n').filter(line => line.includes('animatori-petreceri-copii-popesti-leordeni') || line.includes('animatori-copii-popesti-leordeni'));
      sitemapLines.forEach(l => console.log(l.trim()));
    }
  } catch(e) {}
  console.log('');

  // 4. In-depth DOM Analysis of New Page
  console.log('--- NEW PAGE DOM ANALYSIS ---');
  if (resNew.status === 200) {
      const html = await resNew.text();
      const $ = cheerio.load(html);
      
      const canonical = $('link[rel="canonical"]').attr('href') || 'MISSING';
      const robots = $('meta[name="robots"]').attr('content') || 'MISSING';
      const h1 = $('h1').text().trim() || 'MISSING';
      
      const faqCount = $('div[itemtype="https://schema.org/FAQPage"] div[itemprop="mainEntity"]').length || $('.faq-item').length || $('details').length || $('h3.text-lg').length; // Depending on how Astro renders FAQs. Let's find FAQ questions:
      const faqActualCount = $('h3:contains("?")').length;

      const hasHubLink = $('a[href="/animatori-petreceri-copii/"]').length > 0;
      const hasPersonajeLink = $('a[href="/personaje-animatori-copii-bucuresti/"]').length > 0;
      const hasPreturiLink = $('a[href="/preturi-animatori-copii-bucuresti/"]').length > 0;
      const hasMascoteLink = $('a[href="/mascote-petreceri-copii-bucuresti/"]').length > 0;
      
      let faqSchemaValid = html.includes('https://schema.org/FAQPage') || html.includes('FAQPage');

      console.log(`HTTP: ${resNew.status}`);
      console.log(`canonical: ${canonical}`);
      console.log(`robots: ${robots}`);
      console.log(`H1: ${h1}`);
      console.log(`FAQ count: ${faqActualCount > 0 ? faqActualCount : faqCount}`);
      console.log(`FAQ schema valid: ${faqSchemaValid ? 'DA' : 'NU'}`);
      console.log(`Link to Hub: ${hasHubLink ? 'DA' : 'NU'}`);
      console.log(`Link to Personaje: ${hasPersonajeLink ? 'DA' : 'NU'}`);
      console.log(`Link to Prețuri: ${hasPreturiLink ? 'DA' : 'NU'}`);
      console.log(`Link to Mascote: ${hasMascoteLink ? 'DA' : 'NU'}`);
  }

  // 5. Canonical Cluster Re-validation
  console.log('\n--- CANONICAL CLUSTER RE-VALIDATION ---');
  const cluster = [
    '/',
    '/animatori-petreceri-copii/',
    '/animatori-petreceri-copii-sector-1/',
    '/personaje-animatori-copii-bucuresti/',
    '/preturi-animatori-copii-bucuresti/',
    '/mascote-petreceri-copii-bucuresti/'
  ];
  for (const p of cluster) {
      const cRes = await fetch(domain + p, { redirect: 'manual' });
      const status = cRes.status;
      let robots = 'MISSING';
      if (status === 200) {
          const html = await cRes.text();
          const $ = cheerio.load(html);
          robots = $('meta[name="robots"]').attr('content') || 'MISSING';
      }
      console.log(`${p} | HTTP: ${status} | robots: ${robots}`);
  }
}

run();
