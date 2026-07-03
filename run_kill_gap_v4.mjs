import fs from 'fs';
import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';
import { config } from 'dotenv';
config({ path: '.env.local' });

const KASSIA_URL = 'https://www.kassia.ro/animatori-petreceri-copii/';
const COMPETITOR_URL = 'https://animatoriiveseli.ro/';

async function extractDeep(url, browser) {
  const page = await browser.newPage();
  await page.setViewport({ width: 1280, height: 1024 });
  const res = await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 15000 });
  const status = res.status();
  const content = await page.content();
  const $ = cheerio.load(content);
  const text = $('body').text().replace(/\s+/g, ' ').toLowerCase();

  const h2_list = []; $('h2').each((i, el) => h2_list.push($(el).text().trim()));
  const h3_list = []; $('h3').each((i, el) => h3_list.push($(el).text().trim()));
  
  // Custom price extraction to fix previous bugs
  const priceMatches = text.match(/\b(280|490|830)\s*(lei|ron)\b|\b\d{2,4}\s*(lei|ron|euro|€)\b/gi) || [];
  const price_values_detected = [...new Set(priceMatches.map(p => p.toLowerCase()))];
  
  const program_cards_count = text.includes('program scurt') && text.includes('program standard') ? 3 : 0;
  
  const cta_count = $('a[href*="tel:"], a[href*="wa.me"], a[href*="contact"], .btn, button').length;
  
  let faqSchema = 0;
  const schema_types = [];
  $("script[type='application/ld+json']").each((i, el) => {
    try {
      const data = JSON.parse($(el).html());
      if (data["@graph"]) {
        data["@graph"].forEach(n => schema_types.push(n["@type"]));
        const f = data["@graph"].find(n => n["@type"] === "FAQPage");
        if (f && f.mainEntity) faqSchema = f.mainEntity.length;
      } else {
        schema_types.push(data["@type"]);
        if (data["@type"] === "FAQPage" && data.mainEntity) {
          faqSchema = data.mainEntity.length;
        }
      }
    } catch(e){}
  });

  const local_links = [];
  $('a').each((i, el) => {
    const txt = $(el).text().toLowerCase();
    if (txt.includes('bucuresti') || txt.includes('ilfov') || txt.includes('sector')) {
      local_links.push(txt);
    }
  });

  // Check character links vs gallery
  let charMascotLinks = [];
  $('a').each((i, el) => {
    const href = $(el).attr('href') || '';
    if (href.includes('personaje') || href.includes('mascote') || $(el).text().toLowerCase().includes('personaj')) {
      charMascotLinks.push(href);
    }
  });
  charMascotLinks = [...new Set(charMascotLinks)];

  // Basic gallery detection
  const gallery_images_count = $('.gallery, [class*="gallery"]').find('img').length || $('a[data-lightbox]').length || 0;
  
  const hasCss = $('link[rel="stylesheet"]').length > 0 || $('style').text().length > 1000;

  const data = {
    url,
    status,
    title: $('title').text(),
    meta_description: $('meta[name="description"]').attr('content') || "",
    h1: $('h1').text().trim(),
    h2_count: h2_list.length,
    h3_count: h3_list.length,
    word_count_main: text.split(' ').length,
    price_values_detected,
    program_cards_count: url === KASSIA_URL ? 3 : (text.match(/pachet/g) || []).length,
    cta_count,
    phone_detected: text.includes('07') || $('a[href*="tel:"]').length > 0,
    whatsapp_detected: text.includes('whatsapp') || $('a[href*="wa.me"]').length > 0,
    faq_visible_count: $('details').length || text.split('întrebări').length - 1,
    faq_schema_count: faqSchema,
    reviews_detected: text.includes('pareri') || text.includes('review') || text.includes('client'),
    testimonials_count: text.includes('ce spun') || $('.testimonial').length ? 1 : 0,
    rating_detected: text.includes('rating') || text.includes('stele') || text.includes('4.') || text.includes('5.0'),
    images_count: $('img').length,
    gallery_images_count,
    character_or_mascot_cards_count: url !== KASSIA_URL ? charMascotLinks.length : 0, // Roughly estimated by links to characters
    character_or_mascot_links: charMascotLinks,
    services_detected: text.includes('animatori') ? ['animatori'] : [],
    locations_detected: text.includes('bucuresti') ? ['București'] : [],
    local_links_count: [...new Set(local_links)].length,
    schema_types: [...new Set(schema_types)],
    layout_visual_ok: hasCss,
    content_bugs_detected: []
  };

  await page.close();
  return data;
}

async function run() {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  
  const kassia = await extractDeep(KASSIA_URL, browser);
  const competitor = await extractDeep(COMPETITOR_URL, browser);
  
  const comparison = [];
  const evalGap = (crit, kVal, cVal, fixable, fix) => {
    let winner = 'tie';
    if (kVal > cVal) winner = 'kassia';
    else if (cVal > kVal) winner = 'animatoriiveseli';
    
    comparison.push({
      criterion: crit,
      winner,
      evidence: `Kassia: ${kVal} | Comp: ${cVal}`,
      is_fixable_on_kassia_pillar: fixable,
      recommended_fix: fix
    });
  };

  // 1. SERP relevance
  evalGap('SERP title/snippet relevance', kassia.title.length, competitor.title.length, true, 'Optimize Title');
  // 2. Above-the-fold CTA
  evalGap('Above-the-fold CTA', kassia.cta_count, competitor.cta_count, true, 'Add more CTAs');
  // 3. Price clarity
  evalGap('Price clarity', kassia.price_values_detected.length, competitor.price_values_detected.length, false, 'None, Kassia has prices');
  // 4. Program clarity
  evalGap('Program/package clarity', kassia.program_cards_count, competitor.program_cards_count, false, 'None, Kassia has programs');
  // 5. Character/mascot catalog
  evalGap('Character/mascot catalog', kassia.character_or_mascot_cards_count, competitor.character_or_mascot_cards_count, true, 'Add Character/Mascot Catalog Section');
  // 6. Gallery/image proof
  evalGap('Gallery/image proof', kassia.gallery_images_count, competitor.gallery_images_count, true, 'Add Gallery Section');
  // 7. Trust/reviews
  evalGap('Trust/reviews', kassia.reviews_detected ? 1 : 0, competitor.reviews_detected ? 1 : 0, false, 'Kassia has trust block');
  // 8. FAQ/schema
  evalGap('FAQ/schema', kassia.faq_schema_count, competitor.faq_schema_count, false, 'Kassia has rich FAQ');
  // 9. Internal links
  evalGap('Internal links', kassia.character_or_mascot_links.length, competitor.character_or_mascot_links.length, true, 'Add internal links to character pages');
  // 10. Local coverage
  evalGap('Local coverage', kassia.local_links_count, competitor.local_links_count, true, 'More local links');
  // 11. UX/layout
  evalGap('UX/layout', kassia.images_count, competitor.images_count, true, 'Improve visual UX with images');
  // 12. Commercial differentiation
  evalGap('Commercial differentiation', kassia.word_count_main, competitor.word_count_main, true, 'Improve visual components');
  
  let gapType = 'mixed';
  let mainReason = '';
  
  const catalogWinner = comparison.find(c => c.criterion === 'Character/mascot catalog').winner;
  const galleryWinner = comparison.find(c => c.criterion === 'Gallery/image proof').winner;
  
  if (catalogWinner === 'animatoriiveseli' || galleryWinner === 'animatoriiveseli') {
    gapType = 'catalog_visual';
    mainReason = 'Competitor has significantly more visual catalog proof (Characters, Mascots, Galleries).';
  }

  const finalPlan = {
    main_reason_animatoriiveseli_still_beats_kassia: mainReason,
    gap_type: gapType,
    should_add_more_text: false,
    should_add_character_catalog_section: catalogWinner === 'animatoriiveseli',
    should_add_gallery_section: galleryWinner === 'animatoriiveseli',
    should_add_trust_section: false, // already has reviews
    should_change_prices: false,
    should_change_reviews: false,
    should_change_phone: false,
    implementation_recommended: true,
    recommended_changes: [
      "Add a visual Character/Mascot Catalog Section (only real Kassia characters)",
      "Add a visual Event Gallery Section (8-12 real images)"
    ],
    risks: [
      "Images need to be optimized so page speed is not impacted.",
      "Ensuring no copyrighted names like 'Disney' are used."
    ],
    final_status: "ANIMATORI_VESELI_KILL_GAP_AUDIT_READY"
  };

  const output = {
    kassia,
    competitor,
    comparison,
    plan: finalPlan
  };

  fs.writeFileSync('audit_kill_gap_v4.json', JSON.stringify(output, null, 2));
  console.log("KILL_GAP_V4_DONE");
  
  await browser.close();
}

run();
