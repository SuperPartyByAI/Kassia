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

    // Fetch all sections that might have 'html' instead of 'body'
    const { data: sections } = await supabase
        .from('kassia_page_sections')
        .select('id, content, heading')
        .eq('page_id', pageId);

    for (const sec of sections) {
        if (sec.content && sec.content.html) {
            sec.content.body = sec.content.html;
            // delete sec.content.html;
            await supabase
                .from('kassia_page_sections')
                .update({ content: sec.content })
                .eq('id', sec.id);
            console.log(`Updated section ${sec.heading} to use content.body`);
        }
    }
}

run();
