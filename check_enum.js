import { createClient } from '@supabase/supabase-js';
const supabase = createClient(
  'https://jrfhprnuxxfwkwjwdsez.supabase.co',
  'sb_secret_TcAdQgelyfGgXvw8JhsI2w_O3vqhzHx'
);
async function run() {
  const { data, error } = await supabase.from('kassia_pages').select('index_status').limit(1);
  console.log(data, error);
}
run();
