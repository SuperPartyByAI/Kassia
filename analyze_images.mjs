import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
import path from 'path';
dotenv.config({ path: '.env.local' });

const supabase = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function run() {
    const { data: page } = await supabase
        .from('kassia_pages')
        .select('id')
        .eq('slug', 'animatori-petreceri-copii')
        .single();
        
    const { data: sections } = await supabase
        .from('kassia_page_sections')
        .select('heading, section_type, content')
        .eq('page_id', page.id);
        
    const imageUrls = [];
    
    sections.forEach(s => {
        if (s.content?.image_url) imageUrls.push(s.content.image_url);
        if (s.content?.cards) {
            s.content.cards.slice(0, 12).forEach(c => {
                if (c.image_url) imageUrls.push(c.image_url);
            });
        }
    });
    
    // Check sizes of these images in the local public directory
    console.log("Analyzing images...");
    for (let url of imageUrls) {
        if (!url) continue;
        const localPath = path.join(process.cwd(), 'public', url);
        try {
            const stats = fs.statSync(localPath);
            const sizeMB = (stats.size / (1024 * 1024)).toFixed(2);
            console.log(`- ${url}: ${sizeMB} MB`);
        } catch (e) {
            console.log(`- ${url}: NOT FOUND LOCALLY`);
        }
    }
}
run();
