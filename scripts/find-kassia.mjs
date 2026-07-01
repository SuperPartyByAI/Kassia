import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const sb = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const { data, error } = await sb.rpc('get_tables'); // Try rpc first if exists
if (error) {
  // Direct postgrest query to a known meta table or we can just try to query information_schema if rpc is missing
  console.log("Could not fetch list via RPC. Let me query by attempting a raw SQL if we have pg_meta endpoint, but since we don't, I will just list common guesses:");
  const guesses = [
    'kassia_pages', 'kassia_blocks', 'kassia_faqs', 'kassia_packages', 'kassia_gallery', 
    'kassia_internal_links', 'kassia_business_profile', 'kassia_seo_blocks', 'kassia_seo_faqs',
    'kassia_seo_pages', 'kassia_seo_assets', 'kassia_testimonials', 'kassia_services', 'kassia_settings'
  ];
  const found = [];
  for (const t of guesses) {
    const { data: d, error: e } = await sb.from(t).select('id').limit(1);
    if (!e) found.push(t);
  }
  console.log("Tabele găsite pentru Kassia:\n" + found.join('\n'));
} else {
  const kTables = data.filter(t => t.name.includes('kassia'));
  console.log("Tabele găsite pentru Kassia:\n" + kTables.map(t=>t.name).join('\n'));
}
