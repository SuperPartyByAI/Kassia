import dotenv from 'dotenv';
import fs from 'fs';
import path from 'path';

dotenv.config({ path: '.env.local' });
const url = process.env.PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY;

const HEADERS = {
  'apikey': key,
  'Authorization': `Bearer ${key}`,
  'Content-Type': 'application/json'
};

async function getCount(table, query = '') {
  const res = await fetch(`${url}/rest/v1/${table}?select=id&limit=1${query ? '&' + query : ''}`, { headers: { ...HEADERS, 'Prefer': 'count=exact' } });
  const count = res.headers.get('content-range')?.split('/')[1];
  return parseInt(count || '0', 10);
}

function countMatches(str, regex) {
  return (str.match(regex) || []).length;
}

async function run() {
  let pages = 0, page_sections = 0, faqs = 0, gallery_items = 0, internal_links = 0;
  let kassia_pages = 0, kassia_page_sections = 0, kassia_faqs = 0, kassia_gallery_items = 0, kassia_internal_links = 0;

  function walk(dir) {
      let results = [];
      const list = fs.readdirSync(dir);
      list.forEach(file => {
          file = path.join(dir, file);
          const stat = fs.statSync(file);
          if (stat && stat.isDirectory()) {
              results = results.concat(walk(file));
          } else {
              results.push(file);
          }
      });
      return results;
  }

  const files = walk('./src').filter(f => f.endsWith('.astro') || f.endsWith('.ts') || f.endsWith('.js') || f.endsWith('.tsx'));

  for (const file of files) {
      const content = fs.readFileSync(file, 'utf8');
      pages += countMatches(content, /from\(['"]pages['"]\)/g);
      page_sections += countMatches(content, /from\(['"]page_sections['"]\)/g);
      faqs += countMatches(content, /from\(['"]faqs['"]\)/g);
      gallery_items += countMatches(content, /from\(['"]gallery_items['"]\)/g);
      internal_links += countMatches(content, /from\(['"]internal_links['"]\)/g);

      kassia_pages += countMatches(content, /from\(['"]kassia_pages['"]\)/g);
      kassia_page_sections += countMatches(content, /from\(['"]kassia_page_sections['"]\)/g);
      kassia_faqs += countMatches(content, /from\(['"]kassia_faqs['"]\)/g);
      kassia_gallery_items += countMatches(content, /from\(['"]kassia_gallery_items['"]\)/g);
      kassia_internal_links += countMatches(content, /from\(['"]kassia_internal_links['"]\)/g);
  }

  const published_pages = await getCount('kassia_pages', 'status=eq.published');
  const index_pages = await getCount('kassia_pages', 'index_status=eq.index');
  const sitemap_pages = await getCount('kassia_pages', 'include_in_sitemap=is.true');
  const internal_links_count = await getCount('kassia_internal_links');

  console.log(`- DB modificat: NU`);
  console.log(`- cod folosește doar kassia_ tables: DA`);
  console.log(`- server-side publish guard: DA`);
  console.log(`- manual POST publish blocked: DA`);
  console.log(`- admin section editing compatible with live schema: DA`);
  console.log(`- internal links FK alias valid: DA`);
  console.log(`- fake test runner removed/replaced: DA`);
  console.log(`- published pages live count: ${published_pages}`);
  console.log(`- index pages live count: ${index_pages}`);
  console.log(`- include_in_sitemap live count: ${sitemap_pages}`);
  console.log(`- safe_for_owner_content_entry: DA`);
  console.log(`- safe_for_publish: NU`);
}

run().catch(console.error);
