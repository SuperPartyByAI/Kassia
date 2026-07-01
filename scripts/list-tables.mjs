import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const sb = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const { data, error } = await sb.rpc('get_tables');
if (error) {
  // Fallback: use REST to query pg_tables (usually blocked, but let's try via a known table)
  console.log("RPC get_tables error, trying direct query...");
}
// Just list common tables
const tables = ['ai_service_sites', 'zouka_seo_pages', 'zouka_seo_blocks', 'zouka_seo_faqs', 'kassia_pages', 'pages', 'seo_pages'];
for (const t of tables) {
  const { data: d, error: e } = await sb.from(t).select('*').limit(1);
  if (!e) console.log(`✅ Table exists: ${t} (${d?.length || 0} rows in sample)`);
}
