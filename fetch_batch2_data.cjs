require('dotenv').config({path: '.env.local'});

async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 'apikey': key, 'Authorization': 'Bearer ' + key };

  const slugs = [
    'animatori-tematica-dinozauri-bucuresti',
    'animatori-tematica-unicorn-bucuresti',
    'animatori-tematica-jungla-bucuresti',
    'animatori-tematica-spatiu-bucuresti'
  ];

  const pagesRes = await fetch(`${url}/rest/v1/kassia_pages?slug=in.(${slugs.join(',')})&select=id,slug,path,title,meta_title,meta_description,h1,status,index_status,include_in_sitemap,page_type,updated_at`, { headers });
  const pages = await pagesRes.json();

  const data = {};
  for (const p of pages) {
    const sRes = await fetch(`${url}/rest/v1/kassia_page_sections?page_id=eq.${p.id}&select=id,section_type,heading,content,order_index,updated_at&order=order_index.asc`, { headers });
    const fRes = await fetch(`${url}/rest/v1/kassia_faqs?page_id=eq.${p.id}&select=id,question,answer,order_index,updated_at&order=order_index.asc`, { headers });
    data[p.slug] = {
      page: p,
      sections: await sRes.json(),
      faqs: await fRes.json()
    };
  }

  require('fs').writeFileSync('/tmp/batch2_data.json', JSON.stringify(data, null, 2));
  console.log("Date extrase in /tmp/batch2_data.json");
}
run();
