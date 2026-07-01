import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function research() {
    const slugs = ['animatori-petreceri-copii-voluntari', 'animatori-petreceri-copii-sector-6'];
    const results = {};

    for (const slug of slugs) {
        const { data: page } = await supabase.from('kassia_pages').select('*').eq('slug', slug).single();
        if (!page) continue;
        
        const { data: sections } = await supabase.from('kassia_page_sections').select('type, sort_order, content').eq('page_id', page.id).order('sort_order');
        const { data: faqs } = await supabase.from('kassia_faqs').select('question, answer, sort_order').eq('page_id', page.id).order('sort_order');
        
        results[slug] = {
            page: page,
            sectionsCount: sections ? sections.length : 0,
            sectionsTypes: sections ? sections.map(s => s.type) : [],
            faqsCount: faqs ? faqs.length : 0
        };
    }
    
    fs.writeFileSync('research_s6.json', JSON.stringify(results, null, 2));
    console.log("Research saved to research_s6.json");
}

research().catch(console.error);
