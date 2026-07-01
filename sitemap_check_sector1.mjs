import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import { execSync } from 'child_process';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_ID = '33f0d4ca-9c60-4b2a-8fc5-c5cf7eb904f4';

async function run() {
    console.log("=== URL LIVE ===");
    try {
        const out = execSync(`curl -sI 'https://www.kassia.ro/animatori-petreceri-copii-sector-1/'`).toString();
        const html = execSync(`curl -sL 'https://www.kassia.ro/animatori-petreceri-copii-sector-1/'`).toString();
        const canon = html.match(/<link rel="canonical" href="([^"]+)"/);
        const robots = html.match(/<meta name="robots" content="([^"]+)"/);
        console.log("HTTP status:\n", out.split('\n').filter(l => l.toLowerCase().startsWith('http/')).join('\n'));
        console.log("canonical self:", canon ? canon[1] : 'Not found');
        console.log("robots:", robots ? robots[1] : 'Not found');
    } catch(e) { console.log(e.message); }

    console.log("\n=== SITEMAP INDEX ===");
    let indexXml = '';
    try {
        const out1 = execSync(`curl -sL 'https://www.kassia.ro/sitemap.xml'`).toString();
        const out2 = execSync(`curl -sL 'https://www.kassia.ro/sitemap-index.xml'`).toString();
        if (out1.includes('<?xml')) {
            console.log("Found sitemap.xml");
            indexXml = out1;
        }
        if (out2.includes('<?xml')) {
            console.log("Found sitemap-index.xml");
            indexXml = out2;
        }
    } catch(e) {}
    
    let subSitemaps = [];
    if (indexXml) {
        const matches = indexXml.matchAll(/<loc>([^<]+)<\/loc>/g);
        for (const match of matches) {
            subSitemaps.push(match[1]);
            console.log("Found sub-sitemap:", match[1]);
        }
    }

    if (subSitemaps.length === 0) {
        // Maybe it's not an index, maybe sitemap-0.xml exists
        try {
            const out = execSync(`curl -sL 'https://www.kassia.ro/sitemap-0.xml'`).toString();
            if (out.includes('<?xml')) {
                console.log("Found sitemap-0.xml directly");
                subSitemaps.push('https://www.kassia.ro/sitemap-0.xml');
            }
        } catch(e) {}
    }

    console.log("\n=== SITEMAP CONTENTS ===");
    let foundSitemap = null;
    let rawOutput = '';
    for (const sm of subSitemaps) {
        try {
            const content = execSync(`curl -sL '${sm}'`).toString();
            // Try to find the exact url or close matches
            const lines = content.split('\n');
            const matchLine = lines.find(l => l.includes('animatori-petreceri-copii-sector-1'));
            if (matchLine) {
                foundSitemap = sm;
                rawOutput = matchLine.trim();
                break;
            } else {
                // look for the old url just in case
                const oldMatchLine = lines.find(l => l.includes('animatori-copii-sector-1'));
                if (oldMatchLine) {
                    console.log(`WARNING: Found OLD URL in ${sm}: ${oldMatchLine.trim()}`);
                }
            }
        } catch(e) {}
    }

    console.log(`found in sitemap: ${foundSitemap ? 'YES' : 'NO'}`);
    console.log(`sitemap file exact: ${foundSitemap || 'N/A'}`);
    console.log(`output brut grep:\n${rawOutput || 'NOT FOUND'}`);

    console.log("\n=== DB SITEMAP FLAGS ===");
    const { data: page } = await supabase.from('kassia_pages').select('slug, status, index_status, include_in_sitemap, canonical_url, updated_at').eq('id', PAGE_ID).single();
    console.log(JSON.stringify(page, null, 2));

    console.log("\n=== CAUSE ANALYSIS ===");
    if (!foundSitemap) {
        if (page.include_in_sitemap === false) {
            console.log("Cause: DB flag greșit (include_in_sitemap is false)");
        } else if (page.status !== 'published') {
            console.log("Cause: DB flag greșit (status is not published)");
        } else if (page.index_status !== 'index') {
            console.log("Cause: DB flag greșit (index_status is not index)");
        } else {
            console.log("Cause: static sitemap neregenerat / cache (Astro SSG sitemap build not triggered/deployed after adding new DB row or flag).");
        }
    } else {
        console.log("Cause: N/A. It IS in the sitemap.");
    }
}

run().catch(console.error);
