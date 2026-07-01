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
    .select('*')
    .limit(1)
    .single();

  if (error) {
    console.error("Error fetching page:", error);
    process.exit(1);
  }

  console.log("Keys in kassia_pages:", Object.keys(page));
  console.log("Sample page row:", JSON.stringify(page, null, 2));
}

run().catch(console.error);
