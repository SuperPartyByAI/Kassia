import { createClient } from '@supabase/supabase-js';
import { config } from 'dotenv';
config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const { data } = await supabase.from('kassia_page_sections').select('heading, order_index').eq('page_id', '3a754972-74d7-4632-9dfa-2aa9be7682db').order('order_index');
console.log(data);
