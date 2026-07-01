require('dotenv').config({path: '.env.local'});
const { execSync } = require('child_process');

async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 'apikey': key, 'Authorization': 'Bearer ' + key };
  const pageId = 'f0b39e18-af00-404b-ba33-e433aef8b982';

  console.log("=== 1. SELECT DB pentru pagina ===");
  const pRes = await fetch(`${url}/rest/v1/kassia_pages?id=eq.${pageId}&select=id,path,slug,title,meta_title,meta_description,h1,status,index_status,include_in_sitemap,page_type,updated_at`, { headers });
  console.log(JSON.stringify(await pRes.json(), null, 2));

  console.log("\n=== 2. SELECT DB pentru duplicate ===");
  const dupRes = await fetch(`${url}/rest/v1/kassia_pages?slug=ilike.*scoala*&select=id,path,slug,title,meta_title,h1,status,index_status,include_in_sitemap,updated_at`, { headers });
  console.log(JSON.stringify(await dupRes.json(), null, 2));

  console.log("\n=== 3. SELECT sections ===");
  const sRes = await fetch(`${url}/rest/v1/kassia_page_sections?page_id=eq.${pageId}&select=id,page_id,section_type,heading,content,order_index,updated_at&order=order_index.asc`, { headers });
  console.log(JSON.stringify(await sRes.json(), null, 2));

  console.log("\n=== 4. SELECT FAQs ===");
  const fRes = await fetch(`${url}/rest/v1/kassia_faqs?page_id=eq.${pageId}&select=id,page_id,question,answer,order_index,updated_at&order=order_index.asc`, { headers });
  console.log(JSON.stringify(await fRes.json(), null, 2));

  console.log("\n=== 5. Verifica cache ===");
  try {
    const output = execSync('find . -type f -name "*scoala*.html"').toString();
    console.log(output || 'Nu s-a gasit niciun build HTML static');
  } catch(e) {
    console.log('Eroare cautare build');
  }

  const targetUrl = 'https://www.kassia.ro/animatori-scoala-bucuresti/';
  const pattern = "Animatori pentru petreceri și serbări școlare|Animatori Petreceri Copii animatori scoala|în animatori scoala|De ce să alegi animatori pentru petrecerile școlare|De ce să alegi animatori pentru animatori scoala|Cât timp stă un animator la o petrecere școlară|Cât timp stă un animator la o petrecere în animatori scoala";
  
  console.log("\n=== 6. Verifica headers ===");
  try { console.log(execSync(`curl -sI ${targetUrl}`).toString()); } catch(e){}

  console.log("\n=== 7. Verifica cache-busting ===");
  try { console.log(execSync(`curl -sL "${targetUrl}?verify=$(date +%s)" | grep -Ei "${pattern}" || true`).toString()); } catch(e){}

  console.log("\n=== 8. Verifica URL brut ===");
  try { console.log(execSync(`curl -sL ${targetUrl} | grep -Ei "${pattern}" || true`).toString()); } catch(e){}

  console.log("\n=== 9. Verifica Googlebot ===");
  try { console.log(execSync(`curl -sL -A "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" ${targetUrl} | grep -Ei "${pattern}" || true`).toString()); } catch(e){}
}
run();
