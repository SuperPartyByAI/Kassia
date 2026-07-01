import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: null }
});

async function search() {
  const { data: sections } = await supabase
    .from('kassia_page_sections')
    .select('id, heading, content')
    .ilike('content::text', '%dancing%');
  
  console.log("Sections with 'dancing':", JSON.stringify(sections, null, 2));

  const { data: pages } = await supabase
    .from('kassia_pages')
    .select('id, path, slug, h1, meta_description')
    .ilike('meta_description', '%dancing%');

  console.log("Pages with 'dancing' in meta_description:", JSON.stringify(pages, null, 2));
}

search().catch(console.error);
