import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function list() {
  const { data, error } = await supabase.from('kassia_personaje').select('id').limit(1);
  if (!error) console.log('kassia_personaje exists');
  const { data: d2, error: e2 } = await supabase.from('kassia_catalog_costumes').select('id').limit(1);
  if (!e2) console.log('kassia_catalog_costumes exists');
  const { data: d3, error: e3 } = await supabase.from('kassia_costume').select('id').limit(1);
  if (!e3) console.log('kassia_costume exists');
}
list();
