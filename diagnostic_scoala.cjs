require('dotenv').config({path: '.env.local'});
const { execSync } = require('child_process');

async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 'apikey': key, 'Authorization': 'Bearer ' + key };
  const pageId = 'f0b39e18-af00-404b-ba33-e433aef8b982';

  console.log("=== DB DIAGNOSTIC ===");
  // 1. kassia_pages
  const pRes = await fetch(`${url}/rest/v1/kassia_pages?id=eq.${pageId}&select=id,path,slug,title,meta_title,meta_description,h1,status,index_status,include_in_sitemap,page_type,updated_at`, { headers });
  console.log("1. kassia_pages:\n", JSON.stringify(await pRes.json(), null, 2));

  // 2. kassia_page_sections
  const sRes = await fetch(`${url}/rest/v1/kassia_page_sections?page_id=eq.${pageId}&select=id,page_id,section_type,heading,content,order_index,updated_at&order=order_index.asc`, { headers });
  console.log("\n2. kassia_page_sections:\n", JSON.stringify(await sRes.json(), null, 2));

  // 3. kassia_faqs
  const fRes = await fetch(`${url}/rest/v1/kassia_faqs?page_id=eq.${pageId}&select=id,page_id,question,answer,order_index,updated_at&order=order_index.asc`, { headers });
  console.log("\n3. kassia_faqs:\n", JSON.stringify(await fRes.json(), null, 2));

  console.log("\n=== LIVE VERIFICATION ===");
  const targetUrl = 'https://www.kassia.ro/animatori-scoala-bucuresti/';
  const pattern = "Animatori pentru petreceri și serbări școlare în București|Animatori școală București|Programe interactive și animatori pentru școli|De ce să alegi animatori pentru petrecerile școlare|Programează un eveniment memorabil pentru clasa ta|Cât timp stă un animator la o petrecere școlară în București|Animatori Petreceri Copii animatori scoala bucuresti|Cauți animatori pentru petreceri copii în animatori scoala bucuresti|De ce să alegi animatori pentru animatori scoala bucuresti|Rezervă acum pentru petrecerea ta în animatori scoala bucuresti|Cât timp stă un animator la o petrecere în animatori scoala bucuresti";
  
  const commands = [
    { name: "Normal", cmd: `curl -sL ${targetUrl} | grep -Ei "${pattern}" || true` },
    { name: "No-Cache", cmd: `curl -sL -H "Cache-Control: no-cache" -H "Pragma: no-cache" ${targetUrl} | grep -Ei "${pattern}" || true` },
    { name: "Googlebot", cmd: `curl -sL -A "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" ${targetUrl} | grep -Ei "${pattern}" || true` },
    { name: "Headers", cmd: `curl -sI ${targetUrl}` }
  ];

  for (const c of commands) {
    console.log(`\n> [${c.name}]`);
    try {
      console.log(execSync(c.cmd).toString());
    } catch(e) {
      console.log(e.toString());
    }
  }
}
run();
