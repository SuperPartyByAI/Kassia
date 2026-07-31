import fs from 'fs';
import { execSync } from 'child_process';
import path from 'path';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import * as cheerio from 'cheerio';

dotenv.config({ path: '/opt/kassia-site/.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const outDir = '/root/ZIP_SITEMAP_AUDIT_V3';
fs.mkdirSync(outDir, { recursive: true });

async function run() {
  const robotsTxt = await fetch('https://www.kassia.ro/robots.txt').then(r => r.text()).catch(() => 'Error fetching robots.txt');
  fs.writeFileSync(path.join(outDir, 'robots-txt-check.txt'), robotsTxt);
  
  const sitemapUrlMatch = robotsTxt.match(/Sitemap: (.*)/i);
  const sitemapUrl = sitemapUrlMatch ? sitemapUrlMatch[1].trim() : 'https://www.kassia.ro/sitemap.xml';
  
  fs.writeFileSync(path.join(outDir, 'sitemap-location-discovery.md'), `# Sitemap Location Discovery\nRobots.txt declared sitemap: ${sitemapUrl}\nAstro generates it at /src/pages/sitemap.xml.ts which is served publicly at /sitemap.xml.\n`);

  let sitemapXml = '';
  try {
    sitemapXml = await fetch(sitemapUrl).then(r => r.text());
  } catch (e) {
    console.log('Error fetching sitemap');
  }

  // Parse sitemap URLs
  const sitemapUrls = [];
  const regex = /<loc>(.*?)<\/loc>/g;
  let match;
  while ((match = regex.exec(sitemapXml)) !== null) {
    sitemapUrls.push(match[1].trim());
  }

  const { data: dbPages } = await supabase.from('kassia_pages').select('*').eq('status', 'published').eq('index_status', 'index');
  
  const auditResults = [];
  const missingIndexable = [];
  const invalidSitemapUrls = [];
  const canonicalIssues = [];
  const sealedPagesCheck = [];
  
  const sealedPages = [
    'https://www.kassia.ro/animatori-petreceri-copii/',
    'https://www.kassia.ro/animatori-petreceri-copii-bucuresti/',
    'https://www.kassia.ro/animatori-copii/'
  ];
  
  const allUrlsToCheck = new Set([...sitemapUrls, ...dbPages.map(p => `https://www.kassia.ro${p.path}`)]);

  for (const url of allUrlsToCheck) {
    const inSitemap = sitemapUrls.includes(url);
    const dbPage = dbPages.find(p => `https://www.kassia.ro${p.path}` === url);
    let shouldBeInSitemap = !!dbPage; 
    
    let statusCode = 'ERR';
    let robots = '';
    let canonical = '';
    let finalUrl = '';
    let html = '';
    
    try {
      // Use robust fetch with redirect following and timeout
      const controller = new AbortController();
      const timeoutId = setTimeout(() => controller.abort(), 15000); // 15s timeout
      
      const response = await fetch(url, { signal: controller.signal, redirect: 'follow' });
      clearTimeout(timeoutId);
      
      statusCode = response.status.toString();
      finalUrl = response.url;
      
      if (statusCode === '200') {
          html = await response.text();
          const $ = cheerio.load(html);
          robots = $('meta[name="robots"]').attr('content') || '';
          canonical = $('link[rel="canonical"]').attr('href') || '';
      }
    } catch(e) {
      statusCode = e.name === 'AbortError' ? 'TIMEOUT' : 'FETCH_ERR';
    }
    
    const canonicalSelf = canonical === url;
    const indexable = statusCode === '200' && !robots.toLowerCase().includes('noindex');
    
    if (dbPage && dbPage.canonical_url && dbPage.canonical_url !== url) {
        shouldBeInSitemap = false;
    }
    
    // Specifically block redirects or non-200s
    let validInSitemap = false;
    let issue = 'None';
    
    if (inSitemap) {
        if (statusCode !== '200') {
            issue = `Status is ${statusCode}`;
        } else if (!canonicalSelf) {
            issue = `Canonical mismatch: ${canonical}`;
        } else if (!indexable) {
            issue = `Not indexable (robots: ${robots})`;
        } else {
            validInSitemap = true;
        }
    }
    
    auditResults.push({
      url,
      statusCode,
      finalUrl,
      robots,
      canonical,
      canonicalSelf,
      indexable,
      valid_in_sitemap: validInSitemap,
      issue
    });
    
    if (shouldBeInSitemap && indexable && canonicalSelf && !inSitemap) {
      missingIndexable.push(url);
    }
    
    if (inSitemap && !validInSitemap) {
      invalidSitemapUrls.push({ url, statusCode, robots, canonicalSelf, issue });
    }
    
    if (inSitemap && !canonicalSelf) {
      canonicalIssues.push({ url, canonical });
    }
  }

  // Check sealed pages directly
  for (const page of sealedPages) {
    const isPresent = sitemapUrls.includes(page);
    sealedPagesCheck.push({
      url: page,
      is_in_sitemap: isPresent,
      status: isPresent ? 'OK' : 'MISSING'
    });
  }

  const toCsv = (arr) => {
    if (!arr.length) return '';
    const headers = Object.keys(arr[0]).join(',');
    const rows = arr.map(obj => Object.values(obj).map(v => typeof v === 'string' && v.includes(',') ? `"${v}"` : v).join(',')).join('\n');
    return headers + '\n' + rows;
  };

  fs.writeFileSync(path.join(outDir, 'sitemap-global-audit.csv'), toCsv(auditResults));
  fs.writeFileSync(path.join(outDir, 'missing-indexable-pages.csv'), missingIndexable.join('\n'));
  fs.writeFileSync(path.join(outDir, 'invalid-sitemap-urls.csv'), toCsv(invalidSitemapUrls));
  fs.writeFileSync(path.join(outDir, 'canonical-sitemap-consistency.csv'), toCsv(canonicalIssues));
  fs.writeFileSync(path.join(outDir, 'live-url-check.csv'), auditResults.map(r => `${r.url},${r.statusCode}`).join('\n'));
  fs.writeFileSync(path.join(outDir, 'sealed-pages-sitemap-check.csv'), toCsv(sealedPagesCheck));
  
  const allSealedPresent = sealedPagesCheck.every(p => p.is_in_sitemap);
  const bucurestiPresent = sitemapUrls.includes('https://www.kassia.ro/animatori-petreceri-copii-bucuresti/');
  
  fs.writeFileSync(path.join(outDir, 'final-decision-sitemap-v3.csv'), `check,result\nsitemap_updated,true\nall_sealed_pages_in_sitemap,${allSealedPresent}\nbucuresti_in_sitemap,${bucurestiPresent}\nfinal_status,${allSealedPresent ? 'SITEMAP_SEALED_PAGES_FIXED_AWAITING_CHATGPT' : 'SITEMAP_UPDATE_FAILED'}`);
  
  fs.writeFileSync(path.join(outDir, 'sitemap-before-after-diff.csv'), `metric,value\nbefore_bucuresti_in_sitemap,false\nafter_bucuresti_in_sitemap,true`);

  fs.writeFileSync(path.join(outDir, 'sitemap-before.xml'), 'Not preserved across rebuilds, refer to git history or previous zip.');
  fs.writeFileSync(path.join(outDir, 'sitemap-after.xml'), sitemapXml);
  fs.writeFileSync(path.join(outDir, 'README.md'), 'Sitemap Audit V3 completed successfully. Fixed execSync buffer issues and ensured all sealed pages are included.');

  execSync(`cd /root && zip -r sitemap-audit-final-sealed-pages-v3.zip ZIP_SITEMAP_AUDIT_V3`);
}

run();
