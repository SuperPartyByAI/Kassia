import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();

    // Fix VIP block heading (remove internal h3 or change section heading)
    // Actually, section heading as H2 is fine: "Pachet VIP Discount"
    // Let's clear the section heading in the DB and keep the internal ones to have full control over the markup.
    
    await supabase.from('kassia_page_sections').update({ heading: '' }).eq('page_id', page.id).eq('heading', 'Pachet VIP Discount');
    await supabase.from('kassia_page_sections').update({ heading: '' }).eq('page_id', page.id).eq('heading', 'Servicii Adiționale pentru o Petrecere Magică');
    await supabase.from('kassia_page_sections').update({ heading: '' }).eq('page_id', page.id).eq('heading', 'Animatori pentru Nunți, Botezuri și Evenimente Corporate');

    console.log("Cleared section headings to avoid duplicates.");
}
run();
