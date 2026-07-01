import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
import WebSocket from 'ws';
import fs from 'fs';
dotenv.config({ path: '.env.local' });

const supabaseUrl = process.env.PUBLIC_SUPABASE_URL || process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseKey, { auth: { persistSession: false }, global: { fetch: fetch }, realtime: { transport: WebSocket } });

async function run() {
    const { data: pageS6 } = await supabase.from('kassia_pages').select('id, slug').eq('slug', 'animatori-petreceri-copii-sector-6').single();
    if (!pageS6) return console.log('Sector 6 page not found');
    
    const { data: s6Sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageS6.id).order('sort_order');
    
    const { data: pageVoluntari } = await supabase.from('kassia_pages').select('id, slug').eq('slug', 'animatori-petreceri-copii-voluntari').single();
    let volSections = [];
    if (pageVoluntari) {
        const { data: vs } = await supabase.from('kassia_page_sections').select('*').eq('page_id', pageVoluntari.id).order('sort_order');
        volSections = vs;
    }

    fs.writeFileSync('/Users/universparty/wa-web-launcher/kassia-site/sector6_db_sections.json', JSON.stringify({ s6: s6Sections, voluntari: volSections }, null, 2));
    console.log("DB dump saved.");
}

run().catch(console.error);
