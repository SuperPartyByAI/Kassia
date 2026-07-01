import fetch from 'node-fetch';
import * as cheerio from 'cheerio';
import { XMLParser } from 'fast-xml-parser';

async function run() {
  const domain = 'https://www.kassia.ro';
  const urlsToCheck = [
    '/',
    '/animatori-petreceri-copii/',
    '/animatori-petreceri-copii-sector-1/',
    '/animatori-petreceri-copii-sector-2/',
    '/animatori-petreceri-copii-sector-3/',
    '/animatori-petreceri-copii-sector-4/',
    '/animatori-petreceri-copii-sector-5/',
    '/animatori-petreceri-copii-sector-6/',
    '/preturi-animatori-copii-bucuresti/',
    '/personaje-animatori-copii-bucuresti/',
    '/mascote-petreceri-copii-bucuresti/',
    '/personaje-petreceri-copii-bucuresti/',
    '/animatori-cu-mascote-petreceri-copii-bucuresti/',
    '/pachet-animator-si-mascota-bucuresti/'
  ];

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
  } catch(e) {
    console.error('Sitemap fetch error:', e);
  }

  const results = [];

  for (const path of urlsToCheck) {
    let inSitemap = sitemapUrls.has(path) ? 'DA' : 'NU';
    if (path === '/' && sitemapUrls.has('')) inSitemap = 'DA';
    
    let status = 0;
    let canonical = 'N/A';
    let robots = 'N/A';
    
    try {
      const r = await fetch(domain + path, { redirect: 'manual' });
      status = r.status;
      
      if (status === 200) {
        const html = await r.text();
        const $ = cheerio.load(html);
        canonical = $('link[rel="canonical"]').attr('href') || 'MISSING';
        canonical = canonical.replace(domain, '');
        robots = $('meta[name="robots"]').attr('content') || 'index, follow';
      }
    } catch(e) {
      status = 'ERROR';
    }

    let verdict = 'OK';
    if (path === '/personaje-petreceri-copii-bucuresti/' || path === '/animatori-cu-mascote-petreceri-copii-bucuresti/') {
      if (inSitemap === 'DA') verdict = 'ISSUE (In Sitemap)';
    } else if (path === '/pachet-animator-si-mascota-bucuresti/') {
      verdict = 'NEEDS DECISION';
    } else {
      if (inSitemap === 'NU') verdict = 'ISSUE (Missing Sitemap)';
    }

    results.push({
      URL: path,
      HTTP: status,
      canonical: canonical,
      robots: robots,
      in_sitemap: inSitemap,
      verdict: verdict
    });
  }

  console.table(results);
}

run();
