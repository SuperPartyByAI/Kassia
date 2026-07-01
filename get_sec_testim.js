import fs from 'fs';
const env = fs.readFileSync('.env.local', 'utf-8');
const SUPABASE_URL = env.match(/PUBLIC_SUPABASE_URL=(.*)/)[1].trim();
const SUPABASE_KEY = env.match(/SUPABASE_SERVICE_ROLE_KEY=(.*)/)[1].trim();

async function run() {
   const resSec = await fetch(`${SUPABASE_URL}/rest/v1/kassia_page_sections?id=eq.1e34fdcc-8c10-410a-9d9e-108cb92fa31a&select=content`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const s = await resSec.json();
   console.log(s[0].content.body.substring(0, 1000));
}
run();
