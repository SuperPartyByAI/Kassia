import { createClient } from '@supabase/supabase-js';
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
async function check() {
  const { data: pages } = await supabase.from('kassia_pages').select('id, path');
  console.log(pages.map(p => p.path).join('\n'));
}
check();
