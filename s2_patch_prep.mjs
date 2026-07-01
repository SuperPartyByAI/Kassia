import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_ID = 'f1e7d23a-c1a7-4c92-b4ff-5716df63309a'; // Sector 2
const S1_PAGE_ID = '33f0d4ca-9c60-4b2a-8fc5-c5cf7eb904f4'; // Sector 1

async function run() {
    // Page Row
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('id', PAGE_ID).single();
    console.log("=== RAW DB EVIDENCE ===");
    console.log(JSON.stringify({
        id: page.id,
        slug: page.slug,
        canonical_url: page.canonical_url,
        status: page.status,
        index_status: page.index_status,
        include_in_sitemap: page.include_in_sitemap,
        show_pricing_preview: page.show_pricing_preview,
        show_reviews: page.show_reviews,
        show_faq: page.show_faq,
        created_at: page.created_at,
        updated_at: page.updated_at
    }, null, 2));

    // FAQs check
    console.log("\n=== FAQ ROOT CAUSE ===");
    const { data: allFaqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', PAGE_ID);
    console.log(`Există FAQ inactive pentru Sector 2: ${allFaqs.filter(f => !f.is_visible).length > 0 ? 'YES' : 'NO'}`);
    console.log(`Există FAQ în alt tabel: N/A without scan`);
    
    // Forbidden Terms specific rows
    const ids = ['03b94f09-fe17-4e6d-8694-611b1ab33444', 'a3ea587f-a8c9-412d-8e0e-ff3e83f91370', '3ec02068-6175-4edb-a11c-5767af05b960', 'a0521fbd-ae70-4f34-a7d0-df993b743741'];
    const { data: forbiddenSections } = await supabase.from('kassia_page_sections').select('*').in('id', ids);
    console.log("\n=== FORBIDDEN TERMS BEFORE ===");
    console.log(JSON.stringify(forbiddenSections.map(s => ({ id: s.id, section_type: s.section_type, order_index: s.order_index, content: s.content })), null, 2));

    // Reviews Check
    const { data: s2Sections } = await supabase.from('kassia_page_sections').select('id, section_type, order_index, heading').eq('page_id', PAGE_ID).order('order_index');
    const { data: s1Sections } = await supabase.from('kassia_page_sections').select('id, section_type, order_index, heading').eq('page_id', S1_PAGE_ID).order('order_index');
    
    console.log("\n=== REVIEWS CAUSE ===");
    const s2Types = s2Sections.map(s => s.section_type);
    const s1Types = s1Sections.map(s => s.section_type);
    console.log(`S2 Section Types: ${s2Types.join(', ')}`);
    console.log(`S1 Section Types: ${s1Types.join(', ')}`);
    
    console.log("\n=== ORDER MAP S2 ===");
    console.log(JSON.stringify(s2Sections, null, 2));

}
run().catch(console.error);
