import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

async function check() {
  const response = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?limit=10`, {
    headers: {
      'apikey': supabaseKey,
      'Authorization': `Bearer ${supabaseKey}`
    }
  });
  const data = await response.json();
  console.log(JSON.stringify(data, null, 2));
}
check();
