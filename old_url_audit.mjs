import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('*').eq('slug', 'animatori-copii-sector-6').single();
    if (!page) {
        console.log("old URL DB ROW nu există.");
        return;
    }
    const { data: sections } = await supabase.from('kassia_page_sections').select('id').eq('page_id', page.id);
    const { data: internalLinks } = await supabase.from('kassia_internal_links').select('id').eq('source_page_id', page.id);
    const { data: internalLinksTarget } = await supabase.from('kassia_internal_links').select('id').eq('target_page_id', page.id);
    
    console.log("OLD URL DB ROW:");
    console.log(`există în kassia_pages — YES`);
    console.log(`page_id: ${page.id}`);
    console.log(`slug: ${page.slug}`);
    console.log(`status curent: ${page.status}`);
    console.log(`index_status: ${page.index_status}`);
    console.log(`include_in_sitemap: ${page.include_in_sitemap}`);
    console.log(`canonical_url dacă există: ${page.canonical_url || 'null'}`);
    console.log(`updated_at: ${page.updated_at}`);
    console.log(`dacă are secțiuni asociate în kassia_page_sections — ${sections && sections.length > 0 ? 'YES' : 'NO'}`);
    console.log(`dacă are internal links în kassia_internal_links — ${(internalLinks && internalLinks.length > 0) || (internalLinksTarget && internalLinksTarget.length > 0) ? 'YES' : 'NO'}`);
}

run().catch(console.error);
