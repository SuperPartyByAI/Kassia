import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const url = process.env.PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY;

const HEADERS = {
  'apikey': key,
  'Authorization': `Bearer ${key}`,
  'Content-Type': 'application/json'
};

async function run() {
  const res = await fetch(`${url}/rest/v1/kassia_internal_links?select=id,kassia_pages!target_page_id(path,status)&limit=1`, { headers: HEADERS });
  if (res.ok) {
    console.log('Success with kassia_pages!target_page_id:', await res.json());
  } else {
    console.log('Failed:', await res.text());
  }
}
run();
