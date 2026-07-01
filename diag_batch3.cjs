require('dotenv').config({path: '.env.local'});
const fs = require('fs');
const { execSync } = require('child_process');

async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 'apikey': key, 'Authorization': 'Bearer ' + key };

  const ids = [
    'c0879b60-7f8d-4be2-af4b-ef1fad77a1cd',
    'b7038460-b34d-4b2d-ba76-d448a6e8fd84',
    '44ccceb6-1404-4438-84ea-f7e51debe94e',
    'b43ba441-ec9a-45c2-b059-3d73f977eb77',
    'bfbd95fb-2166-456f-83f3-0b97a7ce1885'
  ];

  const slugs = [
    'animatori-clovni-bucuresti',
    'animatori-copii-la-restaurant-bucuresti',
    'animatori-eveniment-corporate-copii-bucuresti',
    'animatori-evenimente-copii-bucuresti',
    'animatori-mot-turta-bucuresti'
  ];

  const beforeData = JSON.parse(fs.readFileSync('/tmp/batch3_data.json'));
  
  console.log("=== 3. SELECT DB BEFORE / AFTER (kassia_pages) ===");
  for (const id of ids) {
    const after = await (await fetch(`${url}/rest/v1/kassia_pages?id=eq.${id}&select=id,title,h1,meta_description,index_status,include_in_sitemap`, { headers })).json();
    console.log(`\nPage ID: ${id}`);
    console.log(`BEFORE Title: ${beforeData[id].page.title}`);
    console.log(`AFTER  Title: ${after[0].title}`);
    console.log(`BEFORE H1: ${beforeData[id].page.h1}`);
    console.log(`AFTER  H1: ${after[0].h1}`);
    console.log(`BEFORE MetaDesc: ${beforeData[id].page.meta_description}`);
    console.log(`AFTER  MetaDesc: ${after[0].meta_description}`);
  }

  console.log("\n=== 4. SELECT DB BEFORE / AFTER (kassia_page_sections) ===");
  for (const id of ids) {
    const after = await (await fetch(`${url}/rest/v1/kassia_page_sections?page_id=eq.${id}&select=id,heading,content&order=order_index.asc`, { headers })).json();
    console.log(`\nPage ID: ${id}`);
    for (let i = 0; i < after.length; i++) {
      const bSec = beforeData[id].sections.find(s => s.id === after[i].id);
      if (bSec && bSec.heading !== after[i].heading) {
        console.log(`Section ${after[i].id}`);
        console.log(`  BEFORE: ${bSec.heading}`);
        console.log(`  AFTER:  ${after[i].heading}`);
      }
    }
  }

  console.log("\n=== 5. SELECT DB BEFORE / AFTER (kassia_faqs) ===");
  for (const id of ids) {
    const after = await (await fetch(`${url}/rest/v1/kassia_faqs?page_id=eq.${id}&select=id,question,answer&order=order_index.asc`, { headers })).json();
    console.log(`\nPage ID: ${id}`);
    for (let i = 0; i < after.length; i++) {
      const bFaq = beforeData[id].faqs.find(f => f.id === after[i].id);
      if (bFaq && bFaq.question !== after[i].question) {
        console.log(`FAQ ${after[i].id}`);
        console.log(`  BEFORE: ${bFaq.question}`);
        console.log(`  AFTER:  ${after[i].question}`);
      }
    }
  }

  console.log("\n=== 6. VERIFICARE LIVE MULTI-SURSĂ CU CACHE-BUSTING ===");
  for (const slug of slugs) {
    const targetUrl = `https://www.kassia.ro/${slug}/`;
    console.log(`\n--- ${slug} ---`);
    
    const cmds = [
      `curl -sL ${targetUrl} | grep -Ei "<title>|h1.*Animatori|Cauți animatori pentru petreceri copii în animatori|De ce să alegi animatori pentru animatori|Rezervă acum pentru petrecerea ta în animatori" || true`,
      `curl -sL -H "Cache-Control: no-cache" -H "Pragma: no-cache" ${targetUrl} | grep -Ei "<title>|h1.*Animatori|Cauți animatori pentru petreceri copii în animatori|De ce să alegi animatori pentru animatori|Rezervă acum pentru petrecerea ta în animatori" || true`,
      `curl -sL -A "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" ${targetUrl} | grep -Ei "<title>|h1.*Animatori|Cauți animatori pentru petreceri copii în animatori|De ce să alegi animatori pentru animatori|Rezervă acum pentru petrecerea ta în animatori" || true`
    ];

    cmds.forEach(cmd => {
      console.log(`> ${cmd}`);
      try {
        const out = execSync(cmd, { encoding: 'utf8' }).trim();
        // Just print if the old strings exist or if it matched title/H1. 
        // We will keep it concise.
        if (out.length > 500) {
           console.log("[Matched string but output is too long, parsing out title/H1]");
           const titleMatch = out.match(/<title>(.*?)<\/title>/i);
           if (titleMatch) console.log(`Matched Title: ${titleMatch[1]}`);
           const h1Match = out.match(/<h1[^>]*>(.*?)<\/h1>/i);
           if (h1Match) console.log(`Matched H1: ${h1Match[1]}`);
        } else {
           console.log(out);
        }
      } catch (e) {}
    });
  }
}

run();
