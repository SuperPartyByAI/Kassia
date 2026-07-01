import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error("Missing Supabase URL or Key");
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function microFix() {
    console.log("Starting FAQ micro-fix...");
    const slug = 'animatori-petreceri-copii';
    
    // Get page id
    const { data: page, error: pageErr } = await supabase.from('kassia_pages').select('id').eq('slug', slug).single();
    if (pageErr) throw pageErr;

    // Get FAQs
    const { data: faqs, error: faqErr } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id);
    if (faqErr) throw faqErr;

    let updated = false;
    for (const faq of faqs) {
        if (faq.answer.includes('materialele pentru atelierele creative, materialele pentru activitățile creative')) {
            const newAns = faq.answer.replace(
                'materialele pentru atelierele creative, materialele pentru activitățile creative', 
                'accesoriile pentru jocuri, materialele pentru activitățile creative și baloanele speciale de modelat'
            );
            await supabase.from('kassia_faqs').update({ answer: newAns }).eq('id', faq.id);
            console.log(`Updated FAQ ID: ${faq.id}`);
            updated = true;
        } else if (faq.answer.includes('materialele pentru atelierele creative')) {
            // Failsafe if it's slightly different
            const newAns = faq.answer.replace(
                'materialele pentru atelierele creative', 
                'materialele pentru activitățile creative'
            );
            await supabase.from('kassia_faqs').update({ answer: newAns }).eq('id', faq.id);
            console.log(`Updated FAQ ID (fallback): ${faq.id}`);
            updated = true;
        }
    }
    
    if (!updated) {
        console.log("FAQ string not found.");
    }
    console.log("FAQ micro-fix complete.");
}

microFix().catch(console.error);
