import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function fetchAll() {
  const { data, error } = await supabase.from('kassia_costumes').select('*').order('id', { ascending: true });
  if (error) console.error(error);
  else console.log(JSON.stringify(data, null, 2));
}
fetchAll();
