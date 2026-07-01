import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import fs from 'fs';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    // 1. Get Page ID
    const { data: pageS6, error: pageErr } = await supabase.from('kassia_pages').select('*').eq('slug', 'animatori-petreceri-copii-sector-6').single();
    if (pageErr || !pageS6) return console.log('Error finding Sector 6 page', pageErr);
    
    // 2. Backup sections
    const { data: s6Sections, error: secErr } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageS6.id).order('order_index', { ascending: true });
    if (secErr) return console.log('Error fetching sections', secErr);
    
    fs.writeFileSync('/Users/universparty/wa-web-launcher/kassia-site/sector6_backup.json', JSON.stringify({ page: pageS6, sections: s6Sections }, null, 2));
    console.log(`Backup saved. Page ID: ${pageS6.id}`);
    
    // 3. Find exact IDs
    const patch1Target = s6Sections.find(s => s.heading === 'Detalii pentru programul de animație');
    const patch2Target = s6Sections.find(s => s.heading === 'Activități care se pot integra în program');
    const insertAfterTarget = s6Sections.find(s => s.heading && s.heading.includes('Pentru ce evenimente'));
    
    console.log('--- TARGET IDs ---');
    console.log(`PATCH 1 ID: ${patch1Target ? patch1Target.id : 'NOT FOUND'}`);
    console.log(`PATCH 2 ID: ${patch2Target ? patch2Target.id : 'NOT FOUND'}`);
    console.log(`INSERT AFTER ID: ${insertAfterTarget ? insertAfterTarget.id : 'NOT FOUND'} (order_index: ${insertAfterTarget ? insertAfterTarget.order_index : 'N/A'})`);
}

run().catch(console.error);
