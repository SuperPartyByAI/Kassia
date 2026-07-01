import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: p1 } = await sb.from('kassia_pages').select('id, slug').eq('slug', 'animatori-petreceri-copii').single();
    const { data: p2 } = await sb.from('kassia_pages').select('id, slug').eq('slug', 'preturi-animatori-copii-bucuresti').single();
    
    const { data: s1 } = await sb.from('kassia_page_sections').select('*').eq('page_id', p1.id).order('order_index');
    const { data: s2 } = await sb.from('kassia_page_sections').select('*').eq('page_id', p2.id).order('order_index');
    
    const out = {
        'animatori-petreceri-copii': s1.map(s => ({ id: s.id, type: s.section_type, heading: s.heading, content: typeof s.content === 'string' ? JSON.parse(s.content) : s.content })),
        'preturi-animatori-copii-bucuresti': s2.map(s => ({ id: s.id, type: s.section_type, heading: s.heading, content: typeof s.content === 'string' ? JSON.parse(s.content) : s.content }))
    };
    
    fs.writeFileSync('sections_to_image.json', JSON.stringify(out, null, 2));
    console.log("Sections exported to sections_to_image.json");
}
run();
