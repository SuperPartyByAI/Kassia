require('dotenv').config({path: '.env.local'});
async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 'apikey': key, 'Authorization': 'Bearer ' + key };
  const res = await fetch(url + '/rest/v1/kassia_page_sections?page_id=eq.091dee7c-ec3a-4c47-b5db-4af24700c08b', { headers });
  const data = await res.json();
  console.log(JSON.stringify(data, null, 2));
}
run();
