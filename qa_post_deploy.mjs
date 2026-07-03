import fs from 'fs';
import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';

const urls = [
  'https://www.kassia.ro/',
  'https://www.kassia.ro/animatori-petreceri-copii/',
  'https://www.kassia.ro/animatori-petreceri-copii-bucuresti/',
  'https://www.kassia.ro/animatori-petreceri-copii-floreasca/'
];

async function runQA() {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  const results = {};
  let pillarDetails = {};

  for (const url of urls) {
    const page = await browser.newPage();
    await page.setViewport({ width: 1280, height: 1024 });
    const res = await page.goto(url, { waitUntil: 'domcontentloaded' });
    
    // Quick layout check
    const content = await page.content();
    const $ = cheerio.load(content);
    
    const hasCss = $('link[rel="stylesheet"]').length > 0 || $('style').text().length > 1000;
    const hasHeader = $('header').length > 0 || $('.header').length > 0;
    const hasCta = $('a[href*="tel:"], a[href*="wa.me"], .btn-primary').length > 0;
    const textHasRawHtml = content.includes('<p>') && $('body').text().includes('<p>');
    
    const visualOk = hasCss && hasHeader && hasCta && !textHasRawHtml;
    const basename = url.split('/').filter(Boolean).pop() || 'homepage';

    results[basename] = visualOk;

    if (url.includes('animatori-petreceri-copii') && !url.includes('bucuresti') && !url.includes('floreasca')) {
      // Pillar specifics
      let faqSchemaCount = 0;
      $("script[type='application/ld+json']").each((i, el) => {
        try {
          const data = JSON.parse($(el).html());
          if (data["@graph"]) {
             const faqNode = data["@graph"].find(n => n["@type"] === "FAQPage");
             if (faqNode && faqNode.mainEntity) faqSchemaCount = faqNode.mainEntity.length;
          } else if (data["@type"] === "FAQPage" && data.mainEntity) {
             faqSchemaCount += data.mainEntity.length;
          }
        } catch(e){}
      });

      const faqCount = $("details, .faq-details").length;
      const canonical = $("link[rel='canonical']").attr("href");
      const robots = $("meta[name='robots']").attr("content");
      const hasReviews = content.toLowerCase().includes('ce spun clienții noștri') || content.includes('aprecieri-clienti-container');
      const hasPhone = content.includes('0763');
      const hasExamples = content.toLowerCase().includes('exemple de programe');
      
      let internalLinksOk = true;
      const linksOut = [];
      $("a[href^='/']").each((i, el) => linksOut.push($(el).attr('href')));
      const hasBucurestiLink = linksOut.includes('/animatori-petreceri-copii-bucuresti/');
      const hasFloreascaLink = linksOut.includes('/animatori-petreceri-copii-floreasca/');
      
      pillarDetails = {
        status: res.status(),
        canonical_self: canonical === 'https://www.kassia.ro/animatori-petreceri-copii/',
        indexable: robots && robots.includes('index'),
        faq_visible: faqCount,
        faq_schema: faqSchemaCount,
        faq_match: faqCount === faqSchemaCount,
        has_examples: hasExamples,
        has_reviews: hasReviews,
        has_phone: hasPhone,
        has_floreasca_link: hasFloreascaLink,
        no_p_tag_visible: !textHasRawHtml
      };
    }
    
    await page.close();
  }

  await browser.close();
  
  fs.writeFileSync('qa_results_final.json', JSON.stringify({ results, pillarDetails }, null, 2));
  console.log("QA_DONE_FINAL");
}

runQA();
