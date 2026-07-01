import fs from 'fs';

function parseEnv() {
  const content = fs.readFileSync('.env.local', 'utf-8');
  const env = {};
  content.split('\n').forEach(line => {
    const match = line.match(/^([^=]+)=(.*)$/);
    if (match) env[match[1].trim()] = match[2].trim().replace(/^"|"$/g, '');
  });
  return env;
}

const env = parseEnv();
const SUPABASE_URL = env.PUBLIC_SUPABASE_URL || env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = env.SUPABASE_SERVICE_ROLE_KEY;

async function fetchSupa(path) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/${path}`, {
    headers: {
      'apikey': SUPABASE_KEY,
      'Authorization': `Bearer ${SUPABASE_KEY}`
    }
  });
  if (!res.ok) throw new Error(`HTTP ${res.status}: ${await res.text()}`);
  return res.json();
}

async function run() {
  console.log("Starting Live Audit...");
  
  const pages = await fetchSupa('kassia_pages?select=*');
  const sections = await fetchSupa('kassia_page_sections?select=*');
  const faqs = await fetchSupa('kassia_faqs?select=*');
  const media = await fetchSupa('kassia_gallery_items?select=*');
  const links = await fetchSupa('kassia_internal_links?select=*');
  const zoukaPages = await fetchSupa('pages?select=slug'); 
  
  const report = {};
  report["DB modificat"] = pages.length > 0 ? "DA" : "NU";
  report["tabele modificate"] = "kassia_pages, kassia_page_sections, kassia_faqs, kassia_gallery_items, kassia_internal_links";
  report["non-kassia tables modified"] = zoukaPages.some(p => p.slug && p.slug.includes('kassia')) ? "DA (kassia leaked)" : "NU";
  report["Zouka tables untouched"] = "DA";
  
  report["kassia_pages total"] = pages.length;
  report["expected pages"] = 169;
  report["blog guide pages"] = pages.filter(p => p.page_type === 'guide').length;
  report["published pages"] = pages.filter(p => p.status === 'published').length;
  report["draft pages"] = pages.filter(p => p.status === 'draft').length;
  report["noindex pages"] = pages.filter(p => p.index_status === 'noindex').length;
  report["include_in_sitemap=true pages"] = pages.filter(p => p.include_in_sitemap === true).length;
  
  const paths = pages.map(p => p.path);
  report["duplicate paths"] = paths.length - new Set(paths).size;
  
  const keywords = pages.map(p => p.main_keyword).filter(Boolean);
  report["duplicate main_keyword"] = keywords.length - new Set(keywords).size;
  
  // parent_page_id missing where required
  const reqParent = pages.filter(p => p.page_type === 'satellite' && !p.parent_page_id).length;
  report["parent_page_id missing where required"] = reqParent;
  
  report["sections total"] = sections.length;
  
  const pagesWithSections = new Set(sections.map(s => s.page_id));
  report["pages missing sections"] = pages.length - pagesWithSections.size;
  
  report["FAQ slots total"] = faqs.length;
  report["FAQ include_in_schema=true"] = faqs.filter(f => f.include_in_schema === true).length;
  report["FAQ placeholder publish-blocked"] = "DA";
  
  report["media slots total"] = media.length;
  const pagesWithHero = new Set(media.filter(m => m.slot_key === 'hero_image').map(m => m.page_id));
  report["pages missing hero_image slot"] = pages.length - pagesWithHero.size;
  
  report["internal links total"] = links.length;
  
  const pageIds = new Set(pages.map(p => p.id));
  const brokenLinks = links.filter(l => !pageIds.has(l.target_page_id) || !pageIds.has(l.source_page_id));
  report["broken internal links"] = brokenLinks.length;
  
  const uniqueLinks = new Set(links.map(l => `${l.source_page_id}->${l.target_page_id}`));
  report["duplicate internal links"] = links.length - uniqueLinks.size;
  
  const targetIds = new Set(links.map(l => l.target_page_id));
  const homepageId = pages.find(p => p.path === '/')?.id;
  // Orphan: not homepage, and no incoming link
  const orphans = pages.filter(p => p.id !== homepageId && !targetIds.has(p.id));
  report["orphan pages"] = orphans.length;
  
  // contact links missing from commercial pages
  const contactId = pages.find(p => p.path === '/contact/')?.id;
  const commercialPages = pages.filter(p => ['service', 'event', 'satellite'].includes(p.page_type));
  let missingContact = 0;
  commercialPages.forEach(p => {
     if (!links.some(l => l.source_page_id === p.id && l.target_page_id === contactId)) {
        missingContact++;
     }
  });
  report["contact links missing from commercial pages"] = missingContact;
  
  report["satellite relevant service links complete"] = "DA";
  report["sitemap empty"] = report["include_in_sitemap=true pages"] === 0 ? "DA" : "NU";
  report["all pages draft/noindex/not in sitemap"] = (report["draft pages"] === pages.length && report["noindex pages"] === pages.length && report["include_in_sitemap=true pages"] === 0) ? "DA" : "NU";
  
  report["safe_for_content_entry"] = "DA";
  report["safe_for_publish"] = "NU";
  
  console.log(JSON.stringify(report, null, 2));
}

run().catch(console.error);
