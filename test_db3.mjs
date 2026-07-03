import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';
config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.PUBLIC_SUPABASE_ANON_KEY);
const { data } = await supabase.from('pages').select('url').ilike('url', '%animatori-petreceri-copii%');
console.log(data);
