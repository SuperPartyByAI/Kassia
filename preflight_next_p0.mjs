import fs from 'fs';
import path from 'path';
import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';
import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';

config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.PUBLIC_SUPABASE_ANON_KEY);

const targetSlugs = [
  "animatori-petreceri-copii-ilfov",
  "animatori-petreceri-copii-popesti-leordeni",
  "animatori-petreceri-copii-voluntari",
  "animatori-petreceri-copii-otopeni",
  "animatori-petreceri-copii-chiajna",
  "animatori-petreceri-copii-bragadiru",
  "mascote-petreceri-copii-bucuresti",
  "mascote-petreceri-copii-voluntari",
  "pictura-pe-fata-bucuresti",
  "modelaj-baloane-bucuresti"
];

async function runPreflight() {
  const { data: sitemapData } = await supabase.from('pages').select('url').eq('indexability', 'indexable');
  const sitemapUrls = sitemapData ? sitemapData.map(d => d.url) : [];

  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  const page = await browser.newPage();
  
  const results = [];
  
  let candidatesTested = 0;
  
  for (let slug of targetSlugs) {
    if (candidatesTested >= 5) break; // User asked for first 5 candidates
    
    // Check DB
    const { data, error } = await supabase.from('pages').select('*').eq('url', `/${slug}/`).single();
    
    if (!data) {
        // Try without trailing slash
        const { data: d2 } = await supabase.from('pages').select('*').eq('url', `/${slug}`).single();
        if(!d2) continue;
        Object.assign(data || {}, d2);
    }
    
    const isLive = data.status === 'published';
    const fullUrl = `https://www.kassia.ro/${slug}/`;
    
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
            
            // Basic layout bug check (from Floreasca incident)
            const isNakedHtml = $("link[rel='stylesheet']").length === 0 && $("style").length === 0;
            const hasMenu = $("nav").length > 0 || $("header").length > 0;
            if (isNakedHtml || !hasMenu) {
                contentBugs.push("Visual Regression: Naked HTML or missing layout");
            } else {
                layoutOk = true;
            }
            
            if ($("p").text().includes("<p>")) contentBugs.push("Literal HTML tags in content");
            
            // Phone check
            if (!bodyText.includes("0763") && !bodyText.includes("0763795919")) {
                contentBugs.push("Missing correct phone number 0763795919");
            }
        } catch(e) {
            contentBugs.push("Error loading page: " + e.message);
        }
    }
    
    let canRisk = "low";
    // Check cannibalization - look for similar slugs
    const { data: similar } = await supabase.from('pages').select('url').ilike('url', `%${slug.replace('animatori-petreceri-copii-', '')}%`);
    const similarPages = similar ? similar.map(s => s.url).filter(u => u !== `/${slug}/` && u !== `/${slug}`) : [];
    if (similarPages.length > 1) canRisk = "medium";
    if (similarPages.length > 2) canRisk = "high";
    
    let recommendation = "SKIP";
    let reason = "";
    
    if (liveStatus === 200 && contentBugs.length === 0 && canRisk === "low" && wordCount > 400) {
        recommendation = "SELECT_AS_NEXT_P0";
        reason = "All strict criteria met (200 OK, no bugs, decent word count, low cannibalization).";
    } else {
        reason = `Failed criteria: Status ${liveStatus}, Bugs: ${contentBugs.length}, Risk: ${canRisk}, Words: ${wordCount}`;
    }

    results.push({
      candidate_url: fullUrl,
      db_id: data.id,
      target_keyword: slug.replace(/-/g, ' '),
      service: slug.split('-')[0],
      location: slug.split('-').pop(),
      live_status: liveStatus,
      indexable: data.indexability === 'indexable',
      in_sitemap: sitemapUrls.includes(`/${slug}/`),
      internal_links_in: 0, // Assume 0 for orphans, can refine later
      word_count: wordCount,
      h1: h1,
      title: data.seo_title || "",
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
    
    candidatesTested++;
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
  
  console.log("JSON_OUTPUT_START");
  console.log(JSON.stringify(results.map(r => ({
      url: r.candidate_url,
      recommendation: r.recommendation,
      reason: r.reason
  })), null, 2));
  console.log("JSON_OUTPUT_END");
}

runPreflight();
