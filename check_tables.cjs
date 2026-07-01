require('dotenv').config({path: '.env.local'});
async function run() {
  const url = process.env.PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const headers = { 'apikey': key, 'Authorization': 'Bearer ' + key };
  const res = await fetch(url + '/rest/v1/', { headers });
  const data = await res.json();
  console.log(Object.keys(data.paths).filter(p => p.includes('faq') || p.includes('section')));
}
run();
