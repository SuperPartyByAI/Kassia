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

async function check() {
    const pId = '3eb2c5d4-4a6f-4993-8755-de75ac9fa606';
    const { data: sections } = await supabase.from('kassia_page_sections').select('id, section_type, heading').eq('page_id', pId);
    console.log("Sections:", sections);
    
    // Check FAQs
    const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', pId);
    console.log("FAQs:", faqs.length);
    let toDelete = [];
    for (let f of faqs) {
        if (f.question.includes('în animatori copii floreasca') || f.answer.includes('<p>')) {
            console.log("Found bad FAQ:", f.id, f.question);
            let cleanedA = f.answer.replace(/<\/?p>/g, '').trim();
            let cleanedQ = f.question.replace('în animatori copii floreasca', 'în Floreasca');
            await supabase.from('kassia_faqs').update({ question: cleanedQ, answer: cleanedA }).eq('id', f.id);
        }
        
        // Let's also check duplicates
        let duplicates = faqs.filter(x => x.question === f.question && x.id !== f.id);
        if (duplicates.length > 0) {
            toDelete.push(duplicates[0].id);
        }
    }
    
    if (toDelete.length > 0) {
        console.log("Deleting duplicate FAQs:", [...new Set(toDelete)]);
        for (let d of [...new Set(toDelete)]) {
            await supabase.from('kassia_faqs').delete().eq('id', d);
        }
    }
}
check();
