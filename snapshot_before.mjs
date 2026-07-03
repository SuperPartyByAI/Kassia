import fs from 'fs';
import path from 'path';
import puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';
import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';

config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.PUBLIC_SUPABASE_ANON_KEY);

const url = "https://www.kassia.ro/animatori-petreceri-copii/";
const outDir = '/Users/universparty/wa-web-launcher/kassia-site/audit_animatori_pilon_v1';
fs.mkdirSync(outDir, { recursive: true });

async function preflight() {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  const page = await browser.newPage();
  
  await page.setViewport({ width: 1280, height: 1024 });
  const res = await page.goto(url, { waitUntil: 'domcontentloaded' });
  
  const content = await page.content();
  const $ = cheerio.load(content);
  
  const title = $("title").text().trim();
  const meta_description = $("meta[name='description']").attr("content") || "";
  const h1 = $("h1").first().text().trim();
  const h2_list = [];
  $("h2").each((i, el) => { h2_list.push($(el).text().trim()); });
  
  const wordCount = $("body").text().split(/\s+/).filter(w => w.length > 2).length;
  const faqCount = $("details, .faq, [itemtype*='FAQPage']").length;
  
  let schemaCount = 0;
  $("script[type='application/ld+json']").each((i, el) => {
    try {
      const data = JSON.parse($(el).html());
      if (data["@type"] === "FAQPage") schemaCount += data.mainEntity ? data.mainEntity.length : 0;
    } catch(e){}
  });

  const internalLinksOut = $("a[href^='/'], a[href^='https://www.kassia.ro/']").length;
  const canonical = $("link[rel='canonical']").attr("href");
  const robots = $("meta[name='robots']").attr("content");
  
  // check if in sitemap
  let in_sitemap = false;
  try {
      const { data } = await supabase.from('pages').select('indexability').eq('url', '/animatori-petreceri-copii/').single();
      if(data && data.indexability === 'indexable') in_sitemap = true;
  }catch(e){}

  await page.screenshot({ path: path.join(outDir, 'before_screenshot.png'), fullPage: true });
  
  const snapshot = {
    title,
    meta_description,
    h1,
    h2_list,
    word_count: wordCount,
    faq_count: faqCount,
    schema_count: schemaCount,
    internal_links_out: internalLinksOut,
    status: res.status(),
    canonical: canonical,
    robots: robots,
    sitemap: in_sitemap,
    screenshot_before: path.join(outDir, 'before_screenshot.png')
  };
  
  fs.writeFileSync(path.join(outDir, 'before_snapshot.json'), JSON.stringify(snapshot, null, 2));
  
  await browser.close();
  console.log("PREFLIGHT_SNAPSHOT_DONE");
}

preflight();
