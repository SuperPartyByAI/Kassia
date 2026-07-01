const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '../.env.fixed' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.VITE_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.VITE_SUPABASE_ANON_KEY);
async function run() {
  const { data, error } = await supabase.from('kassia_pages').select('slug, title, status');
  if (error) { console.error(error); return; }
  console.log(`TOTAL PAGINI: ${data.length}`);
  data.forEach(p => console.log(`- https://kassya.ro/${p.slug}/ (${p.title}) [${p.status}]`));
}
run();
