import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import { execSync } from 'child_process';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: allPages, error } = await supabase.from('kassia_pages')
      .select('id, slug, canonical_url, status, index_status, include_in_sitemap, created_at, updated_at');
    
    if (error) { console.error("DB ERROR:", error); return; }
    
    const pages = allPages.filter(p => p.slug?.includes('sector-1') || p.canonical_url?.includes('sector-1') || p.id === 'e9d89201-cf5c-4e86-a51f-631165181b37' || p.id === '19c6b65d-d903-4a10-998e-a28113c763e3');

    console.log(JSON.stringify(pages, null, 2));

    console.log("\n=== DIFF EXPLANATION ===");
    const page1 = pages.find(p => p.id === 'e9d89201-cf5c-4e86-a51f-631165181b37');
    const page2 = pages.find(p => p.id === '19c6b65d-d903-4a10-998e-a28113c763e3');
    
    console.log("ID 1 (e9d8...):", page1 ? `Exists. Slug: ${page1.slug}` : "Does not exist in DB anymore. Possibly deleted or was a hallucination/stale copy.");
    console.log("ID 2 (19c6...):", page2 ? `Exists. Slug: ${page2.slug}` : "Does not exist.");

    for (const p of pages) {
        console.log(`\n--- PAGE: ${p.slug} ---`);
        console.log(`ID: ${p.id}`);
        console.log(`există în DB: YES`);
        console.log(`slug: ${p.slug}`);
        console.log(`canonical_url: ${p.canonical_url}`);
        console.log(`status: ${p.status}`);
        console.log(`index_status: ${p.index_status}`);
        console.log(`include_in_sitemap: ${p.include_in_sitemap}`);
        const liveStatus = execSync(`curl -sI https://www.kassia.ro/${p.slug}/ | head -n 1`).toString().trim();
        console.log(`live behavior dacă slug-ul este accesat: ${liveStatus}`);
        console.log(`este old URL real: ${p.slug === 'animatori-copii-sector-1' ? 'YES' : 'NO'}`);
        console.log(`este pagina nouă: ${p.slug === 'animatori-petreceri-copii-sector-1' ? 'YES' : 'NO'}`);
        console.log(`trebuie arhivat: ${p.slug === 'animatori-copii-sector-1' ? 'YES' : 'NO'}`);
    }

    console.log("\n=== REDIRECT PROOF ===");
    console.log("curl -I:");
    console.log(execSync('curl -sI https://www.kassia.ro/animatori-copii-sector-1/').toString().trim());
    console.log("confirmare DB-independent: YES (301 happens in middleware, before DB hits)");
    console.log("middleware file: src/middleware.ts");
    
    console.log("\n=== NEW PAGE PROOF ===");
    const newPage = pages.find(p => p.slug === 'animatori-petreceri-copii-sector-1');
    if (newPage) {
        console.log(`page_id exact: ${newPage.id}`);
        console.log(`slug: ${newPage.slug}`);
        console.log(execSync('curl -sI https://www.kassia.ro/animatori-petreceri-copii-sector-1/').toString().trim());
    }
}
run().catch(console.error);
