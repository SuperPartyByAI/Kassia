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

  const bucketA_samples = [
    '/animatori-petrecere-5-ani-bucuresti/',
    '/animatori-copii-sector-6/',
    '/ateliere-creative-copii-bucuresti/',
    '/animatori-cu-concursuri-copii-bucuresti/',
    '/animator-copii-1-ora-bucuresti/',
    '/animatori-pentru-copii-4-10-ani-bucuresti/',
    '/animatori-petrecere-baieti-bucuresti/',
    '/animatori-petrecere-copii-iarna-bucuresti/',
    '/animatori-copii-sector-1/',
    '/animatori-copii-herastrau/'
  ];

  console.log('--- 10 BUCKET A EXAMPLES ---');
  console.log('URL | HTTP | robots | in_sitemap | verdict');
  
  for (const path of bucketA_samples) {
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
    '/mascote-petreceri-copii-bucuresti/'
  ];

  console.log('\\n--- CANONICAL PAGES CHECK ---');
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

  const redirectPages = [
    { old: '/personaje-petreceri-copii-bucuresti/', target: '/personaje-animatori-copii-bucuresti/' },
    { old: '/animatori-cu-mascote-petreceri-copii-bucuresti/', target: '/mascote-petreceri-copii-bucuresti/' },
    { old: '/pachet-animator-si-mascota-bucuresti/', target: '/preturi-animatori-copii-bucuresti/' }
  ];

  console.log('\\n--- REDIRECTS CHECK ---');
  for (const r of redirectPages) {
    const res = await fetch(domain + r.old, { redirect: 'manual' });
    const status = res.status;
    const loc = res.headers.get('location');
    let verdict = (status === 301 && loc === r.target) ? 'PASS' : 'FAIL';
    console.log(`${r.old} -> ${status} Location: ${loc} | ${verdict}`);
  }
}

run();
