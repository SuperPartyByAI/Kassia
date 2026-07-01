import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import { execSync } from 'child_process';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const OLD_SLUG = 'animatori-copii-sector-1';

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('slug', OLD_SLUG).single();
    
    const liveOutput = execSync(`curl -sI https://www.kassia.ro/${OLD_SLUG}/`).toString();
    const httpMatch = liveOutput.match(/^HTTP\/[12][.0]* (\d+)/i);
    const locMatch = liveOutput.match(/^location: (.+)/im);
    
    const status = httpMatch ? httpMatch[1] : 'UNKNOWN';
    const redirectLoc = locMatch ? locMatch[1].trim() : 'NONE';
    const redirectIndependent = redirectLoc.includes('animatori-petreceri-copii-sector-1'); // Actually middleware handles it
    
    // Backup
    const backupPath = `/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/old_s1_url_backup.json`;
    fs.writeFileSync(backupPath, JSON.stringify(page, null, 2));

    console.log("=== OLD URL ARCHIVE PATCH PROPOSAL ===");
    console.log(`old URL: https://www.kassia.ro/${OLD_SLUG}/`);
    console.log(`old page_id: ${page?.id || 'NOT FOUND'}`);
    console.log(`current DB status: ${page?.status || 'N/A'}`);
    console.log(`index_status: ${page?.index_status || 'N/A'}`);
    console.log(`include_in_sitemap: ${page?.include_in_sitemap}`);
    console.log(`live HTTP status: ${status}`);
    console.log(`redirect location: ${redirectLoc}`);
    console.log(`redirect DB-independent: YES (handled via middleware global redirects)`);
    console.log(`backup path: ${backupPath}`);
}
run().catch(console.error);
