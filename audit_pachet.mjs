import fetch from 'node-fetch';
import * as cheerio from 'cheerio';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  const domain = 'https://www.kassia.ro';
  const urlPath = '/pachet-animator-si-mascota-bucuresti/';
  const fullUrl = domain + urlPath;

  console.log('--- FETCHING URL ---');
  let status = 0;
  let canonical = '';
  let robots = '';
  let title = '';
  let metaDesc = '';
  let h1 = '';
  let h2s = [];
  let h3s = [];
  let faqCount = 0;
  let hasFaqSchema = false;
  let hasPrices = false;
  let text = '';
  
  try {
    const res = await fetch(fullUrl);
    status = res.status;
    if (status === 200) {
      const html = await res.text();
      const $ = cheerio.load(html);
      
      canonical = $('link[rel="canonical"]').attr('href') || 'MISSING';
      robots = $('meta[name="robots"]').attr('content') || 'MISSING';
      title = $('title').text();
      metaDesc = $('meta[name="description"]').attr('content') || '';
      h1 = $('h1').text();
      $('h2').each((i, el) => h2s.push($(el).text()));
      $('h3').each((i, el) => h3s.push($(el).text()));
      faqCount = $('.faq-item, details').length;
      hasFaqSchema = $('script[type="application/ld+json"]').filter((i, el) => $(el).html().includes('FAQPage')).length > 0;
      text = $('body').text();
      
      // Check for prices
      if (text.match(/lei|RON|pret|tarif/i)) hasPrices = true;
    }
  } catch(e) {
    console.error('Fetch error:', e.message);
  }

  console.log('HTTP:', status);
  console.log('Canonical:', canonical);
  console.log('Robots:', robots);
  console.log('Title:', title);
  console.log('Meta Desc:', metaDesc);
  console.log('H1:', h1);
  console.log('H2s:', h2s);
  console.log('H3s:', h3s);
  console.log('FAQ Count:', faqCount);
  console.log('FAQ Schema:', hasFaqSchema);
  console.log('Has Prices in Text:', hasPrices);

  console.log('\\n--- CHECKING INTERNAL BACKLINKS ---');
  const { data: page } = await supabase.from('kassia_pages').select('id').eq('path', urlPath).single();
  if (page) {
    const { data: backlinks } = await supabase.from('kassia_internal_links').select('source_page:kassia_pages!source_page_id(path)').eq('target_page_id', page.id);
    console.log('Internal Backlinks count:', backlinks ? backlinks.length : 0);
    if (backlinks) {
        backlinks.forEach(b => console.log(' - From:', b.source_page.path));
    }
  } else {
    console.log('Page not found in DB.');
  }

  console.log('\\n--- CONTENT ANALYSIS ---');
  const riskyWords = ['pachet', 'oferta', 'perfect', 'ideal', 'garantat', 'premium', 'excelent', 'impecabil', 'spectaculos', 'gratuit'];
  const foundRisky = riskyWords.filter(w => text.toLowerCase().includes(w));
  console.log('Risky words found:', foundRisky);

}

run();
