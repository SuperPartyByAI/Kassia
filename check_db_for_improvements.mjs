import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase
        .from('kassia_pages')
        .select('id')
        .eq('slug', 'animatori-petreceri-copii')
        .single();
        
    const { data: sections } = await supabase
        .from('kassia_page_sections')
        .select('id, heading, section_type, order_index, content')
        .eq('page_id', page.id)
        .order('order_index', { ascending: true });
        
    sections.forEach(s => {
        console.log(`[${s.order_index}] ${s.section_type} - ${s.heading}`);
    });
    
    console.log("\nChecking available sector pages in DB:");
    const { data: allPages } = await supabase.from('kassia_pages').select('slug, title').ilike('slug', '%animatori%');
    allPages.forEach(p => {
        if (p.slug.includes('-sector-') || p.slug.includes('-voluntari') || p.slug.includes('-pipera')) {
            console.log(`- /${p.slug}/ : ${p.title}`);
        }
    });
}
run();
