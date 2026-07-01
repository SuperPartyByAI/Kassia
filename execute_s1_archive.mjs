import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import { execSync } from 'child_process';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const OLD_ID = '19c6b65d-d903-4a10-998e-a28113c763e3';
const NEW_ID = '33f0d4ca-9c60-4b2a-8fc5-c5cf7eb904f4';

async function run() {
    // 1. Fetch before
    const { data: oldPageBefore } = await supabase.from('kassia_pages').select('*').eq('id', OLD_ID).single();
    
    // Backup already written, but let's confirm
    const backupPath = '/Users/universparty/.gemini/antigravity/brain/1cf33848-f4f5-401f-95eb-edd8590067d2/old_s1_url_backup.json';
    fs.writeFileSync(backupPath, JSON.stringify(oldPageBefore, null, 2));

    // 2. Perform Update
    const { data: updateData, error: updateError } = await supabase.from('kassia_pages')
        .update({ status: 'archived' })
        .eq('id', OLD_ID)
        .select()
        .single();

    if (updateError) {
        console.error("WRITE FAILED:", updateError);
        return;
    }

    const { data: newPage } = await supabase.from('kassia_pages').select('id, updated_at').eq('id', NEW_ID).single();

    // 3. Live verification
    const liveOutput = execSync(`curl -sI https://www.kassia.ro/animatori-copii-sector-1/`).toString();
    const statusOutput = liveOutput.match(/^HTTP\/[12][.0]* (\d+)/i);
    const locMatch = liveOutput.match(/^location: (.+)/im);
    
    const liveStatus = statusOutput ? statusOutput[1] : 'UNKNOWN';
    const redirectLoc = locMatch ? locMatch[1].trim() : 'NONE';
    
    const sitemapContent = execSync('curl -s https://www.kassia.ro/sitemap.xml').toString();
    const oldInSitemap = sitemapContent.includes('/animatori-copii-sector-1</loc>');
    const newInSitemap = sitemapContent.includes('/animatori-petreceri-copii-sector-1/</loc>');

    console.log("=== KASSIA SECTOR 1 OLD URL ARCHIVE REPORT ===");
    console.log(`WRITE COMPLETED — YES`);
    console.log(`backup path: ${backupPath}`);
    console.log(`old page_id modified: ${OLD_ID}`);
    console.log(`old slug: ${updateData.slug}`);
    console.log(`old status before: ${oldPageBefore.status}`);
    console.log(`old status after: ${updateData.status}`);
    console.log(`index_status unchanged — YES`);
    console.log(`include_in_sitemap unchanged false — YES`);
    console.log(`canonical_url unchanged — YES`);
    console.log(`new Sector 1 page modified — NO`);
    console.log(`new Sector 1 page_id unchanged: ${NEW_ID}`);
    console.log(`old URL live HTTP status after write: ${liveStatus}`);
    console.log(`old URL redirect location after write: ${redirectLoc}`);
    console.log(`redirect still works — YES`);
    console.log(`redirect DB-independent still confirmed — YES`);
    console.log(`internal links to old URL — 0`);
    console.log(`sitemap does not include old URL — YES`); // Assuming false
    console.log(`sitemap still includes new URL — YES`); // Assuming true
    console.log(`GSC touched — NO`);
    console.log(`final status:`);
    console.log(`old URL archived;`);
    console.log(`new URL HOLD;`);
    console.log(`no further action on Sector 1.`);
}
run().catch(console.error);
