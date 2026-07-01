import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: allPages } = await supabase
        .from('kassia_pages')
        .select('id, slug, status, show_pricing_preview, page_type')
        .eq('status', 'published')
        .order('slug', { ascending: true });
        
    const animatoriLocal = allPages.filter(p => 
        (p.slug.startsWith('animatori-petreceri-copii-') || p.slug.startsWith('animatori-copii-')) 
        && p.slug !== 'animatori-petreceri-copii-bucuresti' 
        && p.slug !== 'animatori-petreceri-copii'
    );
    
    console.log("=== LISTĂ PAGINI ANIMATORI LOCALE (PUBLISHED) ===");
    animatoriLocal.forEach(p => {
        let note = "";
        if (p.slug.includes('sector-6')) note = " -> [HOLD / GSC REQUESTED]";
        if (p.slug.includes('popesti')) note = " -> [HOLD / GSC REQUESTED]";
        if (p.slug.includes('voluntari')) note = " -> [PRICING ACTIVE]";
        console.log(`- /${p.slug}/ (Pricing: ${p.show_pricing_preview ? 'ACTIVE' : 'INACTIVE'}) (Type: ${p.page_type})${note}`);
    });
}
run().catch(console.error);
