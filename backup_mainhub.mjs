import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabase = createClient(process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function createBackup() {
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('id', '3a754972-74d7-4632-9dfa-2aa9be7682db').single();
    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
    const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id);
    
    const backup = { page, sections, faqs };
    fs.writeFileSync('mainhub_backup.json', JSON.stringify(backup, null, 2));
    console.log("Backup saved to /Users/universparty/wa-web-launcher/kassia-site/mainhub_backup.json");
}
createBackup().catch(console.error);
