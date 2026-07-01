import dotenv from 'dotenv';

if (!process.env.SUPABASE_SERVICE_ROLE_KEY) {
  throw new Error('Missing SUPABASE_SERVICE_ROLE_KEY');
}
dotenv.config({ path: '.env.local' });
const SUPABASE_URL = process.env.PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

async function fetchSupabase(table) {
    const res = await fetch(`${SUPABASE_URL}/rest/v1/${table}`, {
        headers: { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` }
    });
    return await res.json();
}

async function run() {
    const pages = await fetchSupabase('kassia_pages?select=id,path');
    const sections = await fetchSupabase('kassia_page_sections?select=page_id');
    const pageIdsWithSections = new Set(sections.map(s => s.page_id));
    const missing = pages.filter(p => !pageIdsWithSections.has(p.id));
    console.log(`Missing sections for ${missing.length} pages:`, missing.map(p => p.path));
}
run();
