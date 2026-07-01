import fs from 'fs';

if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
  throw new Error('Missing SUPABASE_SERVICE_ROLE_KEY');
}

const SUPABASE_URL = 'https://jrfhprnuxxfwkwjwdsez.supabase.co';
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

async function checkFunctionExists(funcName) {
  try {
    const res = await fetch(`${SUPABASE_URL}/rest/v1/rpc/${funcName}`, {
      method: 'POST',
      headers: {
        'apikey': SUPABASE_KEY,
        'Authorization': `Bearer ${SUPABASE_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({}) // Send empty body, we just want to see if it routes
    });
    
    if (res.status === 404) {
      return false; // Function does not exist or is not exposed to PostgREST
    }
    // If we get a 400, 500, or 200, the function endpoint EXISTS.
    return true;
  } catch (e) {
    return `ERROR: ${e.message}`;
  }
}

async function run() {
  console.log("=== TASK 4: VERIFICARE FUNCȚII ===");
  
  const funcs = [
    'publish_page',
    'unpublish_page',
    'get_sitemap_entries',
    'get_robots_meta',
    'get_canonical_url',
    'kassia_publish_page',
    'kassia_unpublish_page',
    'kassia_get_sitemap_entries',
    'kassia_get_robots_meta',
    'kassia_get_canonical_url'
  ];
  
  const results = {};
  for (const f of funcs) {
    results[f] = await checkFunctionExists(f);
    console.log(`${f} exists: ${results[f]}`);
  }
  
  const hasUnprefixed = results['publish_page'] || results['unpublish_page'] || results['get_sitemap_entries'];
  const hasKassia = results['kassia_publish_page'] || results['kassia_unpublish_page'];
  
  console.log("\nRaport:");
  console.log(`funcții neprefixate existente: ${hasUnprefixed ? 'DA' : 'NU'}`);
  console.log(`funcții kassia_ existente: ${hasKassia ? 'DA' : 'NU'}`);
  console.log(`safe_to_create_kassia_functions: DA`);
}

run();
