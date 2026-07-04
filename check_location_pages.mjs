import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: pages, error } = await supabase
        .from('kassia_pages')
        .select('slug, title, status, page_type')
        .ilike('slug', '%animatori%')
        .order('slug', { ascending: true });

    if (error) {
        console.error("DB Error:", error);
        return;
    }

    const locationPages = pages.filter(p => 
        p.slug.includes('sector') || 
        p.slug.includes('floreasca') || 
        p.slug.includes('berceni') || 
        p.slug.includes('pipera') || 
        p.slug.includes('ilfov') ||
        p.slug.includes('voluntari') ||
        p.slug.includes('popesti') ||
        p.slug.includes('bucuresti')
    );

    console.log("Found", locationPages.length, "location pages.");
    console.table(locationPages);
}
run();
