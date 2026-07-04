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
    
    if (!page) {
        console.error("Page not found");
        return;
    }
    
    const pageId = page.id;
    
    const { data: sections } = await supabase
        .from('kassia_page_sections')
        .select('id, heading, section_type, content')
        .eq('page_id', pageId)
        .eq('section_type', 'costume_catalog');
        
    for (let s of sections) {
        if (!s.content || !s.content.cards) continue;
        
        console.log(`Original cards count: ${s.content.cards.length}`);
        
        // Take only the first 12 cards
        s.content.cards = s.content.cards.slice(0, 12);
        
        // Make sure it doesn't have load more button configured directly inside the catalog config (if any)
        s.content.show_load_more = false;
        
        // The user wants a clear button: "Vezi catalogul complet de costume" to /catalog-costume/
        // In the Astro component CostumeCatalog, is there a way to pass a global button? 
        // Let's check how we can pass it, or we just append it to the body/subheading?
        // Wait, if I look at CostumeCatalog.astro, it might not support a global CTA. 
        // I will check CostumeCatalog.astro to see how I can add a CTA button.
        
        await supabase.from('kassia_page_sections').update({
            content: s.content
        }).eq('id', s.id);
        
        console.log("Updated pillar catalog section to 12 cards.");
    }
}
run();
