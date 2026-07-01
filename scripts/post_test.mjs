
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

async function fetchSupabaseData(table, query='') {
  const url = `${SUPABASE_URL}/rest/v1/${table}?${query}`;
  const res = await fetch(url, {
    headers: {
      'apikey': SUPABASE_KEY,
      'Authorization': `Bearer ${SUPABASE_KEY}`
    }
  });
  if (!res.ok) throw new Error(`Supabase error: ${res.status} ${res.statusText}`);
  return await res.json();
}

async function runTest() {
  console.log('Fetching contact page ID...');
  const pages = await fetchSupabaseData('kassia_pages', 'select=id,path,status,index_status,include_in_sitemap');
  const contactPage = pages.find(p => p.path === '/contact/');
  const contactId = contactPage.id;

  const publishedBefore = pages.filter(p => p.status === 'published').length;
  
  console.log('Sending manual POST to Astro server...');
  const formData = new URLSearchParams();
  formData.append('action', 'publish_page');

  let responseBody = '';
  let status = 0;
  
  try {
    const res = await fetch(`http://localhost:4321/admin/pages/${contactId}`, {
      method: 'POST',
      body: formData,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Origin': 'http://localhost:4321',
        'Referer': `http://localhost:4321/admin/pages/${contactId}`
      }
    });
    
    status = res.status;
    responseBody = await res.text();
  } catch (e) {
    console.error('Fetch failed:', e);
    return;
  }

  const blockedByCSRF = responseBody.includes('Cross-site POST form submissions are forbidden') || status === 403;
  const blockedByGuard = responseBody.includes('Publish blocked');

  console.log(`HTTP status returned: ${status}`);
  console.log(`blocked by CSRF: ${blockedByCSRF ? 'DA' : 'NU'}`);
  console.log(`blocked by Publish Guard: ${blockedByGuard ? 'DA' : 'NU'}`);
  console.log(`response includes Publish blocked: ${blockedByGuard ? 'DA' : 'NU'}`);

  const pagesAfter = await fetchSupabaseData('kassia_pages', 'select=id,status,index_status,include_in_sitemap');
  const publishedAfter = pagesAfter.filter(p => p.status === 'published').length;
  const indexAfter = pagesAfter.filter(p => p.index_status === 'index').length;
  const sitemapAfter = pagesAfter.filter(p => p.include_in_sitemap === true).length;

  console.log(`published before: ${publishedBefore}`);
  console.log(`published after: ${publishedAfter}`);
  console.log(`index after: ${indexAfter}`);
  console.log(`sitemap after: ${sitemapAfter}`);
}

runTest().catch(console.error);
