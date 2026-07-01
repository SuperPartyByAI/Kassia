import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: null }
});

async function run() {
  const { data: pages, error } = await supabase
    .from('kassia_pages')
    .select('id, path, slug, page_type, parent_id')
    .order('path', { ascending: true });

  if (error) {
    console.error("Error fetching pages:", error);
    process.exit(1);
  }

  console.log(`Total pages: ${pages.length}`);
  pages.forEach(p => {
    console.log(`- Path: ${p.path} | Slug: ${p.slug} | Type: ${p.page_type} | Parent: ${p.parent_id}`);
  });
}

run().catch(console.error);
