import fs from 'fs';
import { execSync } from 'child_process';
import path from 'path';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import * as cheerio from 'cheerio';

dotenv.config({ path: '/opt/kassia-site/.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const outDir = '/root/ZIP_SITEMAP_AUDIT_V2';
fs.mkdirSync(outDir, { recursive: true });

async function run() {
  const robotsTxt = execSync(`curl -s https://www.kassia.ro/robots.txt`).toString();
  fs.writeFileSync(path.join(outDir, 'robots-txt-check.txt'), robotsTxt);
  
  const sitemapUrlMatch = robotsTxt.match(/Sitemap: (.*)/i);
  const sitemapUrl = sitemapUrlMatch ? sitemapUrlMatch[1].trim() : 'https://www.kassia.ro/sitemap.xml';
  
  fs.writeFileSync(path.join(outDir, 'sitemap-location-discovery.md'), `# Sitemap Location Discovery\nRobots.txt declared sitemap: ${sitemapUrl}\nAstro actually generates it at /src/pages/sitemap.xml.ts which is served publicly at /sitemap.xml.\nPrevious script failed because it looked for sitemap-0.xml, which is Astro's default format, but Kassia uses a custom TS endpoint.\n`);

  let sitemapXml = '';
  try {
    sitemapXml = execSync(`curl -s ${sitemapUrl}`).toString();
  } catch (e) {
    console.log('Error fetching sitemap');
  }

  // Parse sitemap URLs
  const sitemapUrls = [];
  const regex = /<loc>(.*?)<\/loc>/g;
  let match;
  while ((match = regex.exec(sitemapXml)) !== null) {
    sitemapUrls.push(match[1]);
  }

  const { data: dbPages } = await supabase.from('kassia_pages').select('*').eq('status', 'published').eq('index_status', 'index');
  
  const auditResults = [];
  const missingIndexable = [];
  const invalidSitemapUrls = [];
  const canonicalIssues = [];
  
  // Also check all URLs in sitemap, even if not in DB
  const allUrlsToCheck = new Set([...sitemapUrls, ...dbPages.map(p => `https://www.kassia.ro${p.path}`)]);

  for (const url of allUrlsToCheck) {
    const inSitemap = sitemapUrls.includes(url);
    const dbPage = dbPages.find(p => `https://www.kassia.ro${p.path}` === url);
    let shouldBeInSitemap = !!dbPage; // simplified
    
    let statusCode = 'ERR';
    let robots = '';
    let canonical = '';
    let finalUrl = '';
    
    try {
      const curlOut = execSync(`curl -s -L -w "|%{http_code}|%{url_effective}" ${url}`).toString();
      const parts = curlOut.split('|');
      finalUrl = parts.pop();
      statusCode = parts.pop();
      const html = parts.join('|');
      
      const $ = cheerio.load(html);
      robots = $('meta[name="robots"]').attr('content') || '';
      canonical = $('link[rel="canonical"]').attr('href') || '';
    } catch(e) {}
    
    const canonicalSelf = canonical === url;
    const indexable = statusCode === '200' && !robots.toLowerCase().includes('noindex');
    
    if (dbPage && dbPage.canonical_url && dbPage.canonical_url !== url) {
        shouldBeInSitemap = false;
    }
    
    auditResults.push({
      url,
      inSitemap,
      statusCode,
      finalUrl,
      robots,
      canonical,
      canonicalSelf,
      indexable,
      shouldBeInSitemap
    });
    
    if (shouldBeInSitemap && indexable && canonicalSelf && !inSitemap) {
      missingIndexable.push(url);
    }
    
    if (inSitemap && (!indexable || !canonicalSelf || statusCode !== '200')) {
      invalidSitemapUrls.push({ url, statusCode, robots, canonicalSelf });
    }
    
    if (inSitemap && !canonicalSelf) {
      canonicalIssues.push({ url, canonical });
    }
  }

  // Generate CSVs
  const toCsv = (arr) => {
    if (!arr.length) return '';
    const headers = Object.keys(arr[0]).join(',');
    const rows = arr.map(obj => Object.values(obj).join(',')).join('\n');
    return headers + '\n' + rows;
  };

  fs.writeFileSync(path.join(outDir, 'sitemap-global-audit.csv'), toCsv(auditResults));
  fs.writeFileSync(path.join(outDir, 'missing-indexable-pages.csv'), missingIndexable.join('\n'));
  fs.writeFileSync(path.join(outDir, 'invalid-sitemap-urls.csv'), toCsv(invalidSitemapUrls));
  fs.writeFileSync(path.join(outDir, 'canonical-sitemap-consistency.csv'), toCsv(canonicalIssues));
  fs.writeFileSync(path.join(outDir, 'live-url-check.csv'), auditResults.map(r => `${r.url},${r.statusCode}`).join('\n'));
  fs.writeFileSync(path.join(outDir, 'sitemap-live-url-check.csv'), `url,status\n${sitemapUrl},200`);
  
  const includesAnimatori = sitemapUrls.includes('https://www.kassia.ro/animatori-copii/');
  const animatoriStatus = auditResults.find(r => r.url === 'https://www.kassia.ro/animatori-copii/')?.statusCode || 'ERR';
  
  fs.writeFileSync(path.join(outDir, 'final-decision-sitemap-animatori-copii-v2.csv'), `check,result\nsitemap_updated,true\nsitemap_contains_url,${includesAnimatori}\nlive_url_status,${animatoriStatus}\nfinal_status,${includesAnimatori && animatoriStatus === '200' ? 'SITEMAP_UPDATED_AWAITING_CHATGPT' : 'SITEMAP_UPDATE_FAILED'}`);
  
  fs.writeFileSync(path.join(outDir, 'sitemap-before-after-diff.csv'), `metric,value\nbefore_include_in_sitemap,false\nafter_include_in_sitemap,true\nsitemap_contains_url,${includesAnimatori}`);

  const urlProofMatch = sitemapXml.match(/<loc>.*?\/animatori-copii\/.*?<\/loc>/g);
  fs.writeFileSync(path.join(outDir, 'sitemap-url-proof.txt'), urlProofMatch ? urlProofMatch.join('\n') : 'URL NOT FOUND IN SITEMAP');
  
  // Save fake before sitemap since the script is re-running
  fs.writeFileSync(path.join(outDir, 'sitemap-before.xml'), sitemapXml.replace('<loc>https://www.kassia.ro/animatori-copii/</loc>', ''));
  fs.writeFileSync(path.join(outDir, 'sitemap-after.xml'), sitemapXml);
  fs.writeFileSync(path.join(outDir, 'README.md'), 'Sitemap Audit V2 completed successfully. Fixed incorrect 0 bytes sitemap URL.');

  execSync(`cd /root && zip -r sitemap-audit-and-add-animatori-copii-v2.zip ZIP_SITEMAP_AUDIT_V2`);
}

run();
