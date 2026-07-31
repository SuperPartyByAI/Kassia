import fs from 'fs';
import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';

const SERPER_KEY = '425bcf325cd2645cb01db5dd65f54660950e794b';

const KWs_HOME = [
  "organizare petreceri copii București",
  "petreceri copii București",
  "animatori copii București",
  "animatori petreceri copii București",
  "mascote petreceri copii București",
  "decor baloane București",
  "aranjamente baloane București",
  "petreceri copii Ilfov",
  "animatori copii Ilfov",
  "decor baloane Ilfov"
];

const KWs_FLOREASCA = [
  "animatori petreceri copii Floreasca",
  "animatori copii Floreasca",
  "petreceri copii Floreasca"
];

const ALL_KWs = [...KWs_HOME, ...KWs_FLOREASCA];

async function fetchSerp(kw) {
  try {
    const res = await fetch("https://google.serper.dev/search", {
      method: "POST",
      headers: {
        "X-API-KEY": SERPER_KEY,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ q: kw, gl: "ro", hl: "ro", num: 10 })
    });
    const data = await res.json();
    return data.organic || [];
  } catch(e) {
    console.error(`Error SERP ${kw}:`, e.message);
    return [];
  }
}

function wordCount(text) {
  return text.split(/\s+/).filter(w => w.length > 1).length;
}

function hasKeyword(text, words) {
  const t = text.toLowerCase();
  return words.some(w => t.includes(w));
}

async function scrapeUrl(page, url) {
  try {
    await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 15000 });
    const content = await page.content();
    const $ = cheerio.load(content);
    
    $("script, style, noscript, iframe").remove();
    
    const title = $("title").text().trim();
    const meta_description = $("meta[name='description']").attr("content") || "";
    const h1 = $("h1").first().text().trim();
    const h2_list = [];
    $("h2").each((i, el) => { h2_list.push($(el).text().trim()); });
    
    const bodyText = $("body").text();
    const wc = wordCount(bodyText);
    
    const pricing_detected = hasKeyword(bodyText, ["preț", "preturi", "tarif", "tarife", "ron", "lei", "oferta"]);
    const packages_detected = hasKeyword(bodyText, ["pachet", "pachete", "bronz", "silver", "gold"]);
    const services_detected = [];
    if(hasKeyword(bodyText, ["animator", "animatori"])) services_detected.push("animatori");
    if(hasKeyword(bodyText, ["mascot", "mascote"])) services_detected.push("mascote");
    if(hasKeyword(bodyText, ["balon", "baloane", "decor", "arcada"])) services_detected.push("baloane");
    if(hasKeyword(bodyText, ["pictura", "face painting"])) services_detected.push("pictura");
    
    const locations_detected = [];
    if(hasKeyword(bodyText, ["bucuresti", "bucurești"])) locations_detected.push("bucuresti");
    if(hasKeyword(bodyText, ["ilfov"])) locations_detected.push("ilfov");
    if(hasKeyword(bodyText, ["floreasca"])) locations_detected.push("floreasca");

    const faqItems = $("details, .faq, .accordion").length;
    const faq_detected = faqItems > 0 || hasKeyword(bodyText, ["intrebari frecvente", "întrebări frecvente", "faq"]);
    const faq_count = faqItems;

    const reviews_detected = hasKeyword(bodyText, ["recenzii", "pareri", "păreri", "testimoniale", "review"]);
    const cta_detected = $("a.btn, a.button, button").length > 0;
    
    const phoneRegex = /(07\d{8}|0\d{3}\s\d{3}\s\d{3})/g;
    const phone_detected = phoneRegex.test(bodyText) || $("a[href^='tel:']").length > 0 || $("a[href*='wa.me']").length > 0 || hasKeyword(bodyText, ["whatsapp"]);
    
    const images_count = $("img").length;
    
    return {
      title, meta_description, h1, h2_list: h2_list.slice(0,10),
      word_count: wc, services_detected, locations_detected,
      pricing_detected, packages_detected, faq_detected, faq_count,
      reviews_detected, cta_detected, phone_or_whatsapp_detected: phone_detected,
      images_count, schema_types: [], internal_links_count: $("a").length,
      strengths: [], weaknesses: [], what_kassia_must_add: []
    };

  } catch(e) {
    return { error: e.message };
  }
}

async function run() {
  const allResults = [];
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  const page = await browser.newPage();
  
  for(let kw of ALL_KWs) {
    console.log(`Searching: ${kw}`);
    const results = await fetchSerp(kw);
    
    let rank = 1;
    for(let r of results) {
      if(!r.link || r.link.includes("facebook.com") || r.link.includes("instagram.com")) continue;
      
      console.log(`Scraping [${kw}] Rank ${rank}: ${r.link}`);
      const scraped = await scrapeUrl(page, r.link);
      
      allResults.push({
        keyword: kw,
        rank: rank++,
        competitor_url: r.link,
        ...scraped
      });
      if(rank > 10) break;
    }
  }
  
  await browser.close();
  
  fs.mkdirSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/audit_competitors', { recursive: true });
  fs.writeFileSync('/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/scratch/audit_competitors/competitor_scraping_raw.json', JSON.stringify(allResults, null, 2));
  console.log("Done!");
}

run();
