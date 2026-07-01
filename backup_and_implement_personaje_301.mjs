import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
  console.log("=== STARTING 301 IMPLEMENTATION FOR OLD PERSONAJE URL ===");
  const oldUrlPath = '/personaje-petreceri-copii-bucuresti/';

  // 1. Fetch old page from DB
  const { data: pageData, error: pageErr } = await supabase
    .from('kassia_pages')
    .select('*')
    .eq('path', oldUrlPath)
    .single();

  if (pageErr || !pageData) {
    console.error("Failed to find old page:", pageErr);
    process.exit(1);
  }

  // 2. Fetch sections and FAQs for backup
  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageData.id);
  const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', pageData.id);

  // 3. Save Backup
  fs.writeFileSync('db_backup_old_personaje_url.json', JSON.stringify({ page: pageData, sections, faqs }, null, 2));
  console.log(`Backed up old page, ${sections ? sections.length : 0} sections, and ${faqs ? faqs.length : 0} FAQs to db_backup_old_personaje_url.json`);

  // 4. Update the DB record to disable the old URL
  const { error: updateErr } = await supabase
    .from('kassia_pages')
    .update({
      status: 'draft',
      index_status: 'noindex',
      include_in_sitemap: false
    })
    .eq('id', pageData.id);

  if (updateErr) {
    console.error("Failed to update old page status:", updateErr);
    process.exit(1);
  }

  console.log(`Successfully updated ${oldUrlPath} to status: draft, noindex, out of sitemap.`);
  console.log("=== DB WORK COMPLETE ===");
}

run();
