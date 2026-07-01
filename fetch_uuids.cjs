require('dotenv').config({path: '.env.local'});
const fs = require('fs');

async function run() {
  const pids = ['b7038460-b34d-4b2d-ba76-d448a6e8fd84', '44ccceb6-1404-4438-84ea-f7e51debe94e'];
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = {
    'apikey': key,
    'Authorization': `Bearer ${key}`
  };

  const pagesRes = await fetch(`${url}/rest/v1/kassia_pages?id=in.(${pids.join(',')})`, { headers });
  const sectionsRes = await fetch(`${url}/rest/v1/kassia_page_sections?page_id=in.(${pids.join(',')})&order=order_index.asc`, { headers });
  const faqsRes = await fetch(`${url}/rest/v1/kassia_faqs?page_id=in.(${pids.join(',')})&order=order_index.asc`, { headers });

  const result = {
    pages: await pagesRes.json(),
    sections: await sectionsRes.json(),
    faqs: await faqsRes.json()
  };

  fs.writeFileSync('/tmp/batch_a_v3_exact_uuids.json', JSON.stringify(result, null, 2));
  console.log("Done via REST");
}
run();
