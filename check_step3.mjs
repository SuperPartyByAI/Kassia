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

async function checkDb() {
    const pId = '3eb2c5d4-4a6f-4993-8755-de75ac9fa606';
    const sId = '97fb3aa2-9216-4313-9da6-6fccc042c2b2';
    const { data: pData } = await supabase.from('kassia_pages').select('status, index_status, include_in_sitemap').eq('id', pId).single();
    const { data: sData } = await supabase.from('kassia_pages').select('status, index_status, include_in_sitemap').eq('id', sId).single();
    
    console.log(JSON.stringify({
        primary_status: pData.status,
        primary_index_status: pData.index_status,
        primary_include_in_sitemap: pData.include_in_sitemap,
        secondary_status: sData.status,
        secondary_index_status: sData.index_status,
        secondary_include_in_sitemap: sData.include_in_sitemap
    }, null, 2));
}

checkDb();
