import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const sb = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

const tables = ['kassia_pages', 'kassia_blocks', 'kassia_faqs', 'kassia_packages', 'kassia_gallery', 'kassia_internal_links'];
for (const t of tables) {
  const { data: d, error: e } = await sb.from(t).select('*').limit(1);
  if (!e) console.log(`✅ Table exists: ${t} (${d?.length || 0} rows in sample)`);
  else console.log(`❌ Table missing: ${t}`);
}
