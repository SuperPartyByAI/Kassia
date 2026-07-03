import fs from 'fs';
import path from 'path';
import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';

const outDir = '/Users/universparty/wa-web-launcher/kassia-site/audit_next_orphan_p0';
fs.mkdirSync(outDir, { recursive: true });

const orphansRaw = fs.readFileSync('/Users/universparty/wa-web-launcher/kassia-site/audit_kassia_orphan_activation_v22/top_orphan_candidates.json', 'utf8');
const orphans = JSON.parse(orphansRaw);

// Priority list requested by user
const targets = [
  "ilfov",
  "popesti-leordeni",
  "voluntari",
  "otopeni",
  "chiajna",
  "bragadiru",
  "mascote", // mascote petreceri copii București
  "mascote.*voluntari",
  "pictura", // pictură pe față București
  "modelaj"  // modelaj baloane București
];

// Find exact matches from orphans list
let candidates = [];
for (let target of targets) {
    const matched = orphans.find(o => o.url.includes(target.replace('.*', '')));
    if (matched) candidates.push(matched);
}

// Remove duplicates
candidates = [...new Map(candidates.map(c => [c.url, c])).values()];
// Keep top 5
candidates = candidates.slice(0, 5);

async function runPreflight() {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  const page = await browser.newPage();
  
  const results = [];
  
  for (let cand of candidates) {
      const fullUrl = cand.url;
      const slug = new URL(fullUrl).pathname.replace(/^\/|\/$/g, '');
      
      let liveStatus = 404;
      let wordCount = 0;
      let faq = false;
      let reviews = false;
      let pricing = false;
      let contentBugs = [];
      let layoutOk = false;
      let h1 = "";
      
      try {
          const res = await page.goto(fullUrl, { waitUntil: 'domcontentloaded' });
          liveStatus = res.status();
          
          if (liveStatus === 200) {
              const content = await page.content();
              const $ = cheerio.load(content);
              
              h1 = $("h1").text().trim();
              const bodyText = $("body").text();
              wordCount = bodyText.split(/\s+/).filter(w => w.length > 2).length;
              
              faq = $("details, .faq").length > 0 || bodyText.toLowerCase().includes("intrebari frecvente");
              reviews = bodyText.toLowerCase().includes("recenzii") || bodyText.toLowerCase().includes("pareri");
              pricing = bodyText.toLowerCase().includes("pret") || bodyText.toLowerCase().includes("pachet");
              
              const isNakedHtml = $("link[rel='stylesheet']").length === 0 && $("style").length === 0;
              const hasMenu = $("nav").length > 0 || $("header").length > 0;
              if (isNakedHtml || !hasMenu) {
                  contentBugs.push("Visual Regression: Naked HTML or missing layout");
              } else {
                  layoutOk = true;
              }
              
              if ($("p").text().includes("<p>")) contentBugs.push("Literal HTML tags in content");
              
              if (!bodyText.includes("0763") && !bodyText.includes("0763795919")) {
                  contentBugs.push("Missing correct phone number 0763795919");
              }
          }
      } catch(e) {
          contentBugs.push("Error loading page: " + e.message);
      }
      
      let canRisk = "low";
      const similarPages = orphans.filter(o => o.url.includes(cand.location) && o.url !== cand.url).map(o => o.url);
      if (similarPages.length > 0) canRisk = "medium";
      if (similarPages.length > 1) canRisk = "high";
      
      let recommendation = "SKIP";
      let reason = "";
      
      if (liveStatus === 200 && contentBugs.length === 0 && wordCount > 400 && canRisk === "low") {
          recommendation = "SELECT_AS_NEXT_P0";
          reason = "Toate criteriile bifate: 200 OK, fără bug-uri, risk de canibalizare mic, text amplu.";
      } else {
          reason = `Failed criteria: Status ${liveStatus}, Bugs: ${contentBugs.length}, Risk: ${canRisk}, Words: ${wordCount}`;
      }
      
      results.push({
          candidate_url: fullUrl,
          db_id: cand.db_id,
          target_keyword: h1 || cand.title,
          service: cand.service,
          location: cand.location,
          live_status: liveStatus,
          indexable: cand.indexable,
          in_sitemap: cand.in_sitemap,
          internal_links_in: cand.internal_links_in,
          word_count: wordCount,
          h1: h1,
          title: cand.title,
          canonical_self: true,
          faq_detected: faq,
          reviews_detected: reviews,
          pricing_or_packages_detected: pricing,
          layout_visual_ok: layoutOk,
          content_bugs_detected: contentBugs,
          similar_pages: similarPages,
          cannibalization_risk: canRisk,
          recommendation: recommendation,
          reason: reason
      });
  }
  
  await browser.close();
  
  fs.writeFileSync(path.join(outDir, 'next_p0_candidates.json'), JSON.stringify(results, null, 2));
  
  let md = `# Preflight Candidates for Next P0\n\n`;
  results.forEach(r => {
      md += `## ${r.target_keyword}\n`;
      md += `- URL: ${r.candidate_url}\n`;
      md += `- DB ID: ${r.db_id}\n`;
      md += `- Status: ${r.live_status} | Word Count: ${r.word_count}\n`;
      md += `- Bugs: ${r.content_bugs_detected.length === 0 ? 'None' : r.content_bugs_detected.join(', ')}\n`;
      md += `- Cannibalization Risk: ${r.cannibalization_risk}\n`;
      md += `- **Recommendation**: ${r.recommendation}\n`;
      md += `- Reason: ${r.reason}\n\n`;
  });
  fs.writeFileSync(path.join(outDir, 'next_p0_candidates.md'), md);
  
  console.log("JSON_OUTPUT_START");
  console.log(JSON.stringify(results.map(r => ({
      url: r.candidate_url,
      status: r.live_status,
      recommendation: r.recommendation,
      reason: r.reason
  })), null, 2));
  console.log("JSON_OUTPUT_END");
}
runPreflight();
