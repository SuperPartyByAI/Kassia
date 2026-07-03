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

async function deactivateSecondary() {
    const sId = '97fb3aa2-9216-4313-9da6-6fccc042c2b2';
    const { error } = await supabase.from('kassia_pages').update({
        status: 'draft',
        include_in_sitemap: false,
        index_status: 'noindex'
    }).eq('id', sId);
    
    if (error) {
        console.error("Error deactivating secondary:", error);
    } else {
        console.log("Secondary deactivated successfully.");
    }
}

deactivateSecondary();
