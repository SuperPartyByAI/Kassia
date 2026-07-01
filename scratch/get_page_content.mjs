import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import ws from 'ws';

dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: ws }
});

async function run() {
  const { data: page, error } = await supabase
    .from('kassia_pages')
    .select('*')
    .eq('id', '160e370f-0540-4501-b50f-62f88b6c8e83')
    .single();

  if (error) {
    console.error("Error fetching page content:", error);
    process.exit(1);
  }

  console.log("Pillar Page Data:");
  console.log(JSON.stringify(page, null, 2));

  // Let's also check if animatori-copii-bucuresti exists in DB
  const { data: oldPage, error: oldError } = await supabase
    .from('kassia_pages')
    .select('id, slug, status')
    .eq('slug', 'animatori-copii-bucuresti');
  
  console.log("\nChecking old page:");
  console.log(oldPage);
}

run();
