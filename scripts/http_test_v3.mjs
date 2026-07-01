import { spawn, execSync } from 'child_process';
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

async function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function runTests() {
  console.log('Fetching contact page ID...');
  const pages = await fetchSupabaseData('kassia_pages', 'select=id,path&path=eq./contact/&limit=1');
  const contactId = pages[0].id;

  console.log('Starting Astro server via bash with NVM...');
  // We use bash to load NVM and run astro dev
  const bashScript = `
    source ~/.nvm/nvm.sh
    nvm use 22
    npx astro dev --port 4321
  `;
  const server = spawn('bash', ['-c', bashScript], { cwd: process.cwd(), stdio: 'pipe' });
  
  // Wait for server to be ready
  await sleep(10000); 
  console.log('Server assumed ready. Testing HTTP routes...');

  const BASE_URL = 'http://localhost:4321';
  const BATCH_1_ROUTES = [
    '/contact/',
    '/preturi-decoratiuni-baloane/',
    '/decoratiuni-baloane-bucuresti/',
    '/arcada-baloane-bucuresti/',
    '/baloane-heliu-bucuresti/'
  ];

  let passed = true;

  // 1. Test Public Routes
  for (const route of BATCH_1_ROUTES) {
    try {
      const res = await fetch(`${BASE_URL}${route}`);
      if (res.status === 404) {
        console.log(`✅ Public route ${route} returned 404`);
      } else {
        console.log(`❌ Public route ${route} returned ${res.status}`);
        passed = false;
      }
    } catch (e) {
      console.log(`❌ Error fetching ${route}: ${e.message}`);
      passed = false;
    }
  }

  // 2. Test Sitemap
  try {
    const res = await fetch(`${BASE_URL}/sitemap.xml`);
    const xml = await res.text();
    if (res.status === 200 && !xml.includes('<loc>')) {
      console.log(`✅ Sitemap is clean (no urls exposed)`);
    } else {
      console.log(`❌ Sitemap issue! HTTP ${res.status}. Exposes loc? ${xml.includes('<loc>')}`);
      passed = false;
    }
  } catch (e) {
    console.log(`❌ Error fetching sitemap: ${e.message}`);
    passed = false;
  }

  // 3. Test Admin Preview Route
  try {
    const res = await fetch(`${BASE_URL}/admin/pages/${contactId}`);
    if (res.status === 200) {
      const html = await res.text();
      if (html.includes('Edit Page')) {
         console.log(`✅ Admin route /admin/pages/${contactId} loaded successfully`);
      } else {
         console.log(`❌ Admin route loaded but invalid content`);
         passed = false;
      }
    } else {
      console.log(`❌ Admin route returned ${res.status}`);
      passed = false;
    }
  } catch (e) {
    console.log(`❌ Error fetching admin route: ${e.message}`);
    passed = false;
  }

  // 4. Test Server-Side Publish Guard via POST
  try {
    console.log('Sending manual POST to publish contact page...');
    const formData = new URLSearchParams();
    formData.append('action', 'publish_page');
    
    const res = await fetch(`${BASE_URL}/admin/pages/${contactId}`, {
      method: 'POST',
      body: formData,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    });
    
    const html = await res.text();
    if (html.includes('Publish blocked')) {
      console.log(`✅ Server-Side Publish Guard BLOCKED manual POST successfully`);
    } else {
      console.log(`❌ Server-Side Publish Guard FAILED to block POST!`);
      passed = false;
    }
  } catch (e) {
    console.log(`❌ Error posting to admin route: ${e.message}`);
    passed = false;
  }
  
  // 5. Verify DB remains 0 published
  try {
    const published = await fetchSupabaseData('kassia_pages', 'select=id&status=eq.published&limit=1');
    if (published.length === 0) {
      console.log(`✅ DB Verification: Published pages count is 0`);
    } else {
      console.log(`❌ DB Verification FAILED: Published pages count is > 0`);
      passed = false;
    }
  } catch (e) {
    console.log(`❌ Error fetching published pages: ${e.message}`);
    passed = false;
  }

  console.log('Stopping server...');
  server.kill();
  execSync('killall node || true'); // Make sure everything is dead
  
  if (passed) console.log('✅ ALL HTTP TESTS PASSED');
  else console.log('❌ SOME HTTP TESTS FAILED');
  process.exit(passed ? 0 : 1);
}

runTests().catch(console.error);
