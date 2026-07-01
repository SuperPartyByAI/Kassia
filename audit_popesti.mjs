import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fetch from 'node-fetch';
import * as cheerio from 'cheerio';
import { XMLParser } from 'fast-xml-parser';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const domain = 'https://www.kassia.ro';

async function run() {
  const paths = [
      '/animatori-copii-popesti-leordeni/',
      '/animatori-petreceri-copii-popesti-leordeni/'
  ];

  console.log('--- 1. DATABASE CHECK ---');
  for (const path of paths) {
      const { data: page } = await supabase.from('kassia_pages').select('*').eq('path', path).single();
      if (page) {
          console.log(`FOUND in DB: ${path}`);
          console.log(`  status: ${page.status}`);
          console.log(`  index_status: ${page.index_status}`);
          console.log(`  include_in_sitemap: ${page.include_in_sitemap}`);
          console.log(`  h1: ${page.h1}`);
          console.log(`  title: ${page.title}`);
          console.log(`  meta_desc: ${page.meta_description}`);

          const { data: faqs } = await supabase.from('kassia_faqs').select('id').eq('page_id', page.id);
          console.log(`  faq_count: ${faqs.length}`);

          const { data: incoming } = await supabase.from('kassia_internal_links').select('id').eq('target_page_id', page.id);
          console.log(`  incoming_links: ${incoming.length}`);
          
          const { data: outgoing } = await supabase.from('kassia_internal_links').select('id').eq('source_page_id', page.id);
          console.log(`  outgoing_links: ${outgoing.length}`);
          
          const { data: sections } = await supabase.from('kassia_page_sections').select('content').eq('page_id', page.id);
          const body = sections.map(s => s.content.body || '').join(' ').substring(0, 150).replace(/\\n/g, ' ');
          console.log(`  body_snippet: ${body}`);
      } else {
          console.log(`NOT FOUND in DB: ${path}`);
      }
  }

  console.log('\n--- 2. LIVE DOM & SITEMAP CHECK ---');
  let sitemapUrls = new Set();
  try {
    const res = await fetch(domain + '/sitemap.xml');
    if (res.status === 200) {
      const xml = await res.text();
      const parser = new XMLParser();
      const obj = parser.parse(xml);
      if (obj.urlset && obj.urlset.url) {
        const urls = Array.isArray(obj.urlset.url) ? obj.urlset.url : [obj.urlset.url];
        urls.forEach(u => {
          let l = u.loc.replace(domain, '');
          if (!l.startsWith('/')) l = '/' + l;
          sitemapUrls.add(l);
        });
      }
    }
  } catch(e) {}

  for (const path of paths) {
      const url = domain + path;
      const res = await fetch(url, { redirect: 'manual' });
      const status = res.status;
      const loc = res.headers.get('location');
      
      let robots = 'MISSING';
      let canonical = 'MISSING';
      if (status === 200) {
          const html = await res.text();
          const $ = cheerio.load(html);
          robots = $('meta[name="robots"]').attr('content') || 'MISSING';
          canonical = $('link[rel="canonical"]').attr('href') || 'MISSING';
          canonical = canonical.replace(domain, '');
      }
      
      const inSitemap = sitemapUrls.has(path) ? 'DA' : 'NU';
      
      console.log(`LIVE: ${path} | HTTP: ${status} | robots: ${robots} | canonical: ${canonical} | in_sitemap: ${inSitemap} | loc: ${loc || 'N/A'}`);
  }
}

run();
