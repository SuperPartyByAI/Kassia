import fs from 'fs';
import path from 'path';
import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';
import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';

config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.PUBLIC_SUPABASE_ANON_KEY);

const intents = [
  "ilfov",
  "popesti",
  "voluntari",
  "otopeni",
  "chiajna",
  "bragadiru"
];

async function runPreflight() {
  const { data: sitemapData } = await supabase.from('pages').select('url').eq('indexability', 'indexable');
  const sitemapUrls = sitemapData ? sitemapData.map(d => d.url) : [];

  const { data: allPages } = await supabase.from('pages').select('*');
  
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  const page = await browser.newPage();
  
  const results = [];
  let testedCount = 0;
  
  for (let intent of intents) {
      if (testedCount >= 5) break;
      
      // Find the best matching page in DB
      const matchedPage = allPages.find(p => p.url.includes(intent) && p.url.includes("animatori"));
      if (!matchedPage) continue;
      
      const slug = matchedPage.url.replace(/^\//, '').replace(/\/$/, '');
      const fullUrl = `https://www.kassia.ro/${slug}/`;
      const isLive = matchedPage.status === 'published';
      
      let liveStatus = 404;
      let wordCount = 0;
      let faq = false;
      let reviews = false;
      let pricing = false;
      let contentBugs = [];
      let layoutOk = false;
      let h1 = "";
      
      if (isLive) {
          try {
              const res = await page.goto(fullUrl, { waitUntil: 'domcontentloaded' });
              liveStatus = res.status();
              
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
          } catch(e) {
              contentBugs.push("Error loading page: " + e.message);
          }
      }
      
      let canRisk = "low";
      const similarPages = allPages.filter(p => p.url.includes(intent) && p.url !== matchedPage.url).map(p => p.url);
      if (similarPages.length > 0) canRisk = "medium";
      if (similarPages.length > 1) canRisk = "high";
      
      let recommendation = "SKIP";
      let reason = "";
      
      if (liveStatus === 200 && contentBugs.length === 0 && wordCount > 400 && canRisk === "low") {
          recommendation = "SELECT_AS_NEXT_P0";
          reason = "Criterii stricte îndeplinite (200 OK, fără bug-uri, word count decent, canibalizare redusă).";
      } else {
          reason = `Failed criteria: Status ${liveStatus}, Bugs: ${contentBugs.length}, Risk: ${canRisk}, Words: ${wordCount}`;
      }
      
      results.push({
          candidate_url: fullUrl,
          db_id: matchedPage.id,
          target_keyword: slug.replace(/-/g, ' '),
          service: "animatori",
          location: intent,
          live_status: liveStatus,
          indexable: matchedPage.indexability === 'indexable',
          in_sitemap: sitemapUrls.includes(matchedPage.url),
          internal_links_in: 0,
          word_count: wordCount,
          h1: h1,
          title: matchedPage.seo_title || "",
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
      
      testedCount++;
  }
  
  await browser.close();
  
  const outDir = '/Users/universparty/wa-web-launcher/kassia-site/audit_next_orphan_p0';
  fs.mkdirSync(outDir, { recursive: true });
  
  fs.writeFileSync(path.join(outDir, 'next_p0_candidates.json'), JSON.stringify(results, null, 2));
  
  let md = `# Preflight Candidates for Next P0\n\n`;
  results.forEach(r => {
      md += `## ${r.target_keyword}\n`;
      md += `- URL: ${r.candidate_url}\n`;
      md += `- Status: ${r.live_status} | Word Count: ${r.word_count}\n`;
      md += `- Bugs: ${r.content_bugs_detected.length === 0 ? 'None' : r.content_bugs_detected.join(', ')}\n`;
      md += `- Cannibalization Risk: ${r.cannibalization_risk}\n`;
      md += `- **Recommendation**: ${r.recommendation}\n`;
      md += `- Reason: ${r.reason}\n\n`;
  });
  fs.writeFileSync(path.join(outDir, 'next_p0_candidates.md'), md);
  
  console.log("PREFLIGHT_DONE");
}
runPreflight();
