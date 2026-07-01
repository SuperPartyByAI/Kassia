import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await sb.from('kassia_pages').select('id').eq('slug', 'home').single();
    const { data: sections } = await sb.from('kassia_page_sections').select('*').eq('page_id', page.id);
    
    for (const sec of sections) {
        if (!sec.content) continue;
        const str = JSON.stringify(sec.content).toLowerCase();
        
        if (str.includes("spectaculoase")) {
            console.log("spectaculoase found in:", sec.content.body);
            // Replace by just replacing " spectaculoase" with "" since the text matches perfectly usually
            sec.content.body = sec.content.body.replace("spectaculoase ", "");
            await sb.from('kassia_page_sections').update({ content: sec.content }).eq('id', sec.id);
            console.log("Updated spectaculoase");
        }
        
        if (str.includes("sigure")) {
            console.log("sigure found in:", sec.content.subheading);
            sec.content.subheading = sec.content.subheading.replace(" și sigure", "");
            await sb.from('kassia_page_sections').update({ content: sec.content }).eq('id', sec.id);
            console.log("Updated sigure");
        }
    }
}
run();
