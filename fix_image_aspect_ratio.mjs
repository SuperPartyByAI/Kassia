import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
    
    const { data: section } = await supabase.from('kassia_page_sections').select('content').eq('page_id', page.id).eq('order_index', 83).single();
    
    if (section && section.content && section.content.body) {
        let body = section.content.body;
        // Replace <div style="width: 100%; height: 220px; background: #e2e8f0;"> with aspect-ratio: 1/1
        body = body.replace(/height:\s*220px;/g, "aspect-ratio: 1 / 1; height: auto;");
        
        await supabase.from('kassia_page_sections').update({
            content: { is_active: true, body: body }
        }).eq('page_id', page.id).eq('order_index', 83);
        console.log("Updated aspect ratio to 1/1!");
    } else {
        console.log("Section not found.");
    }
}
run();
