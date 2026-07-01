import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function inspectMainHub() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
    
    console.log("--- SECTIONS ---");
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, heading, order_index').eq('page_id', page.id).order('order_index');
    sections.forEach(s => console.log(`[${s.order_index}] ${s.section_type}: ${s.heading} (ID: ${s.id})`));
    
    console.log("\n--- FAQS ---");
    const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, order_index').eq('page_id', page.id).order('order_index');
    faqs.forEach(f => console.log(`[${f.order_index}] ${f.question}`));
    
    console.log("\n--- GALLERY / ASSETS ---");
    // Just list available image paths in public/images
}
inspectMainHub().catch(console.error);
