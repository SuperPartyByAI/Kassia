import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: pages } = await supabase.from('kassia_pages').select('slug').ilike('slug', '%animatori%');
    const locs = pages.map(p=>p.slug).filter(s => s.includes('sector') || s.includes('floreasca') || s.includes('berceni') || s.includes('pipera') || s.includes('voluntari') || s.includes('popesti'));
    console.log(locs);
}
run();
