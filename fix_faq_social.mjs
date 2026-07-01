import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function fixDuplicateFAQsAndSocialIntro() {
    const pageId = '3a754972-74d7-4632-9dfa-2aa9be7682db';
    
    // 1. Delete Social Intro from page sections
    console.log("Removing Social Proof Intro...");
    await supabase.from('kassia_page_sections').delete()
        .eq('page_id', pageId)
        .eq('section_type', 'content_block');
    // Also delete any other matching text just in case
    await supabase.from('kassia_page_sections').delete()
        .eq('page_id', pageId)
        .like('content->>body', '%Citește mai jos câteva recenzii primite%');
        
    // 2. Fix FAQ Duplicates
    console.log("Fixing FAQ duplicates...");
    const { data: faqs } = await supabase.from('kassia_faqs').select('id, question').eq('page_id', pageId);
    
    // Group by question
    const questionMap = new Map();
    for (const faq of faqs) {
        if (!questionMap.has(faq.question)) {
            questionMap.set(faq.question, []);
        }
        questionMap.get(faq.question).push(faq.id);
    }
    
    for (const [question, ids] of questionMap.entries()) {
        if (ids.length > 1) {
            // It's a duplicate. Keep the first ID, delete the rest.
            console.log(`Duplicate found for: "${question}" (${ids.length} copies)`);
            const idsToDelete = ids.slice(1);
            for (const id of idsToDelete) {
                await supabase.from('kassia_faqs').delete().eq('id', id);
                console.log(`- Deleted duplicate ID: ${id}`);
            }
        }
    }
    
    console.log("Fix completed.");
}

fixDuplicateFAQsAndSocialIntro().catch(console.error);
