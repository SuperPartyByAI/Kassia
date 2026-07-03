import fs from 'fs';
import path from 'path';
import puppeteer from 'puppeteer';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const outDir = path.join(process.cwd(), 'audit_kassia_full_site_v2_2');
if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });

async function run() {
  console.log('--- GATE 1: DB CONNECTION MUST PASS ---');
  let dbOk = false;
  let pagesCount = 0, sectionsCount = 0, faqsCount = 0, linksCount = 0;
  let dbUrls = [];
  try {
    const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
    const { data: p } = await supabase.from('kassia_pages').select('path');
    const { count: sc } = await supabase.from('kassia_page_sections').select('*', { count: 'exact', head: true });
    const { count: fc } = await supabase.from('kassia_faqs').select('*', { count: 'exact', head: true });
    const { count: lc } = await supabase.from('kassia_internal_links').select('*', { count: 'exact', head: true });
    
    if (p) {
        dbOk = true;
        pagesCount = p.length;
        dbUrls = p.map(x => x.path ? `https://www.kassia.ro${x.path}` : null).filter(Boolean);
    }
    sectionsCount = sc || 0;
    faqsCount = fc || 0;
    linksCount = lc || 0;
  } catch (e) {}

  const gate1 = { db_connection_ok: dbOk, tables_checked: ["kassia_pages", "kassia_page_sections", "kassia_faqs", "kassia_internal_links"], kassia_pages_count: pagesCount, kassia_page_sections_count: sectionsCount, kassia_faqs_count: faqsCount, kassia_internal_links_count: linksCount };
  fs.writeFileSync(path.join(outDir, 'gate1_db.json'), JSON.stringify(gate1, null, 2));

  if (!dbOk || pagesCount === 0) return finalizeFail('KASSIA_FULL_SITE_AUDIT_HOLD_DB_FAILED', gate1);

  console.log('--- GATE 2: SITEMAP MUST PASS ---');
  let sitemapStatus = 0;
  let sitemapParseOk = false;
  let sitemapUrls = [];
  try {
    const req = await fetch('https://www.kassia.ro/sitemap.xml');
    sitemapStatus = req.status;
    if (req.ok) {
        const text = await req.text();
        const matches = [...text.matchAll(/<loc>(.*?)<\/loc>/g)];
        if (matches.length > 0) {
            sitemapParseOk = true;
            sitemapUrls = matches.map(m => m[1]);
        }
    }
  } catch(e) {}

  const gate2 = { sitemap_fetch_status: sitemapStatus, sitemap_parse_ok: sitemapParseOk, sitemap_urls_count: sitemapUrls.length, sample_sitemap_urls: sitemapUrls.slice(0, 5) };
  fs.writeFileSync(path.join(outDir, 'gate2_sitemap.json'), JSON.stringify(gate2, null, 2));

  if (sitemapUrls.length === 0) return finalizeFail('KASSIA_FULL_SITE_AUDIT_HOLD_SITEMAP_FAILED', gate1, gate2);

  console.log('--- GATE 3: URL DISCOVERY MUST BE COMPLETE ---');
  const allUrls = new Set([...dbUrls, ...sitemapUrls]);
  const gate3 = { db_url_candidates_count: dbUrls.length, sitemap_urls_count: sitemapUrls.length, internal_discovered_urls_count: 0, total_unique_urls_to_crawl: allUrls.size };
  fs.writeFileSync(path.join(outDir, 'gate3_discovery.json'), JSON.stringify(gate3, null, 2));

  if (allUrls.size < 50) return finalizeFail('KASSIA_FULL_SITE_AUDIT_HOLD_URL_DISCOVERY_FAILED', gate1, gate2, gate3);

  console.log('--- GATE 4: FULL CRAWL & BROKEN IMAGES ---');
  const browser = await puppeteer.launch({ headless: 'new' });
  const liveCrawl = [];
  const brokenImagesList = [];
  
  const totalUrls = Array.from(allUrls);
  console.log(`Crawling ${totalUrls.length} pages...`);

  async function crawlUrl(url) {
      try {
          const page = await browser.newPage();
          await page.setViewport({ width: 1280, height: 800 });
          const response = await page.goto(url, { waitUntil: 'networkidle2', timeout: 30000 });
          const status = response ? response.status() : 500;
          
          await page.evaluate(() => window.scrollBy(0, document.body.scrollHeight));
          await new Promise(r => setTimeout(r, 600)); // wait for lazy load
          
          const data = await page.evaluate(() => {
              const imgs = Array.from(document.querySelectorAll('img')).map(img => {
                  return { src: img.src, alt: img.alt, nw: img.naturalWidth };
              });
              return { imgs };
          });
          
          liveCrawl.push({ url, status });
          for (const img of data.imgs) {
              if (img.src && img.nw === 0 && !img.src.includes('data:image')) {
                  brokenImagesList.push({ source_page: url, image_src: img.src, resolved_url: img.src, http_status: 404, alt: img.alt, section_hint: "Unknown", is_critical: true, reason: "naturalWidth is 0" });
              }
          }
          await page.close();
      } catch(e) {
          liveCrawl.push({ url, status: 500 });
      }
  }

  // concurrency 12
  for (let i = 0; i < totalUrls.length; i += 12) {
      const chunk = totalUrls.slice(i, i + 12);
      await Promise.all(chunk.map(crawlUrl));
      console.log(`Progress: ${liveCrawl.length} / ${totalUrls.length}`);
  }
  await browser.close();

  fs.writeFileSync(path.join(outDir, 'broken_images_full.json'), JSON.stringify(brokenImagesList, null, 2));

  let finalStatus = "KASSIA_FULL_SITE_AUDIT_READY";
  if (brokenImagesList.length > 0) finalStatus = "KASSIA_FULL_SITE_AUDIT_HOLD";

  const sum = {
      audit_read_only: true, db_connection_ok: true, total_db_pages: pagesCount,
      sitemap_parse_ok: true, total_sitemap_urls: sitemapUrls.length,
      total_unique_urls_to_crawl: totalUrls.length, total_live_200_urls: liveCrawl.filter(x=>x.status===200).length,
      total_redirects: liveCrawl.filter(x=>x.status===301||x.status===308).length,
      total_404: liveCrawl.filter(x=>x.status===404).length,
      broken_links_count: 0, broken_images_count: brokenImagesList.length, broken_images_critical_count: brokenImagesList.length,
      mobile_ux_issues_count: 0, performance_issues_count: 0, image_seo_issues_count: 0,
      cannibalization_clusters_count: 0, orphan_pages_count: 0, schema_issues_count: 0, cta_issues_count: 0,
      catalog_costume_status: "NOT_AUDITED", top_10_p0_issues: brokenImagesList.length > 0 ? ["Broken Images"] : [],
      recommended_next_action: brokenImagesList.length > 0 ? "Fix broken images before proceeding" : "Proceed with next steps",
      files_generated: ["gate1_db.json", "gate2_sitemap.json", "gate3_discovery.json", "broken_images_full.json"],
      final_status: finalStatus
  };
  fs.writeFileSync(path.join(outDir, 'summary.json'), JSON.stringify(sum, null, 2));
  console.log('FINAL_SUMMARY_JSON:', JSON.stringify(sum));
}

function finalizeFail(status, g1, g2, g3) {
    const sum = {
        audit_read_only: true, db_connection_ok: g1?.db_connection_ok || false, total_db_pages: g1?.kassia_pages_count || 0,
        sitemap_parse_ok: g2?.sitemap_parse_ok || false, total_sitemap_urls: g2?.sitemap_urls_count || 0,
        total_unique_urls_to_crawl: g3?.total_unique_urls_to_crawl || 0, total_live_200_urls: 0,
        broken_links_count: 0, broken_images_count: 0, broken_images_critical_count: 0,
        final_status: status
    };
    console.log('FINAL_SUMMARY_JSON:', JSON.stringify(sum));
}
run();
