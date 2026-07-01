import fs from 'fs';

const env = fs.readFileSync('.env.local', 'utf-8');
const SUPABASE_URL = env.match(/PUBLIC_SUPABASE_URL=(.*)/)[1].trim();
const SUPABASE_KEY = env.match(/SUPABASE_SERVICE_ROLE_KEY=(.*)/)[1].trim();

async function run() {
   const resSec = await fetch(`${SUPABASE_URL}/rest/v1/kassia_page_sections?id=eq.2a39f6df-b924-4f0f-8f81-80a57e62a19d&select=content`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const s = await resSec.json();
   console.log(JSON.stringify(s[0].content, null, 2));
}
run();
