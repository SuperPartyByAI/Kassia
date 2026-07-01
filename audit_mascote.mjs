import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

async function audit() {
  const targetUrl = 'https://www.kassia.ro/mascote-petreceri-copii-bucuresti/';
  const r = await fetch(targetUrl);
  const status = r.status;
  const html = await r.text();
  const $ = cheerio.load(html);

  const title = $('title').text();
  const h1 = $('h1').text();
  const metaDesc = $('meta[name="description"]').attr('content');
  const canonical = $('link[rel="canonical"]').attr('href');
  const robots = $('meta[name="robots"]').attr('content') || 'default';
  
  const h2s = [];
  $('h2').each((i, el) => h2s.push($(el).text()));
  
  const h3s = [];
  $('h3').each((i, el) => h3s.push($(el).text()));
  
  const text = $('body').text();
  
  const faqLength = $('.faq-item, details').length;
  const faqSchema = $('script[type="application/ld+json"]').filter((i, el) => $(el).html().includes('FAQPage')).length > 0;
  
  const linkPersonaje = $('a[href="/personaje-animatori-copii-bucuresti/"]').length;
  const linkPreturi = $('a[href="/preturi-animatori-copii-bucuresti/"]').length;
  const linkHub = $('a[href="/animatori-petreceri-copii/"]').length;

  console.log('--- Mascote Audit ---');
  console.log('HTTP:', status);
  console.log('Title:', title);
  console.log('H1:', h1);
  console.log('Meta:', metaDesc);
  console.log('Canonical:', canonical);
  console.log('Robots:', robots);
  console.log('H2s:', h2s);
  console.log('H3s:', h3s);
  console.log('FAQ Items:', faqLength);
  console.log('FAQ Schema:', faqSchema);
  console.log('Link Personaje:', linkPersonaje);
  console.log('Link Preturi:', linkPreturi);
  console.log('Link Hub:', linkHub);
}

audit();
