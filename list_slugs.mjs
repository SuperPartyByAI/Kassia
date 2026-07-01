import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
async function run() {
    const { data } = await sb.from('kassia_pages').select('slug');
    console.log(data.map(d => d.slug).filter(s => s && s.includes('sector')).join('\n'));
}
run();
