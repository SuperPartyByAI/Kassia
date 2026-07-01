require('dotenv').config({path: '.env.local'});
const { execSync } = require('child_process');

async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 'apikey': key, 'Authorization': 'Bearer ' + key };

  console.log("=== 1. DNS / IP / ROUTING ===");
  const cmds1 = [
    'dig www.kassia.ro +short',
    'dig kassia.ro +short',
    'nslookup www.kassia.ro',
    'curl -sI https://www.kassia.ro/animatori-scoala-bucuresti/',
    'curl -sI https://kassia.ro/animatori-scoala-bucuresti/'
  ];
  for (const cmd of cmds1) {
    console.log(`\n> ${cmd}`);
    try { console.log(execSync(cmd).toString()); } catch(e) { console.log(e.toString()); }
  }

  console.log("\n=== 2. COMPARĂ HOST ȘI URL EXACT ===");
  const grepPattern = "<title>|Animatori pentru petreceri și serbări școlare|Animatori Petreceri Copii animatori scoala|în animatori scoala|De ce să alegi animatori pentru animatori scoala|Cât timp stă un animator la o petrecere în animatori scoala";
  const cmds2 = [
    `curl -sL https://www.kassia.ro/animatori-scoala-bucuresti/ | grep -Ei "${grepPattern}" || true`,
    `curl -sL https://kassia.ro/animatori-scoala-bucuresti/ | grep -Ei "${grepPattern}" || true`,
    `curl -sL "https://www.kassia.ro/animatori-scoala-bucuresti/?nocache=$(date +%s)" | grep -Ei "${grepPattern}" || true`
  ];
  for (const cmd of cmds2) {
    console.log(`\n> ${cmd}`);
    try { console.log(execSync(cmd).toString()); } catch(e) { console.log(e.toString()); }
  }

  console.log("\n=== 3. VERIFICĂ DACĂ EXISTĂ SERVICE WORKER ===");
  const cmds3 = [
    'curl -sL https://www.kassia.ro/ | grep -Ei "serviceWorker|navigator.serviceWorker|sw.js|workbox|manifest" || true',
    'curl -sI https://www.kassia.ro/sw.js || true',
    'curl -sI https://www.kassia.ro/service-worker.js || true',
    'curl -sI https://www.kassia.ro/manifest.webmanifest || true'
  ];
  for (const cmd of cmds3) {
    console.log(`\n> ${cmd}`);
    try { console.log(execSync(cmd).toString()); } catch(e) { console.log(e.toString()); }
  }

  console.log("\n=== 4. VERIFICĂ SERVER / PM2 ===");
  console.log("Observație: Suntem într-un workspace de dezvoltare local. Nu avem acces direct la PM2-ul instanței de producție (Ubuntu) care hostează domeniul kassia.ro.");

  console.log("\n=== 5. DB CONFIRMATION CU ROW CARE SERVEȘTE LIVE ===");
  const dbRes = await fetch(`${url}/rest/v1/kassia_pages?or=(slug.eq.animatori-scoala-bucuresti,path.eq./animatori-scoala-bucuresti/)&select=id,path,slug,title,meta_title,meta_description,h1,status,index_status,include_in_sitemap,page_type,updated_at`, { headers });
  console.log(JSON.stringify(await dbRes.json(), null, 2));
}
run();
