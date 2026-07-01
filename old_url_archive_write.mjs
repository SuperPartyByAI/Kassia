import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import fs from 'fs';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_ID = '6d71b367-de38-4f9a-a4cb-acdc1df76700';

async function run() {
    console.log("=== PRE-WRITE BACKUP & VERIFICATION ===");
    const { data: page, error: pageErr } = await supabase.from('kassia_pages').select('*').eq('id', PAGE_ID).single();
    if (pageErr) throw pageErr;
    
    if (page.include_in_sitemap !== false || page.index_status !== 'noindex') {
        console.error("Verification failed: include_in_sitemap must be false and index_status must be noindex.");
        return;
    }
    console.log("Verification passed: include_in_sitemap=false, index_status=noindex");
    
    const { data: sections, error: secErr } = await supabase.from('kassia_page_sections').select('*').eq('page_id', PAGE_ID);
    if (secErr) throw secErr;
    
    const backupObj = { page, sections };
    const backupPath = '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/old_s6_url_backup.json';
    fs.writeFileSync(backupPath, JSON.stringify(backupObj, null, 2));
    console.log(`Backup saved to: ${backupPath}`);
    
    console.log("=== EXECUTING WRITE ===");
    const { error: updErr } = await supabase.from('kassia_pages').update({ status: 'archived', updated_at: new Date().toISOString() }).eq('id', PAGE_ID);
    if (updErr) throw updErr;
    console.log("Updated status to 'archived'.");
}

run().catch(console.error);
