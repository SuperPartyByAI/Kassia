import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
    
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, heading, content').eq('page_id', page.id);
    
    for (const sec of sections) {
        if (sec.heading === 'De ce aleg părinții Kassia pentru petrecerile copiilor?' || sec.heading === 'Ce program alegi în funcție de vârsta copiilor?' || sec.heading === 'Zone acoperite în București și Ilfov') {
            if (sec.content && sec.content.body) {
                // remove any h2 tag from the inner HTML
                sec.content.body = sec.content.body.replace(/<h2[^>]*>.*?<\/h2>/g, '');
                await supabase.from('kassia_page_sections').update({ content: sec.content }).eq('id', sec.id);
                console.log('Fixed H2 in', sec.heading);
            }
        }
    }
}
run();
