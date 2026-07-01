import fs from 'fs';
const env = fs.readFileSync('.env.local', 'utf-8');
const SUPABASE_URL = env.match(/PUBLIC_SUPABASE_URL=(.*)/)[1].trim();
const SUPABASE_KEY = env.match(/PUBLIC_SUPABASE_ANON_KEY=(.*)/)[1].trim();

async function run() {
   const resPage = await fetch(`${SUPABASE_URL}/rest/v1/kassia_pages?select=*&limit=5`, {
      headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
   });
   const pages = await resPage.json();
   console.log(JSON.stringify(pages, null, 2));
}
run();
