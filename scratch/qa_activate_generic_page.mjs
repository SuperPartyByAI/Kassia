import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
  realtime: { transport: null }
});

const PAGE_ID = '3a754972-74d7-4632-9dfa-2aa9be7682db';

async function activateQA() {
  console.log("=== ACTIVARE PAGINĂ PENTRU QA LIVE (PUBLISHED + NOINDEX) ===");
  const { data, error } = await supabase
    .from('kassia_pages')
    .update({
      status: 'published',
      index_status: 'noindex',
      include_in_sitemap: false,
      updated_at: new Date().toISOString()
    })
    .eq('id', PAGE_ID)
    .select('path, status, index_status, include_in_sitemap');

  if (error) {
    console.error("Eroare la activarea QA:", error.message);
    process.exit(1);
  }
  console.log("Pagină activată pentru QA cu succes:", data[0]);
}

activateQA().catch(console.error);
