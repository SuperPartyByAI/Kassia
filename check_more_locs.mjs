import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: pages } = await supabase.from('kassia_pages').select('slug').ilike('slug', '%animatori%');
    const locs = pages.map(p=>p.slug).filter(s => s.includes('militari') || s.includes('drumul-taberei') || s.includes('baneasa') || s.includes('aviatiei') || s.includes('titan') || s.includes('rahova') || s.includes('pantelimon') || s.includes('corbeanca') || s.includes('otopeni') || s.includes('bragadiru') || s.includes('chiajna'));
    console.log("Missing locations check:", locs);
}
run();
