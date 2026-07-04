import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: pages } = await supabase.from('kassia_pages').select('slug').ilike('slug', '%animatori%');
    const chars = pages.map(p=>p.slug).filter(s => s.includes('elsa') || s.includes('spiderman') || s.includes('batman') || s.includes('wednesday') || s.includes('sonic'));
    console.log("Characters check:", chars);
}
run();
