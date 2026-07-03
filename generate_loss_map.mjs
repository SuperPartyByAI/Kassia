import fs from 'fs';
import * as cheerio from 'cheerio';

const outDir = 'audit_animatori_pillar_gap_v3';
if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });

async function deepScrape(url) {
  try {
    const res = await fetch(url, { headers: { 'User-Agent': 'Mozilla/5.0' }, timeout: 8000 });
    const html = await res.text();
    const $ = cheerio.load(html);
    const text = $('body').text().replace(/\s+/g, ' ').toLowerCase();
    
    const h2_list = [];
    $('h2').each((i, el) => h2_list.push($(el).text().trim()));
    
    let faqSchema = 0;
    $("script[type='application/ld+json']").each((i, el) => {
      try {
        const data = JSON.parse($(el).html());
        if (data["@graph"]) {
          const f = data["@graph"].find(n => n["@type"] === "FAQPage");
          if (f && f.mainEntity) faqSchema = f.mainEntity.length;
        } else if (data["@type"] === "FAQPage" && data.mainEntity) {
          faqSchema = data.mainEntity.length;
        }
      } catch(e){}
    });
    
    // Extract pricing values roughly
    const pricingMatch = text.match(/\b\d{2,4}\s*(lei|ron|€|euro)/g);
    const prices = pricingMatch ? [...new Set(pricingMatch)] : [];
    
    // Find local links
    const local_links = [];
    $('a').each((i, el) => {
      const txt = $(el).text().toLowerCase();
      if (txt.includes('bucuresti') || txt.includes('ilfov') || txt.includes('sector')) {
        local_links.push(txt);
      }
    });

    return {
      url,
      title: $('title').text(),
      h1: $('h1').text().trim(),
      h2_list,
      first_300: text.split(' ').slice(0, 300).join(' '),
      faq_visible_count: $('details').length || text.split('întrebări').length - 1,
      faq_schema_count: faqSchema,
      prices,
      local_links: [...new Set(local_links)],
      has_programe: text.includes('program') || text.includes('pachet'),
      has_personaje: text.includes('personaj'),
      has_mascote: text.includes('mascot'),
      has_activitati: text.includes('activitat') || text.includes('jocuri'),
      has_adaptare: text.includes('varst') || text.includes('vârst'),
      has_recuzita: text.includes('recuzit'),
      has_experienta: text.includes('experient') || text.includes('experienț'),
      has_rezervare: text.includes('rezerv'),
      has_oferta: text.includes('ofert')
    };
  } catch(e) {
    console.error(e);
    return null;
  }
}

async function run() {
  const KASSIA_URL = 'https://www.kassia.ro/animatori-petreceri-copii/';
  const COMPETITORS = [
    "https://animatoriiveseli.ro/",
    "https://paradisulpersonajelor.ro/animatie-copii/",
    "https://resurse-petreceri.ro/diverse/animatori-petreceri-pentru-copii/"
  ];
  
  console.log("Deep scraping Kassia...");
  const kassia = await deepScrape(KASSIA_URL);
  
  const lossMap = {
    competitors: [],
    kassia_fix_needed: []
  };
  
  for (const c of COMPETITORS) {
    console.log("Deep scraping", c);
    const comp = await deepScrape(c);
    if (!comp) continue;
    
    const criteria_lost_by_kassia = {
      keyword_relevance: [],
      title_meta_h1: [],
      page_type: [],
      content_depth: [],
      pricing_packages: [],
      cta_contact: [],
      faq_schema: [],
      reviews_trust: [],
      images: [],
      location_coverage: [],
      internal_linking: [],
      ux_layout: [],
      commercial_differentiation: []
    };
    
    // Evaluate deeper criteria
    if (comp.h2_list.length > kassia.h2_list.length) {
      criteria_lost_by_kassia.title_meta_h1.push(`Competitor has more H2s (${comp.h2_list.length} vs ${kassia.h2_list.length})`);
    }
    if (comp.prices.length > 0 && kassia.prices.length === 0) {
      criteria_lost_by_kassia.pricing_packages.push(`Competitor shows clear prices: ${comp.prices.slice(0,3).join(', ')}. Kassia shows none.`);
    }
    if (comp.local_links.length > kassia.local_links.length) {
      criteria_lost_by_kassia.location_coverage.push(`Competitor has more local links (${comp.local_links.length} vs ${kassia.local_links.length})`);
    }
    if (comp.faq_schema_count > kassia.faq_schema_count) {
      criteria_lost_by_kassia.faq_schema.push(`Competitor has more FAQ schema items (${comp.faq_schema_count} vs ${kassia.faq_schema_count})`);
    }
    
    // Commercial differentiation
    const diffs = [];
    if (comp.has_programe && !kassia.has_programe) diffs.push("programe clare");
    if (comp.has_personaje && !kassia.has_personaje) diffs.push("personaje");
    if (comp.has_mascote && !kassia.has_mascote) diffs.push("mascote");
    if (comp.has_activitati && !kassia.has_activitati) diffs.push("activități");
    if (comp.has_adaptare && !kassia.has_adaptare) diffs.push("adaptare vârstă");
    if (comp.has_recuzita && !kassia.has_recuzita) diffs.push("recuzită");
    if (comp.has_rezervare && !kassia.has_rezervare) diffs.push("rezervare rapidă");
    if (comp.has_oferta && !kassia.has_oferta) diffs.push("ofertă personalizată");
    
    if (diffs.length > 0) {
      criteria_lost_by_kassia.commercial_differentiation = diffs;
    }
    
    lossMap.competitors.push({
      competitor_url: c,
      criteria_lost_by_kassia,
      competitor_strengths: [
        `Prices: ${comp.prices.slice(0,5).join(', ')}`,
        `H2s: ${comp.h2_list.length}`,
        `Local Links: ${comp.local_links.length}`,
        `Commercial diffs: ${diffs.join(', ')}`
      ]
    });
  }
  
  lossMap.kassia_fix_needed = [
    "Adăugare secțiune de Programe clare (Scurt, Standard, Extins) cu CTA Oferta Personalizată (fără prețuri inventate).",
    "Întărirea listei de activități incluse.",
    "Adăugare de linkuri interne către București / sectoare.",
    "Mai multe H2-uri comerciale.",
    "Extindere detalii despre mascote și recuzită."
  ];
  
  fs.writeFileSync(`${outDir}/loss_map.json`, JSON.stringify(lossMap, null, 2));
  
  let md = "# Loss Map\n\n";
  for (const c of lossMap.competitors) {
    md += `## ${c.competitor_url}\n`;
    md += `- Strengths: ${c.competitor_strengths.join(' | ')}\n`;
    for (const [k, v] of Object.entries(c.criteria_lost_by_kassia)) {
      if (v.length > 0) {
        md += `- **${k}**: ${v.join(', ')}\n`;
      }
    }
    md += `\n`;
  }
  md += `## Kassia Fix Needed\n`;
  lossMap.kassia_fix_needed.forEach(f => md += `- ${f}\n`);
  
  fs.writeFileSync(`${outDir}/loss_map.md`, md);
  console.log("LOSS_MAP_GENERATED");
}

run();
