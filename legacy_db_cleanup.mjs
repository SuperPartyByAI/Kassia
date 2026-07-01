import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '/Users/universparty/wa-web-launcher/kassia-site/.env.local' });

const sb = createClient(process.env.PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY, {
    realtime: { transport: WebSocket }
});

const legacyPaths = [
    "/animatori-copii-sector-2/",
    "/animatori-copii-sector-3/",
    "/animatori-copii-sector-4/",
    "/animatori-copii-sector-5/",
    "/animatori-copii-la-evenimente-private-bucuresti/",
    "/animatori-pentru-copii-mici-bucuresti/"
];

async function run() {
    console.log("=== DB CLEANUP FOR SITEMAP EXCLUSION ===");
    for (const path of legacyPaths) {
        console.log(`Updating DB for ${path}...`);
        
        // Remove trailing slash for slug check just in case it's slug based, but the table usually has 'path'
        const { data, error } = await sb.from('kassia_pages')
            .update({ status: 'draft', include_in_sitemap: false })
            .eq('path', path);
            
        if (error) {
            console.error(`Error updating ${path}:`, error.message);
        } else {
            console.log(`Successfully deactivated ${path}`);
        }
    }
    console.log("Done.");
}

run();
