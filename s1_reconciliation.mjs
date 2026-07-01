import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import { execSync } from 'child_process';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    console.log("=== DB QUERY ===");
    const { data: pages } = await supabase.from('kassia_pages')
      .select('id, slug, canonical_url, status, index_status, include_in_sitemap, redirect_to, created_at, updated_at')
      .or('slug.ilike.%sector-1%,canonical_url.ilike.%sector-1%');
    
    console.log(JSON.stringify(pages, null, 2));

    console.log("\n=== SPECIFIC IDs CHECK ===");
    const ids = ['e9d89201-cf5c-4e86-a51f-631165181b37', '19c6b65d-d903-4a10-998e-a28113c763e3'];
    for (const id of ids) {
        const page = pages?.find(p => p.id === id);
        console.log(`\nID: ${id}`);
        console.log(`Există în DB: ${page ? 'YES' : 'NO'}`);
        if (page) {
            console.log(`slug: ${page.slug}`);
            console.log(`canonical_url: ${page.canonical_url}`);
            console.log(`status: ${page.status}`);
            console.log(`index_status: ${page.index_status}`);
            console.log(`include_in_sitemap: ${page.include_in_sitemap}`);
            console.log(`este old URL real: ${page.slug === 'animatori-copii-sector-1' ? 'YES' : 'NO'}`);
            console.log(`este pagina nouă: ${page.slug === 'animatori-petreceri-copii-sector-1' ? 'YES' : 'NO'}`);
            console.log(`trebuie arhivat: ${page.slug === 'animatori-copii-sector-1' ? 'YES' : 'NO'}`);
        }
    }

    console.log("\n=== LIVE REDIRECT PROOF ===");
    const oldUrlOutput = execSync('curl -sI https://www.kassia.ro/animatori-copii-sector-1/').toString();
    console.log(oldUrlOutput.trim());
    
    console.log("\n=== MIDDLEWARE CHECK ===");
    const redirectData = execSync('grep -rn "animatori-copii-sector-1" ../kassia-site || true').toString();
    console.log(redirectData);
    
    console.log("\n=== NEW PAGE PROOF ===");
    const newPage = pages?.find(p => p.slug === 'animatori-petreceri-copii-sector-1');
    console.log(`page_id exact: ${newPage?.id || 'NOT FOUND'}`);
    console.log(`slug: ${newPage?.slug || 'NOT FOUND'}`);
    const newUrlOutput = execSync('curl -sI https://www.kassia.ro/animatori-petreceri-copii-sector-1/').toString();
    console.log("HTTP Status:");
    console.log(newUrlOutput.split('\n')[0]);
    console.log("robots:");
    console.log(newUrlOutput.split('\n').find(l => l.toLowerCase().includes('x-robots-tag')) || 'Not in headers, usually in DOM');
    
    console.log("\n=== INTERNAL LINKS CHECK ===");
    const { data: sections } = await supabase.from('kassia_page_sections').select('page_id, id, content');
    const { data: faqs } = await supabase.from('kassia_faqs').select('page_id, id, answer');
    
    let found = [];
    sections?.forEach(s => {
        const text = JSON.stringify(s.content);
        if (text.includes('animatori-copii-sector-1')) {
            found.push({ table: 'kassia_page_sections', row_id: s.id, field: 'content' });
        }
    });
    faqs?.forEach(f => {
        if (f.answer && f.answer.includes('animatori-copii-sector-1')) {
            found.push({ table: 'kassia_faqs', row_id: f.id, field: 'answer' });
        }
    });
    
    console.log(`matches count: ${found.length}`);
    if (found.length > 0) {
        console.table(found);
    }
}
run().catch(console.error);
