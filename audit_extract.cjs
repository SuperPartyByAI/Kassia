require('dotenv').config({path: '.env.local'});
const fs = require('fs');
const path = require('path');

async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 'apikey': key, 'Authorization': 'Bearer ' + key };

  const slugs = [
    'animatori-clovni-bucuresti',
    'animatori-copii-la-restaurant-bucuresti',
    'animatori-eveniment-corporate-copii-bucuresti',
    'animatori-evenimente-copii-bucuresti',
    'animatori-mot-turta-bucuresti',
    'animatori-botez-bucuresti',
    'animatori-gradinita-bucuresti',
    'animatori-scoala-bucuresti',
    'animatori-tematica-dinozauri-bucuresti',
    'animatori-tematica-unicorn-bucuresti',
    'animatori-tematica-jungla-bucuresti',
    'animatori-tematica-spatiu-bucuresti',
    'animatori-printese-bucuresti',
    'animatori-supereroi-bucuresti',
    'mascote-petreceri-copii-bucuresti',
    'personaje-animatori-copii-bucuresti',
    'pictura-pe-fata-copii-bucuresti',
    'modelaj-baloane-copii-bucuresti',
    'mini-disco-copii-bucuresti',
    'jocuri-interactive-copii-bucuresti'
  ];

  const dbData = {};

  for (const slug of slugs) {
    const pageRes = await fetch(`${url}/rest/v1/kassia_pages?slug=eq.${slug}&select=id,slug,path,title,meta_title,meta_description,h1,status,index_status,include_in_sitemap,page_type,show_pricing_preview,updated_at`, { headers });
    const page = await pageRes.json();
    
    if (page.length > 0) {
      const p = page[0];
      const secRes = await fetch(`${url}/rest/v1/kassia_page_sections?page_id=eq.${p.id}&select=heading,content&order=order_index.asc`, { headers });
      const faqRes = await fetch(`${url}/rest/v1/kassia_faqs?page_id=eq.${p.id}&select=question,answer&order=order_index.asc`, { headers });
      
      dbData[slug] = {
        page: p,
        sections: await secRes.json(),
        faqs: await faqRes.json()
      };
    } else {
      console.log(`Not found in DB: ${slug}`);
    }
  }

  fs.writeFileSync('/tmp/audit_db_data.json', JSON.stringify(dbData, null, 2));
  console.log("DB data extracted for audit.");
}

run();
