import fs from 'fs';
import path from 'path';
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

async function remaining() {
    const pId = '3eb2c5d4-4a6f-4993-8755-de75ac9fa606';
    const { data: faqs } = await supabase.from('kassia_faqs').select('id, question, answer').eq('page_id', pId);
    console.log("Remaining FAQs:", faqs.length);
    for (let f of faqs) {
        console.log(f.question);
    }
}
remaining();
