import dotenv from 'dotenv';
import fs from 'fs';
dotenv.config({ path: '/opt/kassia-site/.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '/opt/kassia-site/.env' });

import { createClient } from '@supabase/supabase-js';

const sbUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const sbKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(sbUrl, sbKey);

async function run() {
  const { data: pages } = await supabase.from('kassia_pages').select('*');
  const { data: sections } = await supabase.from('kassia_page_sections').select('*');
  
  fs.writeFileSync('/opt/kassia-site/db_backup_pages.json', JSON.stringify(pages, null, 2));
  fs.writeFileSync('/opt/kassia-site/db_backup_sections.json', JSON.stringify(sections, null, 2));
  console.log("DB Backup created.");
}
run();
