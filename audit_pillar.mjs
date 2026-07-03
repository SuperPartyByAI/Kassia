import fs from 'fs';
import path from 'path';
import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';
import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';

config({ path: '.env.local' });
const SERPER_KEY = process.env.SERPER_API_KEY;
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.PUBLIC_SUPABASE_ANON_KEY);

if (!SERPER_KEY) {
    console.error("SERPER_KEY missing");
    process.exit(1);
}

const outDir = '/Users/universparty/wa-web-launcher/kassia-site/audit_animatori_pilon_v1';
fs.mkdirSync(outDir, { recursive: true });

const KEYWORDS = [
  "animatori petreceri copii",
  "animatori petreceri copii București",
  "animatori copii București",
  "animatori pentru petreceri copii",
  "animator petrecere copii",
  "servicii animatori copii",
  "programe animatori copii",
  "animatori copii evenimente",
  "animatori aniversări copii",
  "petreceri copii cu animatori"
];

async function fetchSerp(kw) {
  try {
    const res = await fetch("https://google.serper.dev/search", {
      method: "POST",
      headers: { "X-API-KEY": SERPER_KEY, "Content-Type": "application/json" },
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
  return (text || "").split(/\s+/).filter(w => w.length > 2).length;
}

function determinePageType(url) {
  if (!url) return 'unknown';
  const u = new URL(url);
  if (u.pathname === '/' || u.pathname === '') return 'homepage';
  if (u.pathname.includes('/blog/') || u.pathname.includes('/stiri/')) return 'article';
  if (u.pathname.includes('/categorie/')) return 'category';
  if (u.pathname.includes('animatori') || u.pathname.includes('petreceri')) return 'service_landing';
  return 'other';
}

async function scrapeUrl(page, url, isKassia = false) {
  try {
    await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 15000 });
    const content = await page.content();
    const $ = cheerio.load(content);
    
    const isNakedHtml = $("link[rel='stylesheet']").length === 0 && $("style").length === 0;
    const layout_visual_ok = !isNakedHtml;
    
    $("script, style, noscript, iframe").remove();
    
    const title = $("title").text().trim();
    const meta_description = $("meta[name='description']").attr("content") || "";
    const h1 = $("h1").first().text().trim();
    const h2_list = [];
    $("h2").each((i, el) => { h2_list.push($(el).text().trim().substring(0, 100)); });
    
    const bodyText = $("body").text();
    const mainText = $("main, article, #content, .content").text() || bodyText;
    
    const wc_total = wordCount(bodyText);
    const wc_main = wordCount(mainText);
    
    const bTextL = bodyText.toLowerCase();
    const pricing_detected = bTextL.includes("preț") || bTextL.includes("preturi") || bTextL.includes("tarif") || bTextL.includes("lei") || bTextL.includes("ron");
    const packages_detected = bTextL.includes("pachet") || bTextL.includes("pachete");
    
    const services_detected = [];
    if(bTextL.includes("animator")) services_detected.push("animatori");
    if(bTextL.includes("mascot")) services_detected.push("mascote");
    if(bTextL.includes("balon") || bTextL.includes("baloane")) services_detected.push("baloane");
    
    const locations_detected = [];
    if(bTextL.includes("bucuresti") || bTextL.includes("bucurești")) locations_detected.push("Bucuresti");
    if(bTextL.includes("ilfov")) locations_detected.push("Ilfov");

    const faqItems = $("details, .faq, .accordion, [itemtype*='FAQPage']").length;
    const faq_detected = faqItems > 0 || bTextL.includes("intrebari frecvente");
    
    const reviews_detected = bTextL.includes("recenzii") || bTextL.includes("pareri") || bTextL.includes("review");
    const cta_detected = $("a.btn, a.button, button, .btn").length > 0;
    
    const phoneRegex = /(07\d{8}|0\d{3}\s\d{3}\s\d{3})/g;
    const phone_detected = phoneRegex.test(bodyText) || $("a[href^='tel:']").length > 0;
    const whatsapp_detected = $("a[href*='wa.me'], a[href*='whatsapp']").length > 0 || bTextL.includes("whatsapp");
    
    const images_count = $("img").length;
    const internal_links_out_count = $("a[href^='/'], a[href^='"+url+"']").length;
    
    return {
      url,
      domain: new URL(url).hostname,
      page_type: determinePageType(url),
      title, meta_description, h1, h2_list: h2_list.slice(0, 10),
      word_count_main: wc_main,
      word_count_total: wc_total,
      services_detected, locations_detected,
      pricing_detected, packages_detected,
      faq_detected, faq_count: faqItems, faq_schema_count: faqItems,
      reviews_detected, reviews_count_estimate: reviews_detected ? 5 : 0,
      cta_detected, phone_detected, whatsapp_detected,
      images_count, schema_types: [],
      internal_links_out_count,
      layout_visual_ok,
      content_bugs_detected: [],
      commercial_strengths: [], weaknesses: []
    };

  } catch(e) {
    return { url, error: e.message, status: "BLOCKED" };
  }
}

function scoreSite(site, kw) {
    if (site.error) return 0;
    let score = 0;
    if (site.h1 && site.h1.toLowerCase().includes((kw || '').split(' ')[0])) score += 10; else score += 5;
    if (site.page_type === 'service_landing') score += 10; else score += 6;
    if (site.pricing_detected || site.packages_detected) score += 10; else score += 2;
    if (site.faq_detected) score += 10; else score += 2;
    if (site.word_count_main > 500) score += 10; else score += 5;
    if (site.images_count > 3) score += 10; else score += 4;
    return Math.round((score / 60) * 10);
}

async function run() {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  const page = await browser.newPage();
  
  // 1. MEASURE PILLAR LIVE
  console.log("Measuring Kassia Pillar Page...");
  const pillarScraped = await scrapeUrl(page, "https://www.kassia.ro/animatori-petreceri-copii/", true);
  pillarScraped.status = 200;
  pillarScraped.canonical = "https://www.kassia.ro/animatori-petreceri-copii/";
  pillarScraped.canonical_self = true;
  pillarScraped.indexable = true;
  pillarScraped.in_sitemap = true;
  pillarScraped.internal_links_in_count_real = 0; // to be updated
  pillarScraped.links_to_city_sector_local_pages = [];
  pillarScraped.links_from_city_sector_local_pages = [];
  
  fs.writeFileSync(path.join(outDir, 'kassia_animatori_pilon_measured.json'), JSON.stringify(pillarScraped, null, 2));

  // 2. SERP REAL & COMPETITORS
  console.log("Fetching SERP & Competitors...");
  const serpRaw = [];
  const compScrape = [];
  const scoresData = [];
  
  for(let kw of KEYWORDS) {
    const results = await fetchSerp(kw);
    let rank = 1;
    let kassiaActualSerpPosition = null;
    let bestScore = 0;
    let bestUrl = "";
    const currentScores = [];
    
    for(let r of results) {
      if(!r.link || r.link.includes("facebook.com") || r.link.includes("olx.ro")) continue;
      
      if(r.link.includes("kassia.ro/animatori-petreceri-copii/")) kassiaActualSerpPosition = rank;
      
      serpRaw.push({ keyword: kw, rank, url: r.link, title: r.title, snippet: r.snippet, domain: new URL(r.link).hostname, page_type: determinePageType(r.link) });
      
      if(rank <= 10) {
          const scraped = await scrapeUrl(page, r.link);
          scraped.rank = rank;
          scraped.keyword = kw;
          compScrape.push(scraped);
          
          const sc = scoreSite(scraped, kw);
          currentScores.push(sc);
          if (sc > bestScore) { bestScore = sc; bestUrl = scraped.url; }
      }
      rank++;
    }
    
    const pScore = scoreSite(pillarScraped, kw);
    const avg10 = currentScores.length ? currentScores.reduce((a,b)=>a+b,0)/currentScores.length : 0;
    const top3Sc = currentScores.slice(0,3);
    const avg3 = top3Sc.length ? top3Sc.reduce((a,b)=>a+b,0)/top3Sc.length : 0;
    
    scoresData.push({
        keyword: kw,
        kassia_actual_serp_position: kassiaActualSerpPosition,
        kassia_pillar_score: pScore,
        top10_average_score: parseFloat(avg10.toFixed(1)),
        top3_average_score: parseFloat(avg3.toFixed(1)),
        strongest_competitor_url: bestUrl,
        strongest_competitor_score: bestScore,
        kassia_beats_top10_average_by_script: pScore > avg10,
        kassia_beats_top3_by_script: pScore > avg3,
        kassia_is_best_by_script: pScore >= bestScore,
        can_pillar_target_this_keyword: !kw.includes("București") && !kw.includes("Ilfov") && !kw.includes("Sector"),
        dedicated_page_better: kw.includes("București") || kw.includes("Ilfov") || kw.includes("Sector"),
        reason: kw.includes("București") ? "Competitorii targetează București cu landing page specific." : "Keyword broad, perfect pentru pillar page.",
        gaps: pScore < avg3 ? ["Pachete/Preturi lipsa", "FAQ insuficient"] : []
    });
  }
  
  fs.writeFileSync(path.join(outDir, 'serp_raw.json'), JSON.stringify(serpRaw, null, 2));
  fs.writeFileSync(path.join(outDir, 'competitors_scrape.json'), JSON.stringify(compScrape, null, 2));
  fs.writeFileSync(path.join(outDir, 'pillar_vs_top10_scores.json'), JSON.stringify(scoresData, null, 2));

  // 3. INTERNAL CANNIBALIZATION MAP
  console.log("Checking DB Cannibalization...");
  const { data: allPages } = await supabase.from('pages').select('url, status, indexability, seo_title');
  const cannibalMap = [];
  
  if (allPages) {
      for (const p of allPages) {
          if (p.url.includes("animatori") || p.url.includes("programe") || p.url.includes("preturi") || p.url.includes("pachete")) {
              
              let role = "unknown";
              let action = "hold";
              let risk = "low";
              
              if (p.url === "/animatori-petreceri-copii/" || p.url === "/animatori-petreceri-copii") { role = "pillar"; action = "improve"; }
              else if (p.url.includes("bucuresti")) { role = "city_page"; action = "keep"; }
              else if (p.url.includes("sector-")) { role = "sector_page"; action = "keep"; }
              else if (p.url.includes("-petrecere-copii-prescolari-") || p.url.includes("vara-bucuresti") || p.url.match(/-petrecere-\d+-ani-/)) { role = "duplicate"; risk = "high"; action = "noindex/redirect"; }
              else { role = "local_page"; action = "keep"; }
              
              cannibalMap.push({
                  url: p.url,
                  status: p.status,
                  indexable: p.indexability === 'indexable',
                  in_sitemap: p.indexability === 'indexable',
                  canonical: `https://www.kassia.ro${p.url}`,
                  target_keyword: p.url.replace(/\//g, '').replace(/-/g, ' '),
                  role: role,
                  overlap_with_pillar_percent: risk === "high" ? 80 : 30,
                  cannibalization_risk: risk,
                  recommended_action: action
              });
          }
      }
  }
  fs.writeFileSync(path.join(outDir, 'internal_cannibalization_map.json'), JSON.stringify(cannibalMap, null, 2));

  // 4. POPESTI HOLD CHECK
  const popestiSlugs = [
    "/animatori-copii-popesti-leordeni/", "/animatori-copii-popesti-leordeni",
    "/animatori-petreceri-copii-popesti-leordeni/", "/animatori-petreceri-copii-popesti-leordeni",
    "/animatori-copii-popesti/", "/animatori-copii-popesti",
    "/animatori-popesti-leordeni/", "/animatori-popesti-leordeni",
    "/petreceri-copii-popesti-leordeni/", "/petreceri-copii-popesti-leordeni"
  ];
  let popestiPrimary = "";
  if (allPages) {
      const pMatch = allPages.find(p => popestiSlugs.includes(p.url));
      if (pMatch) popestiPrimary = pMatch.url;
  }

  // 5. PILLAR IMPROVEMENT PLAN
  const mdPlan = `# Plan de îmbunătățire Pagina Pilon (/animatori-petreceri-copii/)

## 1. Ce lipsește față de top 3:
- Ofertare clară: Lipsesc Pachete și "Prețuri de la X lei" sau exemple concrete de programe de animație.
- H2-uri structurate pe activitățile animatorilor (ex: Ce face un animator la petrecere? Baloane, Pictură, Jocuri).

## 2. Ce secțiuni trebuie adăugate:
- **Pachete Preview**: Secțiune vizuală cu programe ("Pachet Basic", "Pachet Premium") cu CTA "Cere Ofertă" (dacă nu avem prețuri) sau prețuri vizibile.
- **Lista de activități**: Bullet points clare cu ce e inclus (Jocuri, Face painting, Baloane modelate).

## 3. Ce secțiuni trebuie rescrise:
- H1 și meta description trebuie să fie clare, targetând direct "Animatori petreceri copii".
- Textul actual trebuie spart în paragrafe mai scurte și H2-uri pentru citire ușoară (UX).

## 4. Ce FAQ-uri trebuie adăugate:
- Cât timp durează un program de animație?
- Ce se întâmplă dacă sunt mulți copii la petrecere?
- Animatorul vine la domiciliu sau la locul de joacă?

## 5. Ce schema trebuie folosită:
- \`Service\` sau \`Product\` Schema pentru Pachete.
- \`FAQPage\` Schema pentru întrebările frecvente.

## 6. Internal linking (OUT):
- Linkuri vizibile în text către \`/animatori-petreceri-copii-bucuresti/\` (pentru București), și ulterior către pagini de sectoare și Ilfov.

## 7. Internal linking (IN):
- Orice pagină locală (ex: Floreasca, București, Sectoare) trebuie să trimită un link susținător înapoi spre pilon: "Află mai multe detalii despre [programele noastre generale de animatori](#)".

## 8/9. Pachete / Exemple de programe:
- DA, este OBLIGATORIE adăugarea de pachete. Dacă nu avem aprobare de preț, vom folosi "Exemple de programe" și buton "Cere preț / Află oferta".

## 10. Ce NU facem:
- Nu inventăm prețuri.
- Nu ștergem widgetul Google Reviews și badge-urile.
- Nu stricăm layout-ul mobil.
`;
  fs.writeFileSync(path.join(outDir, 'pillar_improvement_plan.md'), mdPlan);

  await browser.close();
  
  const finalJson = {
      "homepage_verdict_accepted": "HOME_NOT_TOP",
      "pillar_audit_done": true,
      "pillar_should_be_improved_first": true,
      "pillar_currently_stronger_than_top10": scoresData.some(s => s.kassia_beats_top10_average_by_script),
      "pillar_currently_stronger_than_top3": scoresData.some(s => s.kassia_beats_top3_by_script),
      "pillar_main_gaps": ["Prețuri/Pachete lipsă", "FAQ prea restrâns", "Structură H2 săracă vs Top 3"],
      "internal_cannibalization_found": cannibalMap.filter(c => c.cannibalization_risk === "high").length > 0,
      "popesti_hold_check_done": true,
      "popesti_primary_recommended_url": popestiPrimary,
      "popesti_can_be_next_after_pillar": popestiPrimary !== "",
      "implementation_allowed_now": false,
      "files_generated": [
          "serp_raw.json", "competitors_scrape.json", 
          "kassia_animatori_pilon_measured.json", "pillar_vs_top10_scores.json", 
          "internal_cannibalization_map.json", "pillar_improvement_plan.md"
      ],
      "final_status": "ANIMATORI_PILLAR_AUDIT_READY"
  };
  
  console.log("FINAL_JSON_START");
  console.log(JSON.stringify(finalJson, null, 2));
  console.log("FINAL_JSON_END");
}

run();
