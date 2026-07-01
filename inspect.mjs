import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

async function run() {
  const { data: pages } = await supabase.from('kassia_pages').select('slug, index_status, include_in_sitemap').in('slug', [
    'decoratiuni-baloane-bucuresti',
    'decoratiuni-baloane-botez-bucuresti',
    'decoratiuni-baloane-majorat-bucuresti',
    'decoratiuni-baloane-aniversare-copii-bucuresti',
    'decoratiuni-baloane-aniversare-adulti-bucuresti'
  ]);
  console.log(pages);
}
run();
