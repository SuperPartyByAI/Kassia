require('dotenv').config({path: '.env.local'});
const { execSync } = require('child_process');
const fs = require('fs');

async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 'apikey': key, 'Authorization': 'Bearer ' + key };

  const ids = [
    '5db0f1e1-9216-405a-bea7-763351bdc547',
    '5cba33fc-2418-445e-9da0-9e1ce0de6162',
    '28d7ab75-8feb-4261-954b-ae2e06051f22',
    '4f0fd25f-647c-4013-a504-4dc71658529d'
  ];

  console.log("=== 1. SELECT DB - kassia_pages ===");
  const pages = await (await fetch(`${url}/rest/v1/kassia_pages?id=in.(${ids.join(',')})&select=id,path,slug,title,meta_title,meta_description,h1,status,index_status,include_in_sitemap,page_type,updated_at`, { headers })).json();
  console.log(JSON.stringify(pages, null, 2));

  console.log("\n=== 2. SELECT DB - duplicate slug/path ===");
  const dupQ = `slug.ilike.*dinozauri*,slug.ilike.*unicorn*,slug.ilike.*jungla*,slug.ilike.*spatiu*,path.ilike.*dinozauri*,path.ilike.*unicorn*,path.ilike.*jungla*,path.ilike.*spatiu*`;
  const duplicates = await (await fetch(`${url}/rest/v1/kassia_pages?or=(${dupQ})&select=id,path,slug,title,meta_title,h1,status,index_status,include_in_sitemap,updated_at`, { headers })).json();
  console.log(JSON.stringify(duplicates, null, 2));

  console.log("\n=== 3. SELECT DB - kassia_page_sections ===");
  const sections = await (await fetch(`${url}/rest/v1/kassia_page_sections?page_id=in.(${ids.join(',')})&select=id,page_id,section_type,heading,content,order_index,updated_at&order=page_id.asc,order_index.asc`, { headers })).json();
  console.log(JSON.stringify(sections, null, 2));

  console.log("\n=== 4. SELECT DB - kassia_faqs ===");
  const faqs = await (await fetch(`${url}/rest/v1/kassia_faqs?page_id=in.(${ids.join(',')})&select=id,page_id,question,answer,order_index,updated_at&order=page_id.asc,order_index.asc`, { headers })).json();
  console.log(JSON.stringify(faqs, null, 2));

  console.log("\n=== 5. VERIFICARE LIVE MULTI-SURSĂ CU CACHE-BUSTING ===");
  const slugs = [
    'animatori-tematica-dinozauri-bucuresti',
    'animatori-tematica-unicorn-bucuresti',
    'animatori-tematica-jungla-bucuresti',
    'animatori-tematica-spatiu-bucuresti'
  ];

  for (const s of slugs) {
    console.log(`\n--- ${s} ---`);
    const cmds = [
      `curl -sL https://www.kassia.ro/${s}/ | grep -Ei "<title>|Animatori cu tematică|Animatori Petreceri Copii animatori|Cauți animatori pentru petreceri copii în animatori|De ce să alegi animatori pentru animatori|Rezervă acum pentru petrecerea ta în animatori|Cât timp stă un animator la o petrecere în animatori" || true`,
      `curl -sL -H "Cache-Control: no-cache" -H "Pragma: no-cache" https://www.kassia.ro/${s}/ | grep -Ei "<title>|Animatori cu tematică|Animatori Petreceri Copii animatori|Cauți animatori pentru petreceri copii în animatori|De ce să alegi animatori pentru animatori|Rezervă acum pentru petrecerea ta în animatori|Cât timp stă un animator la o petrecere în animatori" || true`,
      `curl -sL "https://www.kassia.ro/${s}/?verify=$(date +%s)" | grep -Ei "<title>|Animatori cu tematică|Animatori Petreceri Copii animatori|Cauți animatori pentru petreceri copii în animatori|De ce să alegi animatori pentru animatori|Rezervă acum pentru petrecerea ta în animatori|Cât timp stă un animator la o petrecere în animatori" || true`,
      `curl -sL -A "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" https://www.kassia.ro/${s}/ | grep -Ei "<title>|Animatori cu tematică|Animatori Petreceri Copii animatori|Cauți animatori pentru petreceri copii în animatori|De ce să alegi animatori pentru animatori|Rezervă acum pentru petrecerea ta în animatori|Cât timp stă un animator la o petrecere în animatori" || true`,
      `curl -sI https://www.kassia.ro/${s}/`
    ];
    for (const cmd of cmds) {
      console.log(`> ${cmd}`);
      try {
        console.log(execSync(cmd).toString().trim() || "No output");
      } catch (e) {
        console.log("Error running command");
      }
    }
  }
}

run();
