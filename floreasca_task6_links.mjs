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

async function addInternalLinks() {
    console.log("Starting Task 6 (Internal Links)...");
    
    const targetId = '3eb2c5d4-4a6f-4993-8755-de75ac9fa606'; // Primary ID for Floreasca
    const secondaryId = '97fb3aa2-9216-4313-9da6-6fccc042c2b2';
    
    // Replace internal links pointing to secondary to point to primary
    const { data: sLinks } = await supabase.from('kassia_internal_links').select('*').eq('target_page_id', secondaryId);
    if (sLinks && sLinks.length > 0) {
        for (let l of sLinks) {
            await supabase.from('kassia_internal_links').update({ target_page_id: targetId }).eq('id', l.id);
            console.log(`Updated link from secondary to primary for source ${l.source_page_id}`);
        }
    }
    
    const sourceSlugs = [
        'animatori-petreceri-copii',
        'animatori-petreceri-copii-bucuresti',
        'animatori-petreceri-copii-sector-2'
    ];
    
    const anchors = [
        'animatori petreceri copii Floreasca',
        'animatori copii în Floreasca',
        'petreceri copii în zona Floreasca'
    ];

    let anchorIdx = 0;
    for (let slug of sourceSlugs) {
        const { data: page } = await supabase.from('kassia_pages').select('id').ilike('path', '%' + slug + '%').limit(1).single();
        if (page) {
            // Check if link already exists
            const { data: existing } = await supabase.from('kassia_internal_links').select('*').eq('source_page_id', page.id).eq('target_page_id', targetId);
            if (!existing || existing.length === 0) {
                await supabase.from('kassia_internal_links').insert({
                    source_page_id: page.id,
                    target_page_id: targetId,
                    anchor_text: anchors[anchorIdx % anchors.length]
                });
                console.log(`Added link from ${slug} to Floreasca`);
                anchorIdx++;
            } else {
                console.log(`Link from ${slug} to Floreasca already exists.`);
            }
        }
    }
    
    console.log("Internal links setup complete.");
}

addInternalLinks();
