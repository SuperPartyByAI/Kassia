import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const url = process.env.PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY;

const HEADERS = {
  'apikey': key,
  'Authorization': `Bearer ${key}`,
  'Content-Type': 'application/json'
};

async function checkTable(table) {
  const res = await fetch(`${url}/rest/v1/${table}?limit=1`, { headers: HEADERS });
  const data = await res.json();
  if (data.length > 0) {
    console.log(`Columns for ${table}:`, Object.keys(data[0]));
  } else {
    console.log(`Table ${table} is empty. Unable to infer columns from REST API without querying PostgREST OpenAPI spec.`);
    // Try openapi spec
    const res2 = await fetch(`${url}/rest/v1/?apikey=${key}`, { headers: HEADERS });
    const spec = await res2.json();
    if (spec.definitions && spec.definitions[table]) {
      console.log(`Columns for ${table} (from OpenAPI):`, Object.keys(spec.definitions[table].properties));
    }
  }
}

async function run() {
  await checkTable('kassia_page_sections');
  await checkTable('kassia_internal_links');
  await checkTable('kassia_faqs');
  await checkTable('kassia_gallery_items');
}

run().catch(console.error);
