import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: null }
});

async function run() {
  const { data, error } = await supabase
    .from('kassia_seo_map')
    .select('*')
    .limit(10);

  if (error) {
    console.error("Error fetching kassia_seo_map:", error);
    return;
  }

  console.log("kassia_seo_map samples:");
  console.log(JSON.stringify(data, null, 2));

  // Count total rows
  const { count, error: countErr } = await supabase
    .from('kassia_seo_map')
    .select('*', { count: 'exact', head: true });

  if (countErr) {
    console.error("Error counting kassia_seo_map:", countErr);
    return;
  }
  console.log(`Total rows in kassia_seo_map: ${count}`);

  // Căutare pagină generică în seo_map
  const { data: genericData, error: genericErr } = await supabase
    .from('kassia_seo_map')
    .select('*')
    .or('slug.eq.animatori-petreceri-copii,slug.eq.animatori-copii,path.eq./animatori-petreceri-copii/,path.eq./animatori-copii/');

  if (genericErr) {
    console.error("Error searching generic in kassia_seo_map:", genericErr);
    return;
  }
  console.log(`Generic matches in kassia_seo_map: ${genericData.length}`);
  if (genericData.length > 0) {
    console.log(JSON.stringify(genericData, null, 2));
  }
}

run().catch(console.error);
