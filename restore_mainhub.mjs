import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function restore() {
    console.log("Restoring from backup...");
    const backup = JSON.parse(fs.readFileSync('mainhub_backup.json', 'utf8'));
    
    // First, delete the specific new rows we added (we can just delete the ones with high order_index or by heading)
    await supabase.from('kassia_page_sections').delete().eq('heading', 'Personaje animatoare și teme potrivite pentru copii');
    await supabase.from('kassia_page_sections').delete().eq('heading', 'Cum alegi corect programul cu animatori');
    await supabase.from('kassia_page_sections').delete().eq('content', 'Citește mai jos câteva recenzii primite de la clienți care au ales programele Kassia pentru petreceri de copii.');
    
    // Also the new FAQs
    await supabase.from('kassia_faqs').delete().eq('question', 'Când alegem un personaj animator și când sunt necesare două personaje animatoare?');
    await supabase.from('kassia_faqs').delete().eq('question', 'Ce program este potrivit pentru o petrecere la apartament?');
    await supabase.from('kassia_faqs').delete().eq('question', 'Cum se adaptează jocurile la restaurant sau terasă?');
    await supabase.from('kassia_faqs').delete().eq('question', 'Cum alegem personajul în funcție de vârsta copilului?');
    
    // Now upsert the original sections
    for (const section of backup.sections) {
        await supabase.from('kassia_page_sections').upsert(section);
    }
    for (const faq of backup.faqs) {
        await supabase.from('kassia_faqs').upsert(faq);
    }
    
    console.log("Restore complete.");
}
restore().catch(console.error);
