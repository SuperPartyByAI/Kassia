import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

async function audit() {
  const r = await fetch('https://www.kassia.ro/preturi-animatori-copii-bucuresti/');
  const html = await r.text();
  const $ = cheerio.load(html);

  const title = $('title').text();
  const h1 = $('h1').text();
  const metaDesc = $('meta[name="description"]').attr('content');
  
  const h2s = [];
  $('h2').each((i, el) => h2s.push($(el).text()));
  
  const h3s = [];
  $('h3').each((i, el) => h3s.push($(el).text()));
  
  const tables = $('table').length;
  
  const text = $('body').text();
  const hasTransport = text.includes('transport') || text.includes('București') || text.includes('Ilfov');
  const hasPinata = text.includes('pinata') || text.includes('piñata');
  const hasBalloon = text.includes('Balloon Exploder');
  
  const faqLength = $('.faq-item').length;
  const faqSchema = $('script[type="application/ld+json"]').filter((i, el) => $(el).html().includes('FAQPage')).length > 0;
  
  const linkPersonaje = $('a[href="/personaje-animatori-copii-bucuresti/"]').length;
  const linkHub = $('a[href="/animatori-petreceri-copii/"]').length;
  
  const ctas = $('a.btn-primary').length;
  const btnHeader = $('header a:contains("Prețuri animatori")').length || $('a.btn-primary').filter((i, el) => $(el).text().toLowerCase().includes('prețuri')).length;

  console.log('--- Kassia Audit ---');
  console.log('Title:', title);
  console.log('H1:', h1);
  console.log('Meta:', metaDesc);
  console.log('H2s:', h2s);
  console.log('H3s:', h3s);
  console.log('Tables:', tables);
  console.log('Transport (Buc/Ilfov):', hasTransport);
  console.log('Pinata:', hasPinata);
  console.log('Balloon Exploder:', hasBalloon);
  console.log('FAQ Items:', faqLength);
  console.log('FAQ Schema:', faqSchema);
  console.log('Link Personaje:', linkPersonaje);
  console.log('Link Hub:', linkHub);
  console.log('CTAs (.btn-primary):', ctas);
  console.log('Btn Header / Preturi:', btnHeader);
}

audit();
