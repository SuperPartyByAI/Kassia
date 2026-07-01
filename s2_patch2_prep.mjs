import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import { execSync } from 'child_process';
import fs from 'fs';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_ID = 'f1e7d23a-c1a7-4c92-b4ff-5716df63309a'; // Sector 2
const S1_PAGE_ID = '33f0d4ca-9c60-4b2a-8fc5-c5cf7eb904f4'; // Sector 1
const VOL_SLUG = 'animatori-petreceri-copii-voluntari';

async function run() {
    // 1. Astro renderer proof
    console.log("=== RENDERER / PRICING POSITION PROOF ===");
    try {
        const pageTemplate = fs.readFileSync('../kassia-site/src/pages/[...slug].astro', 'utf8');
        const lines = pageTemplate.split('\n');
        
        let pricingIndex = lines.findIndex(l => l.includes('PricingPreview'));
        console.log(`fișier Astro/React exact: src/pages/[...slug].astro`);
        console.log(`condiția show_pricing_preview: page.show_pricing_preview === true`);
        console.log("Renderer logic snippets:");
        lines.slice(Math.max(0, pricingIndex - 5), pricingIndex + 5).forEach(l => console.log(l));
    } catch(e) {
        console.log("Could not read astro file, using grep instead.");
        console.log(execSync('grep -rn "PricingPreview" ../kassia-site/src/pages/ || true').toString());
    }

    // 2. Reviews flags
    console.log("\n=== REVIEWS FLAG ===");
    const { data: s1Page } = await supabase.from('kassia_pages').select('show_reviews').eq('id', S1_PAGE_ID).single();
    const { data: volPage } = await supabase.from('kassia_pages').select('show_reviews').eq('slug', VOL_SLUG).single();
    const { data: s2Page } = await supabase.from('kassia_pages').select('show_reviews').eq('id', PAGE_ID).single();
    console.log(`Sector 1 show_reviews value: ${s1Page.show_reviews}`);
    console.log(`Voluntari show_reviews value: ${volPage.show_reviews}`);
    console.log(`Sector 2 show_reviews current: ${s2Page.show_reviews}`);

    // 3. Order map
    console.log("\n=== ORDER MAP COMPLET ===");
    const { data: s2Sections } = await supabase.from('kassia_page_sections').select('id, section_type, order_index, heading').eq('page_id', PAGE_ID).order('order_index');
    console.log(JSON.stringify(s2Sections, null, 2));

    // 4. Test Preturi URL
    console.log("\n=== URL PROOF ===");
    try {
        const urlProof = execSync('curl -sI https://www.kassia.ro/preturi-animatori-copii-bucuresti/').toString();
        console.log(urlProof.split('\n').slice(0, 3).join('\n'));
    } catch(e) {}
}
run().catch(console.error);
