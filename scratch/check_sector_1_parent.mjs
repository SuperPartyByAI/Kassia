import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: null }
});

async function run() {
  const { data: page, error } = await supabase
    .from('kassia_pages')
    .select('id, path, parent_page_id, page_type, status, index_status, include_in_sitemap, priority, city, sector, neighborhood')
    .eq('path', '/animatori-petreceri-copii-sector-1/')
    .single();

  if (error) {
    console.error("Error fetching Sector 1 page:", error);
    process.exit(1);
  }

  console.log("Sector 1 page details:", JSON.stringify(page, null, 2));

  if (page && page.parent_page_id) {
    const { data: parent } = await supabase
      .from('kassia_pages')
      .select('id, path, page_type')
      .eq('id', page.parent_page_id)
      .single();
    console.log("Parent page details:", JSON.stringify(parent, null, 2));
  }
}

run().catch(console.error);
