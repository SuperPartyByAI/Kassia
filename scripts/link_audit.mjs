import fs from 'fs';
import path from 'path';

const ENV_PATH = path.join(process.cwd(), '.env.local');
let SUPABASE_URL = '';
let SUPABASE_KEY = '';

if (fs.existsSync(ENV_PATH)) {
  const envContent = fs.readFileSync(ENV_PATH, 'utf-8');
  envContent.split('\n').forEach(line => {
    if (line.startsWith('PUBLIC_SUPABASE_URL=')) SUPABASE_URL = line.split('=')[1].trim();
    if (line.startsWith('VITE_SUPABASE_URL=')) SUPABASE_URL = line.split('=')[1].trim();
    if (line.startsWith('SUPABASE_SERVICE_ROLE_KEY=')) SUPABASE_KEY = line.split('=')[1].trim();
    if (line.startsWith('VITE_SUPABASE_ANON_KEY=')) SUPABASE_KEY = line.split('=')[1].trim();
  });
}

async function fetchSupabaseData(table) {
  const url = `${SUPABASE_URL}/rest/v1/${table}?select=*`;
  const res = await fetch(url, {
    headers: {
      'apikey': SUPABASE_KEY,
      'Authorization': `Bearer ${SUPABASE_KEY}`
    }
  });
  if (!res.ok) throw new Error(`Supabase error: ${res.status} ${res.statusText}`);
  return await res.json();
}

async function runAudit() {
  console.log('Fetching live DB data...');
  const pages = await fetchSupabaseData('kassia_pages');
  const links = await fetchSupabaseData('kassia_internal_links');
  const seoMap = await fetchSupabaseData('kassia_seo_map');

  const pageIds = new Set(pages.map(p => p.id));
  const paths = pages.map(p => p.path);
  const duplicatePaths = paths.filter((item, index) => paths.indexOf(item) !== index);
  
  const keywords = seoMap.map(s => s.main_keyword);
  const duplicateKeywords = keywords.filter((item, index) => keywords.indexOf(item) !== index);

  let brokenLinks = 0;
  let duplicateLinks = 0;
  const linkSet = new Set();
  
  for (const link of links) {
    if (!pageIds.has(link.source_page_id) || !pageIds.has(link.target_page_id)) {
      brokenLinks++;
    }
    const sig = `${link.source_page_id}->${link.target_page_id}`;
    if (linkSet.has(sig)) duplicateLinks++;
    linkSet.add(sig);
  }

  // Commercial pages
  const commercialTypes = ['service_pillar', 'service', 'event', 'location', 'satellite'];
  const commercialPages = pages.filter(p => commercialTypes.includes(p.page_type));
  
  let missingContact = 0;
  const contactPage = pages.find(p => p.path === '/contact/');
  
  for (const page of commercialPages) {
    const hasContact = links.some(l => l.source_page_id === page.id && l.target_page_id === contactPage?.id);
    if (!hasContact) missingContact++;
  }

  // Orphans
  let orphans = 0;
  for (const page of commercialPages) {
    if (page.page_type === 'satellite') {
      const isTarget = links.some(l => l.target_page_id === page.id);
      if (!isTarget) orphans++;
    }
  }

  console.log(`Pages: ${pages.length}`);
  console.log(`Links: ${links.length} (Expected 914, difference is ${914 - links.length})`);
  console.log(`Duplicate paths: ${duplicatePaths.length}`);
  console.log(`Duplicate keywords: ${duplicateKeywords.length}`);
  console.log(`Broken links: ${brokenLinks}`);
  console.log(`Duplicate links: ${duplicateLinks}`);
  console.log(`Commercial orphans: ${orphans}`);
  console.log(`Commercial without contact: ${missingContact}`);
}

runAudit().catch(console.error);
