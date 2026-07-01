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

const BACKUP_DIR = '/Users/universparty/wa-web-launcher/kassia-site/audit_kassia_orphan_activation_v23/backups';
if (!fs.existsSync(BACKUP_DIR)) fs.mkdirSync(BACKUP_DIR, { recursive: true });

async function backup() {
    console.log("Starting Backup Task 1...");
    const pSlug = "animatori-petreceri-copii-floreasca";
    const sSlug = "animatori-copii-floreasca";

    // Primary
    const { data: pData } = await supabase.from('kassia_pages').select('*').ilike('path', '%' + pSlug + '%').limit(1).single();
    if (pData) fs.writeFileSync(path.join(BACKUP_DIR, 'floreasca_primary_before.json'), JSON.stringify(pData, null, 2));
    else console.log("Primary not found in DB!");

    // Secondary
    const { data: sData } = await supabase.from('kassia_pages').select('*').ilike('path', '%' + sSlug + '%').limit(1).single();
    if (sData) fs.writeFileSync(path.join(BACKUP_DIR, 'floreasca_secondary_before.json'), JSON.stringify(sData, null, 2));
    else console.log("Secondary not found in DB!");

    // Sections
    let sections = [];
    if (pData) {
        const { data: pSec } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pData.id);
        if (pSec) sections.push(...pSec);
    }
    if (sData) {
        const { data: sSec } = await supabase.from('kassia_page_sections').select('*').eq('page_id', sData.id);
        if (sSec) sections.push(...sSec);
    }
    
    fs.writeFileSync(path.join(BACKUP_DIR, 'floreasca_sections_before.json'), JSON.stringify(sections, null, 2));
    console.log("Backup complete.");
}

backup();
