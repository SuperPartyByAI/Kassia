import fetch from 'node-fetch';
import * as cheerio from 'cheerio';
import { XMLParser } from 'fast-xml-parser';

async function run() {
  const domain = 'https://www.kassia.ro';
  
  // Load sitemap
  let sitemapUrls = new Set();
  try {
    const res = await fetch(domain + '/sitemap.xml');
    if (res.status === 200) {
      const xml = await res.text();
      const parser = new XMLParser();
      const obj = parser.parse(xml);
      if (obj.urlset && obj.urlset.url) {
        const urls = Array.isArray(obj.urlset.url) ? obj.urlset.url : [obj.urlset.url];
        urls.forEach(u => {
          let l = u.loc.replace(domain, '');
          if (!l.startsWith('/')) l = '/' + l;
          sitemapUrls.add(l);
        });
      }
    }
  } catch(e) {}

  const bucketB_samples = [
    '/animatori-copii-popesti-leordeni/',
    '/animatori-copii-drumul-taberei/',
    '/animatori-copii-berceni-ilfov/',
    '/animatori-copii-titan/',
    '/animatori-copii-crangasi/',
    '/animatori-copii-pipera-bucuresti/',
    '/animatori-copii-voluntari/',
    '/animatori-copii-bragadiru/',
    '/animatori-copii-otopeni/',
    '/animatori-copii-chiajna/'
  ];

  console.log('--- 10 BUCKET B EXAMPLES ---');
  console.log('URL | HTTP | robots | in_sitemap | verdict');
  
  for (const path of bucketB_samples) {
    const url = domain + path;
    const res = await fetch(url, { redirect: 'manual' });
    const status = res.status;
    let robots = 'MISSING';
    if (status === 200) {
        const html = await res.text();
        const $ = cheerio.load(html);
        robots = $('meta[name="robots"]').attr('content') || 'MISSING';
    }
    const inSitemap = sitemapUrls.has(path) ? 'DA' : 'NU';
    let verdict = (status === 200 && robots.includes('noindex') && inSitemap === 'NU') ? 'PASS' : 'FAIL';
    console.log(`${path} | ${status} | ${robots} | ${inSitemap} | ${verdict}`);
  }

  const canonicalPages = [
    '/',
    '/animatori-petreceri-copii/',
    '/personaje-animatori-copii-bucuresti/',
    '/preturi-animatori-copii-bucuresti/',
    '/mascote-petreceri-copii-bucuresti/',
    '/animatori-petreceri-copii-sector-1/',
    '/animatori-petreceri-copii-sector-2/',
    '/animatori-petreceri-copii-sector-3/',
    '/animatori-petreceri-copii-sector-4/',
    '/animatori-petreceri-copii-sector-5/',
    '/animatori-petreceri-copii-sector-6/'
  ];

  console.log('\n--- CANONICAL PAGES CHECK ---');
  for (const path of canonicalPages) {
    const url = domain + path;
    const res = await fetch(url, { redirect: 'manual' });
    const status = res.status;
    let robots = 'MISSING';
    if (status === 200) {
        const html = await res.text();
        const $ = cheerio.load(html);
        robots = $('meta[name="robots"]').attr('content') || 'MISSING';
    }
    const inSitemap = sitemapUrls.has(path) ? 'DA' : 'NU';
    let verdict = (status === 200 && robots.includes('index') && inSitemap === 'DA') ? 'PASS' : 'FAIL';
    console.log(`${path} | ${status} | ${robots} | ${inSitemap} | ${verdict}`);
  }
}

run();
