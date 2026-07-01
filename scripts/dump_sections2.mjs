import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

async function check() {
  const response = await fetch(`${supabaseUrl}/rest/v1/kassia_page_sections?limit=100`, {
    headers: {
      'apikey': supabaseKey,
      'Authorization': `Bearer ${supabaseKey}`
    }
  });
  const data = await response.json();
  const interesting = data.filter(d => Object.keys(d.content || {}).length > 0);
  console.log("Found interesting sections:", interesting.length);
  if(interesting.length > 0) {
    console.log(JSON.stringify(interesting[0], null, 2));
  }
}
check();
