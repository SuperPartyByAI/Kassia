import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '.env' });

const url = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY;

const HEADERS = {
  'apikey': key,
  'Authorization': `Bearer ${key}`
};

async function getCount(table) {
  try {
    const res = await fetch(`${url}/rest/v1/${table}?select=id`, { headers: HEADERS });
    if (!res.ok) {
      const text = await res.text();
      if (text.includes('PGRST205')) return 'ERR: PGRST205 (schema cache sau tabela lipsa)';
      return `ERR: ${res.status}`;
    }
    const data = await res.json();
    return data.length;
  } catch (e) {
    return `ERR: ${e.message}`;
  }
}

async function run() {
  console.log("- audit Supabase URL:", url);
  console.log("- expected Supabase project: superparty / jrfhprnuxxfwkwjwdsez");
  console.log("- same project:", url.includes("jrfhprnuxxfwkwjwdsez") ? "DA" : "NU");
  console.log("- last 8 chars of key:", key ? key.slice(-8) : "MISSING");
  
  console.log("\nCounturi tabele:");
  console.log("- kassia_pages:", await getCount("kassia_pages"));
  console.log("- kassia_page_sections:", await getCount("kassia_page_sections"));
  console.log("- kassia_faqs:", await getCount("kassia_faqs"));
  console.log("- kassia_gallery_items:", await getCount("kassia_gallery_items"));
  console.log("- kassia_internal_links:", await getCount("kassia_internal_links"));
  console.log("- kassia_seo_map:", await getCount("kassia_seo_map"));
}

run();
