import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: pages } = await supabase
        .from('kassia_pages')
        .select('id, slug, page_type, status, show_pricing_preview, h1')
        .in('page_type', ['location', 'satellite'])
        .eq('status', 'published')
        .order('slug', { ascending: true });
        
    console.log("=== LISTĂ PAGINI LOCALE (PUBLISHED) ===");
    if (pages && pages.length > 0) {
        pages.forEach(p => {
            let note = "";
            if (p.slug.includes('sector-6')) note = " -> [HOLD / GSC REQUESTED]";
            if (p.slug.includes('popesti')) note = " -> [HOLD / GSC REQUESTED]";
            if (p.slug.includes('voluntari')) note = " -> [PRICING ACTIVE]";
            
            console.log(`- /${p.slug}/ (Pricing: ${p.show_pricing_preview ? 'ACTIVE' : 'INACTIVE'})${note}`);
        });
    } else {
        // Fallback if page_type is not accurately set
        const { data: allPages } = await supabase
            .from('kassia_pages')
            .select('id, slug, status, show_pricing_preview')
            .eq('status', 'published');
        
        const localKeywords = ['sector', 'voluntari', 'popesti', 'corbeanca', 'otopeni', 'chiajna', 'bragadiru', 'pantelimon', 'chitila', 'ilfov', 'snagov', 'tunari'];
        const localPages = allPages.filter(p => localKeywords.some(k => p.slug.includes(k)));
        
        localPages.forEach(p => {
            let note = "";
            if (p.slug.includes('sector-6')) note = " -> [HOLD / GSC REQUESTED]";
            if (p.slug.includes('popesti')) note = " -> [HOLD / GSC REQUESTED]";
            if (p.slug.includes('voluntari')) note = " -> [PRICING ACTIVE]";
            console.log(`- /${p.slug}/ (Pricing: ${p.show_pricing_preview ? 'ACTIVE' : 'INACTIVE'})${note}`);
        });
    }
}
run().catch(console.error);
