import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey);

async function fixFaq() {
    console.log("Fetching Main Hub FAQ...");
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', 'animatori-petreceri-copii').single();
    
    if (!page) {
        console.error("Main Hub page not found.");
        return;
    }

    const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id);
    
    let updated = false;
    for (const faq of faqs) {
        const oldText = "Echipa aduce accesoriile necesare desfășurării jocurilor, accesoriile pentru jocuri, materialele pentru activitățile creative și baloanele speciale de modelat și baloanele speciale de modelat.";
        const newText = "Echipa aduce accesoriile necesare desfășurării jocurilor, materialele pentru activitățile creative și baloanele speciale de modelat.";
        
        if (faq.answer.includes(oldText)) {
            const newAnswer = faq.answer.replace(oldText, newText);
            const { error } = await supabase.from('kassia_faqs').update({ answer: newAnswer }).eq('id', faq.id);
            if (error) console.error("Error updating FAQ:", error);
            else console.log("FAQ successfully updated!");
            updated = true;
        } else if (faq.answer.includes("accesoriile pentru jocuri, materialele pentru activitățile creative și baloanele speciale de modelat și baloanele speciale de modelat.")) {
             // Let's do a more robust replace in case of slight whitespace diff
             const robustOld = /Echipa aduce accesoriile necesare desfășurării jocurilor,\s*accesoriile pentru jocuri,\s*materialele pentru activitățile creative și baloanele speciale de modelat și baloanele speciale de modelat\./;
             if (robustOld.test(faq.answer)) {
                 const newAnswer = faq.answer.replace(robustOld, newText);
                 const { error } = await supabase.from('kassia_faqs').update({ answer: newAnswer }).eq('id', faq.id);
                 if (error) console.error("Error updating FAQ:", error);
                 else console.log("FAQ successfully updated with regex!");
                 updated = true;
             }
        }
    }
    
    if (!updated) {
        console.log("No FAQ matched the exact broken string. Here are the current answers for inspection:");
        faqs.forEach(f => {
            if (f.answer.includes("accesoriile")) {
                console.log("- ", f.answer);
            }
        });
    }
}

fixFaq().catch(console.error);
