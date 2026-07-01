import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

async function check() {
  const response = await fetch(`${supabaseUrl}/rest/v1/kassia_pages?select=status`, {
    headers: {
      'apikey': supabaseKey,
      'Authorization': `Bearer ${supabaseKey}`
    }
  });
  const pages = await response.json();
  const statuses = [...new Set(pages.map(p => p.status))];
  console.log("Found statuses:", statuses);
  console.log("Total pages:", pages.length);
}
check();
