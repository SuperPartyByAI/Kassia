import { spawn } from 'child_process';
import fetch from 'node-fetch'; // Requires node-fetch if Node < 18, but Node 20 has native fetch. We will use native fetch.

async function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function runTests() {
  console.log('Starting Astro server...');
  const server = spawn('npm', ['run', 'dev'], { cwd: process.cwd(), stdio: 'pipe' });
  
  // Wait for server to be ready
  await sleep(5000); // Wait 5 seconds for Astro to start
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

  // 1. Test Public Routes (should be 404 since they are drafts)
  for (const route of BATCH_1_ROUTES) {
    try {
      const res = await fetch(`${BASE_URL}${route}`);
      if (res.status === 404) {
        console.log(`✅ Public route ${route} returned 404 (Correct for draft)`);
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
    if (!xml.includes('<loc>')) {
      console.log(`✅ Sitemap is clean (0 urls exposed)`);
    } else {
      console.log(`❌ Sitemap exposed URLs!`);
      passed = false;
    }
  } catch (e) {
    console.log(`❌ Error fetching sitemap: ${e.message}`);
    passed = false;
  }

  // 3. Test Admin Routes
  // We need to fetch the admin route. Admin route is `/admin/pages/[id]`.
  // First we need to find an ID. Let's use Supabase to get the ID for /contact/.
  // Wait, I can just query Supabase using the existing fetch script to get the ID.
  
  console.log('Stopping server...');
  server.kill();
  
  if (passed) console.log('HTTP Test PASSED');
  else console.log('HTTP Test FAILED');
  process.exit(passed ? 0 : 1);
}

runTests().catch(console.error);
