import fs from 'fs';
import path from 'path';
import { createClient } from '@supabase/supabase-js';

const envContent = fs.readFileSync('/Users/universparty/wa-web-launcher/kassia-site/.env.local', 'utf-8');
const envVars = {};
envContent.split('\n').forEach(line => {
    const parts = line.split('=');
    if (parts.length >= 2) envVars[parts[0].trim()] = parts.slice(1).join('=').trim();
});

const SUPA_URL = envVars['PUBLIC_SUPABASE_URL'];
const SUPA_KEY = envVars['SUPABASE_SERVICE_ROLE_KEY'] || envVars['PUBLIC_SUPABASE_ANON_KEY'];
const supabase = createClient(SUPA_URL, SUPA_KEY);

async function mergeAndSEO() {
    console.log("Starting Tasks 4 and 5 (Merge + SEO)...");
    
    const pId = '3eb2c5d4-4a6f-4993-8755-de75ac9fa606'; // Primary ID
    const sId = '97fb3aa2-9216-4313-9da6-6fccc042c2b2'; // Secondary ID

    // 1. Fetch FAQs
    const { data: pFaqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', pId);
    const { data: sFaqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', sId);
    
    console.log("Primary FAQs:", pFaqs?.length || 0);
    console.log("Secondary FAQs:", sFaqs?.length || 0);

    // Merge FAQs if secondary has unique ones
    if (sFaqs && sFaqs.length > 0) {
        let addedCount = 0;
        let lastIndex = pFaqs ? pFaqs.length : 0;
        for (let sFaq of sFaqs) {
            const exists = pFaqs && pFaqs.find(p => p.question.toLowerCase().trim() === sFaq.question.toLowerCase().trim());
            if (!exists) {
                // Insert into primary
                await supabase.from('kassia_faqs').insert({
                    page_id: pId,
                    question: sFaq.question,
                    answer: sFaq.answer,
                    order_index: lastIndex++
                });
                addedCount++;
            }
        }
        console.log(`Merged ${addedCount} FAQs from secondary to primary.`);
    }

    // 2. SEO Update Primary
    const { error: pErr } = await supabase.from('kassia_pages').update({
        status: 'published',
        include_in_sitemap: true,
        index_status: 'index',
        canonical_url: 'https://www.kassia.ro/animatori-petreceri-copii-floreasca/',
        updated_at: new Date().toISOString()
    }).eq('id', pId);

    if (pErr) console.error("Error updating primary:", pErr);
    else console.log("Primary page updated: published, indexable, in sitemap.");

    // 3. Deactivate Secondary
    const { error: sErr } = await supabase.from('kassia_pages').update({
        status: 'draft',
        include_in_sitemap: false,
        index_status: 'noindex',
        updated_at: new Date().toISOString()
    }).eq('id', sId);

    if (sErr) console.error("Error updating secondary:", sErr);
    else console.log("Secondary page updated: draft, noindex, removed from sitemap.");

    console.log("Merge and SEO complete.");
}

mergeAndSEO();
