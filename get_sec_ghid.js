import fs from 'fs';
const env = fs.readFileSync('.env.local', 'utf-8');
const SUPABASE_URL = env.match(/PUBLIC_SUPABASE_URL=(.*)/)[1].trim();
const SUPABASE_KEY = env.match(/SUPABASE_SERVICE_ROLE_KEY=(.*)/)[1].trim();

async function run() {
   const resSec = await fetch(`${SUPABASE_URL}/rest/v1/kassia_page_sections?id=eq.f6d37f89-6789-9abc-def0-123456789abc&select=content`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const s = await resSec.json();
   console.log(JSON.stringify(s[0].content, null, 2));
}
run();
