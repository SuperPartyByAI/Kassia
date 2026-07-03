import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';
config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.PUBLIC_SUPABASE_ANON_KEY);
const { data } = await supabase.from('pages').select('id, url, status, seo_title');
console.log(data.find(d => d.url.includes('animatori-petreceri-copii')));
