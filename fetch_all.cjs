require('dotenv').config({path: '.env.local'});
const fs = require('fs');

async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 'apikey': key, 'Authorization': 'Bearer ' + key };
  
  const pageIds = [
    '091dee7c-ec3a-4c47-b5db-4af24700c08b',
    '46a20540-c418-4e3a-a33b-a4dd793c8ec1',
    'f0b39e18-af00-404b-ba33-e433aef8b982'
  ];
  
  let result = {};
  
  for (const pid of pageIds) {
    const pageRes = await fetch(`${url}/rest/v1/kassia_pages?id=eq.${pid}`, { headers });
    const page = (await pageRes.json())[0];
    
    const secRes = await fetch(`${url}/rest/v1/kassia_page_sections?page_id=eq.${pid}`, { headers });
    const secs = await secRes.json();
    
    const faqRes = await fetch(`${url}/rest/v1/kassia_faqs?page_id=eq.${pid}`, { headers });
    const faqs = await faqRes.json();
    
    result[page.slug] = {
      page,
      sections: secs.filter(s => s.heading && s.heading.includes('animatori')),
      faqs: faqs.filter(f => f.question && f.question.includes('animatori'))
    };
  }
  
  fs.writeFileSync('/tmp/batch1_full_data.json', JSON.stringify(result, null, 2));
}

run();
