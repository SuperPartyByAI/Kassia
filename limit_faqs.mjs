import fs from 'fs';
import { createClient } from '@supabase/supabase-js';

const envContent = fs.readFileSync('/Users/universparty/wa-web-launcher/kassia-site/.env.local', 'utf-8');
const envVars = {};
envContent.split('\n').forEach(line => {
    const parts = line.split('=');
    if (parts.length >= 2) envVars[parts[0].trim()] = parts.slice(1).join('=').trim().replace(/['"]/g, '');
});

const SUPA_URL = envVars['PUBLIC_SUPABASE_URL'];
const SUPA_KEY = envVars['SUPABASE_SERVICE_ROLE_KEY'] || envVars['PUBLIC_SUPABASE_ANON_KEY'];
const supabase = createClient(SUPA_URL, SUPA_KEY);

async function limitFaqs() {
    const pId = '3eb2c5d4-4a6f-4993-8755-de75ac9fa606';
    const { data: faqs } = await supabase.from('kassia_faqs').select('id').eq('page_id', pId);
    if (faqs.length > 10) {
        const toDelete = faqs.slice(10).map(f => f.id);
        for (let id of toDelete) {
            await supabase.from('kassia_faqs').delete().eq('id', id);
        }
        console.log(`Deleted ${toDelete.length} faqs, remaining 10.`);
    } else {
        console.log(`Already at or below 10: ${faqs.length}`);
    }
}
limitFaqs();
