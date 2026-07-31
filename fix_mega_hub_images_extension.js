import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
    if (!page) return;
    
    // Find the O Petrecere Fara Limite block
    const { data: sec } = await supabase.from('kassia_page_sections').select('id, content').eq('page_id', page.id).eq('order_index', 83).single();
    if (sec && sec.content && sec.content.body) {
        // Replace .webp with .png in the body
        const updatedBody = sec.content.body.replace(/\.webp/g, '.png');
        await supabase.from('kassia_page_sections').update({
            content: { ...sec.content, body: updatedBody }
        }).eq('id', sec.id);
        console.log("Fixed image extensions from .webp to .png!");
    } else {
        console.log("Section not found.");
    }
}
run();
