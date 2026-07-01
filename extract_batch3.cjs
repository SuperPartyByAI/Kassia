require('dotenv').config({path: '.env.local'});

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

  const results = {};

  for (const id of ids) {
    const page = await (await fetch(`${url}/rest/v1/kassia_pages?id=eq.${id}&select=id,slug,path,title,meta_title,meta_description,h1,status,index_status,include_in_sitemap,page_type,updated_at`, { headers })).json();
    const sections = await (await fetch(`${url}/rest/v1/kassia_page_sections?page_id=eq.${id}&select=id,section_type,heading,order_index&order=order_index.asc`, { headers })).json();
    const faqs = await (await fetch(`${url}/rest/v1/kassia_faqs?page_id=eq.${id}&select=id,question,answer,order_index&order=order_index.asc`, { headers })).json();

    results[id] = {
      page: page[0],
      sections: sections,
      faqs: faqs
    };
  }

  require('fs').writeFileSync('/tmp/batch3_data.json', JSON.stringify(results, null, 2));
  console.log("Batch 3 data extracted to /tmp/batch3_data.json");
}

run();
