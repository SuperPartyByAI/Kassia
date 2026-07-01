import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await sb.from('kassia_pages').select('id, slug').eq('slug', 'animatori-petreceri-copii-sector-3').single();
    if (!page) return console.log("Page not found");
    
    console.log(`PAGE_ID: ${page.id} (${page.slug})`);
    
    const { data: section } = await sb.from('kassia_page_sections')
        .select('*')
        .eq('page_id', page.id)
        .eq('section_type', 'service_details')
        .single();
        
    if (!section) return console.log("Section not found");
    
    console.log(`SECTION_ID: ${section.id}`);
    console.log(`CONTENT.SUBHEADING: ${section.content.subheading}`);
    console.log(`CONTENT.BODY: ${section.content.body}`);
    console.log(`CONTENT.CTA_TEXT: ${section.content.cta_text}`);
    
    // Check if "pachete" or "super eveniment" are in the raw JSON stringified
    const raw = JSON.stringify(section.content);
    console.log(`\nRAW JSON: ${raw}`);
    console.log(`Contains 'pachete'? ${raw.includes('pachete')}`);
    console.log(`Contains 'super eveniment'? ${raw.includes('super eveniment')}`);
}
run();
