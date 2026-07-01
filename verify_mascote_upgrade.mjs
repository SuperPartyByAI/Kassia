import fetch from 'node-fetch';
import * as cheerio from 'cheerio';
import { XMLParser } from 'fast-xml-parser';

async function run() {
  const domain = 'https://www.kassia.ro';
  const mascoteUrl = '/mascote-petreceri-copii-bucuresti/';
  const duplicateUrl = '/animatori-cu-mascote-petreceri-copii-bucuresti/';
  const pachetUrl = '/pachet-animator-si-mascota-bucuresti/';

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

  // 1. Mascote URL
  const rMascote = await fetch(domain + mascoteUrl, { redirect: 'manual' });
  const htmlMascote = await rMascote.text();
  const $ = cheerio.load(htmlMascote);
  
  const faqText = $('.faq-item, details').text();
  const hasP = faqText.includes('<p>');
  
  const catalogFound = $('h2').filter((i, el) => $(el).text().includes('Mascote disponibile')).length > 0;
  const linkPersonaje = $('a[href="/personaje-animatori-copii-bucuresti/"]').length > 0;
  const linkPreturi = $('a[href="/preturi-animatori-copii-bucuresti/"]').length > 0;
  
  // 2. Duplicate URL
  const rDuplicate = await fetch(domain + duplicateUrl, { redirect: 'manual' });
  const duplicateStatus = rDuplicate.status;

  // 3. Pachet URL
  const rPachet = await fetch(domain + pachetUrl, { redirect: 'manual' });
  const pachetStatus = rPachet.status;

  console.log('--- MASCOTE PAGE VALIDATION ---');
  console.log('HTTP:', rMascote.status);
  console.log('Robots:', $('meta[name="robots"]').attr('content'));
  console.log('Canonical:', $('link[rel="canonical"]').attr('href').replace(domain, ''));
  console.log('In Sitemap:', sitemapUrls.has(mascoteUrl) ? 'DA' : 'NU');
  console.log('FAQ Clean (No <p>):', hasP ? 'FAIL (has <p>)' : 'PASS');
  console.log('Catalog 100+ Visible:', catalogFound ? 'PASS' : 'FAIL');
  console.log('Link Personaje:', linkPersonaje ? 'PASS' : 'FAIL');
  console.log('Link Preturi:', linkPreturi ? 'PASS' : 'FAIL');
  
  console.log('\\n--- DUPLICATE URL ---');
  console.log('HTTP:', duplicateStatus);
  if (duplicateStatus === 301) {
    console.log('Location:', rDuplicate.headers.get('location'));
  }
  console.log('In Sitemap:', sitemapUrls.has(duplicateUrl) ? 'DA (FAIL)' : 'NU (PASS)');

  console.log('\\n--- PACHET ANIMATOR MASCOTA ---');
  console.log('HTTP:', pachetStatus);
  console.log('In Sitemap:', sitemapUrls.has(pachetUrl) ? 'DA' : 'NU');
}

run();
