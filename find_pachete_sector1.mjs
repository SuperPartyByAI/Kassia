import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';

dotenv.config({ path: '.env.local' });
const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

const PAGE_SLUG = 'animatori-petreceri-copii-sector-1';

async function run() {
    const { data: page } = await supabase.from('kassia_pages').select('id').eq('slug', PAGE_SLUG).single();
    if (!page) { console.log('Page not found'); return; }

    const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id);
    
    let findings = [];
    sections.forEach(s => {
        let hasPachete = false;
        let field = '';
        let originalText = '';
        
        // Use strict word boundary for "pachete" and "pachet"
        const regex = /\b(pachet|pachete)\b/i;
        
        if (s.heading && regex.test(s.heading)) {
            hasPachete = true; field = 'heading'; originalText = s.heading;
        } else if (s.content?.subheading && regex.test(s.content.subheading)) {
            hasPachete = true; field = 'content.subheading'; originalText = s.content.subheading;
        } else if (s.content?.body && regex.test(s.content.body)) {
            hasPachete = true; field = 'content.body'; originalText = s.content.body;
        }
        
        if (hasPachete) {
            findings.push({
                section_id: s.id,
                section_type: s.section_type,
                order_index: s.order_index,
                field: field,
                originalText: originalText
            });
        }
    });
    
    console.log("=== DB EVIDENCE FOR 'PACHETE' ===");
    console.log(JSON.stringify(findings, null, 2));
}

run().catch(console.error);
