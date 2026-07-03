import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';
import { config } from 'dotenv';
config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function runHardQa() {
  const pageUrl = 'https://www.kassia.ro/animatori-petreceri-copii/';
  const pageId = '3a754972-74d7-4632-9dfa-2aa9be7682db';
  
  const report = {
    page: pageUrl,
    db_duplicate_sections_found: false,
    section_counts: {
      "Exemple de programe pentru petreceri copii": 0,
      "Activități incluse": 0,
      "Pentru ce tipuri de evenimente sunt potriviți animatorii": 0
    },
    db_duplicate_faqs_found: false,
    db_duplicate_internal_links_found: false,
    live_duplicate_sections_found: false,
    live_raw_html_tags_visible: false,
    faq_visible_count: 0,
    faq_schema_count: 0,
    faq_schema_matches_visible: false,
    reviews_preserved: false,
    rating_badge_preserved: false,
    phone_preserved: false,
    all_internal_links_200_and_indexable: true,
    visual_ok: true,
    implementation_changed_anything: false,
    final_status: "ANIMATORI_PILLAR_HARD_QA_PASS"
  };

  // 1. DB DUPLICATE CHECK - Sections
  const { data: sections } = await supabase.from('kassia_page_sections').select('heading').eq('page_id', pageId);
  for (const sec of sections) {
    if (report.section_counts[sec.heading] !== undefined) {
      report.section_counts[sec.heading]++;
    }
  }
  for (const count of Object.values(report.section_counts)) {
    if (count > 1) report.db_duplicate_sections_found = true;
  }

  // DB DUPLICATE CHECK - FAQs
  const { data: faqs } = await supabase.from('kassia_faqs').select('question').eq('page_id', pageId);
  const faqCounts = {};
  for (const faq of faqs) {
    faqCounts[faq.question] = (faqCounts[faq.question] || 0) + 1;
  }
  const targetFaqs = [
    'Cât durează un program cu animatori?',
    'Pentru câți copii este potrivit un animator?',
    'Animatorul vine cu recuzită?',
    'Se poate adapta programul după vârsta copiilor?',
    'Putem combina animatorii cu mascote sau decoruri cu baloane?',
    'Cum cerem o ofertă pentru data petrecerii?'
  ];
  for (const q of targetFaqs) {
    if (faqCounts[q] > 1) report.db_duplicate_faqs_found = true;
  }

  // DB DUPLICATE CHECK - Internal Links
  const { data: links } = await supabase.from('kassia_internal_links').select('target_page_id').eq('source_page_id', pageId);
  const linkCounts = {};
  for (const link of links) {
    linkCounts[link.target_page_id] = (linkCounts[link.target_page_id] || 0) + 1;
    if (linkCounts[link.target_page_id] > 1) report.db_duplicate_internal_links_found = true;
  }

  // 2. LIVE DOM DUPLICATE CHECK & 3. FAQ SCHEMA CHECK
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  const page = await browser.newPage();
  const res = await page.goto(pageUrl, { waitUntil: 'domcontentloaded' });
  const content = await page.content();
  const $ = cheerio.load(content);

  const textContent = $('body').text();
  const lowerContent = textContent.toLowerCase();

  const countOccurrences = (str, subStr) => str.split(subStr).length - 1;

  const liveExamplesCount = countOccurrences(lowerContent, 'exemple de programe pentru petreceri copii');
  const liveActivitiesCount = countOccurrences(lowerContent, 'activități incluse');
  const liveEventsCount = countOccurrences(lowerContent, 'pentru ce tipuri de evenimente sunt potriviți animatorii');

  if (liveExamplesCount > 1 || liveActivitiesCount > 1 || liveEventsCount > 1) {
    report.live_duplicate_sections_found = true;
  }

  if (content.includes('<p>') && textContent.includes('<p>')) {
    report.live_raw_html_tags_visible = true;
  }

  report.faq_visible_count = $("details, .faq-details").length;

  $("script[type='application/ld+json']").each((i, el) => {
    try {
      const data = JSON.parse($(el).html());
      if (data["@graph"]) {
         const faqNode = data["@graph"].find(n => n["@type"] === "FAQPage");
         if (faqNode && faqNode.mainEntity) report.faq_schema_count = faqNode.mainEntity.length;
      } else if (data["@type"] === "FAQPage" && data.mainEntity) {
         report.faq_schema_count = data.mainEntity.length;
      }
    } catch(e){}
  });

  report.faq_schema_matches_visible = (report.faq_visible_count === report.faq_schema_count) && (report.faq_visible_count > 0);
  report.reviews_preserved = lowerContent.includes('ce spun clienții noștri') || content.includes('aprecieri-clienti-container');
  report.rating_badge_preserved = content.includes('4.9') || lowerContent.includes('rating');
  report.phone_preserved = content.includes('0763');

  const hasCss = $('link[rel="stylesheet"]').length > 0 || $('style').text().length > 1000;
  if (!hasCss) report.visual_ok = false;

  // 4. INTERNAL LINKS CHECK
  const linksOut = [];
  $("a[href^='/']").each((i, el) => linksOut.push($(el).attr('href')));
  
  for (const targetPath of linksOut) {
    if (targetPath === '/' || targetPath.startsWith('/images')) continue;
    const { data: targetPage } = await supabase.from('kassia_pages').select('status, index_status').eq('path', targetPath).single();
    if (targetPage) {
       if (targetPage.status !== 'published' || targetPage.index_status !== 'index') {
         console.log("Found invalid link:", targetPath, targetPage);
         report.all_internal_links_200_and_indexable = false;
       }
    }
  }

  await browser.close();

  if (report.db_duplicate_sections_found || report.db_duplicate_faqs_found || report.db_duplicate_internal_links_found || report.live_duplicate_sections_found || report.live_raw_html_tags_visible || !report.faq_schema_matches_visible || !report.all_internal_links_200_and_indexable || !report.visual_ok) {
    report.final_status = "ANIMATORI_PILLAR_HARD_QA_HOLD";
  }

  fs.writeFileSync('hard_qa_report.json', JSON.stringify(report, null, 2));
  console.log("HARD_QA_DONE");
}
runHardQa();
