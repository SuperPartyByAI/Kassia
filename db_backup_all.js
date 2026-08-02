import dotenv from 'dotenv';
import fs from 'fs';
dotenv.config({ path: '/opt/kassia-site/.env.local' });
if (!process.env.PUBLIC_SUPABASE_URL) dotenv.config({ path: '/opt/kassia-site/.env' });

import { createClient } from '@supabase/supabase-js';

const sbUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const sbKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(sbUrl, sbKey);

async function run() {
  const tables = ['kassia_site_config', 'kassia_menus', 'kassia_faqs', 'kassia_internal_links', 'kassia_gallery_items'];
  for (const table of tables) {
    const { data } = await supabase.from(table).select('*');
    fs.writeFileSync('/opt/kassia-site/db_' + table + '.json', JSON.stringify(data, null, 2));
  }
}
run();
