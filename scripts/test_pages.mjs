import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });

const url = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY;

async function run() {
  const res = await fetch(`${url}/rest/v1/kassia_pages?select=id,path`, {
    headers: { 'apikey': key, 'Authorization': `Bearer ${key}` }
  });
  console.log(res.status);
  console.log((await res.json()).length);
}
run();
