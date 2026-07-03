import fs from 'fs';
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    console.log("Fetching animatori-petreceri-copii...");
    const { data: page, error: pageErr } = await supabase
        .from('kassia_pages')
        .select('*')
        .eq('slug', 'animatori-petreceri-copii')
        .single();
    
    if (pageErr || !page) {
        console.error("Page not found", pageErr);
        return;
    }
    
    console.log(`Page ID: ${page.id}`);
    
    const { data: sections, error: secErr } = await supabase
        .from('kassia_page_sections')
        .select('*')
        .eq('page_id', page.id)
        .order('order_index', { ascending: true });
        
    if (secErr) {
        console.error("Error fetching sections", secErr);
        return;
    }
    
    // Snapshot
    fs.writeFileSync('scratch/snapshot_animatori_sections.json', JSON.stringify(sections, null, 2));
    console.log(`Snapshot saved. Found ${sections.length} sections.`);
    
    for (let s of sections) {
        console.log(`[${s.order_index}] ${s.section_type} - ${s.title || 'no title'}`);
    }
}
run();
