import fetch from 'node-fetch';
import * as cheerio from 'cheerio';

async function check() {
  const res = await fetch('https://www.kassia.ro/personaje-animatori-copii-bucuresti/');
  const html = await res.text();
  const $ = cheerio.load(html);

  console.log('HTTP Status:', res.status);
  
  console.log('--- H2 Headings ---');
  $('h2').each((i, el) => console.log(' - ' + $(el).text()));
  
  console.log('--- H3 Headings ---');
  $('h3').each((i, el) => console.log(' - ' + $(el).text()));
  
  const listItems = $('ul li').length;
  console.log('Total list items (catalog items):', listItems);
  
  const faqsWithP = $('.faq-answer p').length;
  console.log('FAQ answers containing <p> tags:', faqsWithP);
  
  const faqText = $('.faq-answer').first().text();
  console.log('First FAQ text:', faqText.substring(0, 100));
  
  const schemas = $('script[type="application/ld+json"]').toArray().map(el => $(el).html());
  const hasFaq = schemas.some(s => s.includes('FAQPage'));
  console.log('Has FAQPage Schema:', hasFaq);
}

check();
