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
        
        const { data: sections, error: secErr } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id).order('order_index');
        const { data: faqs, error: faqErr } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id).order('order_index');
        
        results[slug] = {
            page: page,
            sections: sections || [],
            faqs: faqs || [],
            secErr, faqErr
        };
    }
    
    fs.writeFileSync('s6_plan_research.json', JSON.stringify(results, null, 2));
    console.log("Research saved to s6_plan_research.json");
}

research().catch(console.error);
