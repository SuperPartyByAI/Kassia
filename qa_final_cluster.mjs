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

  const pagesToCheck = [
    { url: '/', label: 'Homepage', reqLinkPers: false, reqLinkPret: false },
    { url: '/animatori-petreceri-copii/', label: 'Hub Animatori', reqLinkPers: true, reqLinkPret: true },
    { url: '/personaje-animatori-copii-bucuresti/', label: 'Personaje', reqLinkPers: false, reqLinkPret: true },
    { url: '/preturi-animatori-copii-bucuresti/', label: 'Preturi', reqLinkPers: true, reqLinkPret: false },
    { url: '/mascote-petreceri-copii-bucuresti/', label: 'Mascote', reqLinkPers: true, reqLinkPret: true },
    { url: '/animatori-petreceri-copii-sector-1/', label: 'Sector 1', reqLinkPers: true, reqLinkPret: true },
    { url: '/animatori-petreceri-copii-sector-2/', label: 'Sector 2', reqLinkPers: true, reqLinkPret: true },
    { url: '/animatori-petreceri-copii-sector-3/', label: 'Sector 3', reqLinkPers: true, reqLinkPret: true },
    { url: '/animatori-petreceri-copii-sector-4/', label: 'Sector 4', reqLinkPers: true, reqLinkPret: true },
    { url: '/animatori-petreceri-copii-sector-5/', label: 'Sector 5', reqLinkPers: true, reqLinkPret: true },
    { url: '/animatori-petreceri-copii-sector-6/', label: 'Sector 6', reqLinkPers: true, reqLinkPret: true }
  ];

  const redirectsToCheck = [
    { url: '/personaje-petreceri-copii-bucuresti/', target: '/personaje-animatori-copii-bucuresti/' },
    { url: '/animatori-cu-mascote-petreceri-copii-bucuresti/', target: '/mascote-petreceri-copii-bucuresti/' },
    { url: '/pachet-animator-si-mascota-bucuresti/', target: '/preturi-animatori-copii-bucuresti/' }
  ];

  let results = [];

  for (let p of pagesToCheck) {
    let res = await fetch(domain + p.url, { redirect: 'manual' });
    let status = res.status;
    let html = await res.text();
    let $ = cheerio.load(html);

    let canonical = $('link[rel="canonical"]').attr('href') || '';
    canonical = canonical.replace(domain, '');
    let robots = $('meta[name="robots"]').attr('content') || '';
    let inSitemap = sitemapUrls.has(p.url) ? 'DA' : 'NU';
    let hasLinkPers = $('a[href="/personaje-animatori-copii-bucuresti/"]').length > 0;
    let hasLinkPret = $('a[href="/preturi-animatori-copii-bucuresti/"]').length > 0;

    let verdict = (status === 200 && canonical === p.url && robots.includes('index') && inSitemap === 'DA') ? 'PASS' : 'FAIL';
    
    // Checks for specific pages
    if (p.url === '/mascote-petreceri-copii-bucuresti/') {
      const hasP = $('.faq-item, details').text().includes('<p>');
      const catalogFound = $('h2').filter((i, el) => $(el).text().includes('Mascote disponibile')).length > 0;
      if (hasP || !catalogFound) verdict = 'FAIL (Mascote Checks)';
    }

    if (p.url === '/personaje-animatori-copii-bucuresti/') {
      const catalogFound = html.includes('catalog'); // Simplistic
    }

    results.push({
      url: p.url,
      http: status,
      canonical: canonical === p.url ? 'self' : canonical,
      robots: robots,
      sitemap: inSitemap,
      links: `Pers:${hasLinkPers} Pret:${hasLinkPret}`,
      redirectStatus: 'N/A',
      verdict: verdict
    });
  }

  for (let r of redirectsToCheck) {
    let res = await fetch(domain + r.url, { redirect: 'manual' });
    let status = res.status;
    let loc = res.headers.get('location');
    let inSitemap = sitemapUrls.has(r.url) ? 'DA' : 'NU';
    let verdict = (status === 301 && loc === r.target && inSitemap === 'NU') ? 'PASS' : 'FAIL';

    results.push({
      url: r.url,
      http: status,
      canonical: 'N/A',
      robots: 'N/A',
      sitemap: inSitemap,
      links: 'N/A',
      redirectStatus: `${status} -> ${loc}`,
      verdict: verdict
    });
  }

  // Formatting output
  console.log('URL | HTTP | canonical | robots | sitemap | internal links | redirect status | verdict');
  results.forEach(r => {
    console.log(`${r.url} | ${r.http} | ${r.canonical} | ${r.robots} | ${r.sitemap} | ${r.links} | ${r.redirectStatus} | ${r.verdict}`);
  });

}

run();
